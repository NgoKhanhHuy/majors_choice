use major
SET NOCOUNT ON;
go

CREATE PROCEDURE login
    @username VARCHAR(50),
    @password VARCHAR(100),
    @result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM users
    WHERE username = @username AND googleUser = 1)
    BEGIN
        SET @result = -2
    -- login failed, cannot login google account with normal login
    END
    ELSE IF EXISTS (SELECT 1
    FROM users
    WHERE username = @username AND password = @password AND active = 1)
    BEGIN
        SET @result = 1
    -- login successful
    END
    ELSE IF EXISTS (SELECT 1
    FROM users
    WHERE username = @username AND password = @password AND active = -1)
    BEGIN
        SET @result = -2
    -- user account deactivated by manager
    END
    ELSE IF EXISTS (SELECT 1
    FROM users
    WHERE username = @username AND backupPassword = @password AND active = 1)
    BEGIN
        SET @result = 1
        -- login successful with backup password, now replace password with backup password and set backup password to null
        UPDATE users
        SET password = backupPassword,
        backupPassword = NULL
        WHERE username = @username
    END
    ELSE IF EXISTS (SELECT 1
    FROM users
    WHERE username = @username AND active = 0)
    BEGIN
        SET @result = -1
    -- user not active
    END
    ELSE
    BEGIN
        SET @result = 0
    -- login failed
    END
END
GO

create procedure googleLogin
    @username varchar(50),
    @password varchar(100),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and password = @password and googleUser = 1 and active = 1)
    begin
        set @result = 1
    -- login successful
    end
    else
    begin
        set @result = 0
    -- login failed
    end
end
go

create procedure setGoogleUser
    @username varchar(50),
    @result int output
as
begin
    update users
    set googleUser = 1
    where username = @username
    set @result = 1
end
go

create procedure userExists
    @email varchar(50),
    @result int output
as
begin
    if exists (SELECT 1
    FROM userDetails
    WHERE email = @email)
    begin
        set @result = 1
    -- exists
    end
    else
    begin
        set @result = 0
    -- not exists
    end
end
go

create procedure forceActivate
    @username varchar(50),
    @result int output
as
begin
    update users
    set active = 1
    where username = @username
    set @result = 1
end
go

create procedure resetPassword
    @email varchar(100),
    @password varchar(100),
    @result int output
as
begin
    if exists (SELECT 1
    FROM userDetails
    WHERE email = @email)
    begin
        update users
        set backupPassword = @password
        where id = (select id
        from userDetails
        where email = @email)
        set @result = 1
    -- successful
    end
    else
    begin
        set @result = 0
    -- failed
    end
end    
go

create procedure activate
    -- if confirm code var = user confirm code, update active to 1 if active = 0
    @username varchar(50),
    @confirmCode varchar(10),
    @result int output
-- 1: successful, 0: failed
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and confirmCode = @confirmCode and active = 0)
    begin
        update users set active = 1 where username = @username
        set @result = 1
    -- successful
    end
    else
    begin
        set @result = 0
    -- failed
    end
end
go

CREATE PROCEDURE register
    @username varchar(50),
    @password varchar(100),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
    @confirmCode varchar(10),
    @result int OUTPUT
AS
BEGIN
    BEGIN
        -- Check if username exists
        IF EXISTS (SELECT 1
        FROM users
        WHERE username = @username)
        BEGIN
            SET @result = -1
        -- Username already exists
        END
        -- Check if email exists
        ELSE IF EXISTS (SELECT 1
        FROM userDetails
        WHERE email = @email)
        BEGIN
            SET @result = -2
        -- Email already exists
        END
        -- Check if phone number exists
        ELSE IF EXISTS (SELECT 1
        FROM userDetails
        WHERE phoneNumber = @phoneNumber)
        BEGIN
            SET @result = -3
        -- Phone number already exists
        END
        ELSE
        BEGIN
            -- Insert into users table
            INSERT INTO users
                (username, password, confirmCode)
            VALUES
                (@username, @password, @confirmCode)

            -- Get the last inserted ID
            DECLARE @uid INT
            SET @uid = SCOPE_IDENTITY()

            -- Insert into userDetails table
            INSERT INTO userDetails
                (id, fullname, email, phoneNumber, address, dateOfBirth)
            VALUES
                (@uid, @fullname, @email, @phoneNumber, @address, @dateOfBirth)

            SET @result = 1
        -- Registration successful
        END
    END
END
go

create or alter PROCEDURE addProductCPU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @socket nvarchar(10),
    @cores int,
    @threads int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @igpu nvarchar(50),
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, image, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @image, @name)

    DECLARE @id int
    SET @id = SCOPE_IDENTITY()

    INSERT INTO cpus
        (id, generation, socket, cores, threads, baseClock, boostClock, tdp, igpu)
    VALUES
        (@id, @generation, @socket, @cores, @threads, @baseClock, @boostClock, @tdp, @igpu)

    SET @result = 1
END
go

create PROCEDURE addProductGPU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @vram int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @name)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO gpus
        (id, generation, vram, baseClock, boostClock, tdp)
    VALUES
        (@id, @generation, @vram, @baseClock, @boostClock, @tdp)

    set @result = 1
END
go

create PROCEDURE addProductRAM
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @capacity int,
    @speed int,
    @latentcy int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, image, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @image, @name)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO rams
        (id, generation, capacity, speed, latency)
    VALUES
        (@id, @generation, @capacity, @speed, @latentcy)

    set @result = 1
END
go

create PROCEDURE addProductMotherboard
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @socket nvarchar(10),
    @chipset nvarchar(10),
    @igpu int,
    @formFactor nvarchar(50),
    @ramType nvarchar(10),
    @maxRamSpeed int,
    @maxRamCapacity int,
    @ramSlots int,
    @wifi int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, image, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @image, @name)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO motherboards
        (id, socket, chipset, igpu, formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi)
    VALUES
        (@id, @socket, @chipset, @igpu, @formFactor, @ramType, @maxRamSpeed, @maxRamCapacity, @ramSlots, @wifi)

    set @result = 1
END
go

create PROCEDURE addProductSSD
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @interface nvarchar(20),
    @capacity int,
    @cache int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, image, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @image, @name)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO ssds
        (id, interface, capacity, cache)
    VALUES
        (@id, @interface, @capacity, @cache)

    set @result = 1
END
go

create PROCEDURE addProductPSU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @wattage int,
    @efficiency nvarchar(20),
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, image, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @image, @name)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO psus
        (id, wattage, efficiency)
    VALUES
        (@id, @wattage, @efficiency)

    set @result = 1
END
go

CREATE PROCEDURE addProductCase
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @formFactor nvarchar(50),
    @color nvarchar(50),
    @image nvarchar(max),
    @quantity int,
    @result nvarchar(50) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE name = @name)
    BEGIN
        SET @result = '-1'
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice, quantity, image, name)
    VALUES
        (@sellingPrice, @costPrice, @quantity, @image, @name)

    DECLARE @id int
    SET @id = SCOPE_IDENTITY()

    INSERT INTO cases
        (id, formFactor, color)
    VALUES
        (@id, @formFactor, @color)

    SET @result = 1
END
GO

CREATE PROCEDURE loginEmployee
    @username VARCHAR(50),
    @password VARCHAR(25),
    @result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM staffs
    WHERE username = @username AND password = @password AND possition = 1 AND active = 1)
    BEGIN
        SET @result = 1
    -- login with the Manager role
    END
    ELSE IF EXISTS (SELECT 1
    FROM staffs
    WHERE username = @username AND password = @password AND possition = 0 AND active = 1)
    BEGIN
        SET @result = 0
    -- login with staff role
    END
    ELSE IF EXISTS (SELECT 1
    FROM staffs
    WHERE username = @username AND password = @password AND active = 0)
    BEGIN
        SET @result = -1
    -- login failed. Staff or Manager has been deactivated
    END
    ELSE 
    BEGIN
        SET @result = -2
    -- login failed. Staff or Manager not found
    END
END
go

CREATE PROCEDURE GetUserDetails
    @tablename varchar(25)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX)

    IF @tablename = 'staffs'
    BEGIN
        SET @sql = 'select username from staffs where possition = 0'
    END
    ELSE IF @tablename = 'users'
    BEGIN
        SET @sql = 'select username from users'
    END
    EXEC sp_executesql @sql
END
go

CREATE PROCEDURE updateUserInformation
    @username varchar(50),
    @password varchar(100),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
    @active int,
    @result int output
AS
BEGIN
    DECLARE @id int
    set @id = (select id
    from users
    where username = @username)

    -- Get user ID
    SELECT @id = id
    FROM users
    WHERE username = @username

    -- Check email existence
    IF @email IS NOT NULL AND EXISTS (SELECT 1
        FROM userDetails
        WHERE email = @email AND id <> @id)
    BEGIN
        SET @result = -1
        -- Email already exists
        RETURN
    END

    -- Check phone number existence
    IF @phoneNumber IS NOT NULL AND EXISTS (SELECT 1
        FROM userDetails
        WHERE phoneNumber = @phoneNumber AND id <> @id)
    BEGIN
        SET @result = -2
        -- Phone number already exists
        RETURN
    END

    -- Update user information
    IF @password IS NOT NULL
    BEGIN
        UPDATE users
        SET password = @password
        WHERE id = @id
    END

    IF @fullname IS NOT NULL
    BEGIN
        UPDATE userDetails
        SET fullname = @fullname
        WHERE id = @id
    END

    IF @email IS NOT NULL
    BEGIN
        UPDATE userDetails
        SET email = @email
        WHERE id = @id
    END

    IF @phoneNumber IS NOT NULL
    BEGIN
        UPDATE userDetails
        SET phoneNumber = @phoneNumber
        WHERE id = @id
    END

    IF @address IS NOT NULL
    BEGIN
        UPDATE userDetails
        SET address = @address
        WHERE id = @id
    END

    IF @dateOfBirth IS NOT NULL
    BEGIN
        UPDATE userDetails
        SET dateOfBirth = @dateOfBirth
        WHERE id = @id
    END

    IF @active IS NOT NULL
    BEGIN
        UPDATE users
        SET active = @active
        WHERE id = @id
    END

    SET @result = 1
END
go

create procedure getCPU
    @inputname varchar(50)
as
Begin
    select
        cpus.id,
        sellingPrice,
        costPrice,
        description,
        name,
        generation,
        socket,
        cores,
        threads,
        baseClock,
        boostClock,
        tdp,
        igpu,
        image,
        quantity
    from products
        join cpus on products.id = cpus.id
    where 1=1
        and (@inputname is null or name like '%'+@inputname+'%')
End
go

create procedure getGPU
    @inputname varchar(50)
as
begin
    select
        gpus.id,
        sellingPrice,
        costPrice,
        description,
        name,
        generation,
        vram,
        baseClock,
        boostClock,
        tdp,
        image,
        quantity
    from products
        join gpus on products.id = gpus.id
    where 1=1
        and (@inputname is null or name like '%'+@inputname+'%' )
end
go

create procedure getMotherboard
    @inputname varchar(50)
as
begin
    select
        motherboards.id,
        sellingPrice,
        costPrice,
        description,
        name,
        socket,
        chipset,
        formFactor,
        ramType,
        maxRamSpeed,
        maxRamCapacity,
        ramSlots,
        wifi,
        igpu,
        image,
        quantity
    from products
        join motherboards on products.id = motherboards.id
    where 1=1
        and (@inputname is null or name like '%'+@inputname+'%')
end
go

create procedure getRAM
    @inputname varchar(50)
as
begin
    select
        rams.id,
        sellingPrice,
        costPrice,
        description,
        name,
        generation,
        capacity,
        speed,
        latency,
        image,
        quantity
    from products
        join rams on products.id = rams.id
    where 1=1
        and (@inputname is null or name like '%'+@inputname+'%')
end
go

create procedure getSSD
    @inputname varchar(50)
as
begin
    select
        ssds.id,
        sellingPrice,
        costPrice,
        description,
        name,
        interface,
        capacity,
        cache,
        image,
        quantity
    from products
        join ssds on products.id = ssds.id
    where 1=1
        and (@inputname is null or name like '%'+@inputname+'%')
end
go

create procedure getPSU
    @inputname varchar(50)
as
begin

    select
        psus.id,
        sellingPrice,
        costPrice,
        description,
        name,
        wattage,
        efficiency,
        image,
        quantity
    from products
        join psus on products.id = psus.id
    where 1=1
        and (@inputname is null or name like '%'+@inputname+'%')
end
go

CREATE PROCEDURE getCase
    @inputname varchar(50)
AS
BEGIN
    SELECT
        cases.id,
        sellingPrice,
        costPrice,
        description,
        name,
        formFactor,
        color,
        image,
        quantity
    FROM products
        JOIN cases ON products.id = cases.id
    WHERE 1=1
        AND (@inputname IS NULL OR name LIKE '%' + @inputname + '%')
END
GO

create procedure deleteCart
    @userID int,
    @result int output
as
begin
    if exists (select 1
    from users
    where id = @userID)
    begin
        delete from carts
        where userID = @userID
        set @result = 1
    end
    else
    begin
        set @result = 0
    end
end
go

create procedure addToCart
    @userID int,
    @productID int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @result int output
as
begin
    if exists (select 1
    from users
    where id = @userID)
    begin
        insert into carts
            (userID, productID, sellingPrice, costPrice)
        values
            (@userID, @productID, @sellingPrice, @costPrice)
        set @result = 1
    end
    else
    begin
        set @result = 0
    end
end
go

create procedure getCart
    @userID int
as
begin
    select *
    from carts
    where userID = @userID
end
go

CREATE or alter PROCEDURE placeOrder
    @userID int,
    @result int OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM users
    WHERE id = @userID)
    BEGIN
        INSERT INTO orders
            (id, userId, productId, productName, sellingPrice, costPrice, status)
        SELECT
            (SELECT ISNULL(MAX(id), 0) + 1
            FROM orders),
            c.userID,
            c.productID,
            p.name,
            c.sellingPrice,
            c.costPrice,
            'Pending'
        FROM carts c
            JOIN products p ON c.productId = p.id
        WHERE c.userID = @userID

        DELETE FROM carts
        WHERE userID = @userID

        SET @result = 1
    END
    ELSE
    BEGIN
        SET @result = 0
    END
END
GO

create procedure addOrderInformation
    @fullname nvarchar(50),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @payment nvarchar(max)
as
begin
    declare @orderId int
    select @orderId = max(id)
    from orders

    insert into orderInformation
        (id, fullname, phoneNumber, address, payment)
    values
        (@orderId, @fullname, @phoneNumber, @address, @payment)
end
go

CREATE PROCEDURE getCartItems
    @userId int
AS
BEGIN
    SELECT
        c.productId,
        c.sellingPrice,
        c.costPrice,
        CASE 
            WHEN cpus.id IS NOT NULL THEN 'CPU'
            WHEN gpus.id IS NOT NULL THEN 'GPU'
            WHEN motherboards.id IS NOT NULL THEN 'Motherboard'
            WHEN rams.id IS NOT NULL THEN 'RAM'
            WHEN ssds.id IS NOT NULL THEN 'SSD'
            WHEN psus.id IS NOT NULL THEN 'PSU'
            WHEN cases.id IS NOT NULL THEN 'Case'
            ELSE 'Unknown'
        END AS productType
    FROM
        carts c
        LEFT JOIN cpus ON c.productId = cpus.id
        LEFT JOIN gpus ON c.productId = gpus.id
        LEFT JOIN motherboards ON c.productId = motherboards.id
        LEFT JOIN rams ON c.productId = rams.id
        LEFT JOIN ssds ON c.productId = ssds.id
        LEFT JOIN psus ON c.productId = psus.id
        LEFT JOIN cases ON c.productId = cases.id
    WHERE 
        c.userId = @userId
END
go

CREATE or alter PROCEDURE getOrders
    @userId int
AS
BEGIN
    SELECT
        o.id,
        o.userId,
        o.productId,
        o.productName,
        o.sellingPrice,
        o.costPrice,
        o.status,
        o.dateOrdered
    FROM
        orders o
    WHERE 
        (@userId = 0)
        OR (@userId > 0 AND o.userId = @userId)
        OR (@userId = -1 AND o.status IN ('Pending', 'Cancellation Denied, Shipping Pending'))
        OR (@userId = -2 AND o.status = 'Cancellation Requested')
        OR (@userId = -3 AND o.status = 'Cancellation Denied, Shipping Pending')
        OR (@userId = -4 AND o.status = 'Cancelled')
        OR (@userId = -5 AND o.status = 'Shipping')
        OR (@userId = -6 AND o.status = 'Completed')
    ORDER BY o.id DESC
END
go

CREATE PROCEDURE getOrderInformation
    @orderId int
AS
BEGIN
    SELECT
        fullname,
        phoneNumber,
        address,
        payment
    FROM
        orderInformation
    WHERE
        id = @orderId
END
go

CREATE PROCEDURE addStaff
    @username VARCHAR(50),
    @password VARCHAR(100),
    @fullname NVARCHAR(50),
    @result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM staffs
    WHERE username = @username)
    BEGIN
        SET @result = -1
    -- username already exists
    END
    ELSE
    BEGIN
        INSERT INTO staffs
            (username, password, possition, fullname)
        VALUES
            (@username, @password, 0, @fullname)
        SET @result = 1
    -- staff added successfully
    END
END
GO

CREATE PROCEDURE updateStaff
    @id INT,
    @username VARCHAR(50),
    @password VARCHAR(100),
    @fullname NVARCHAR(50),
    @active INT,
    @result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM staffs
    WHERE username = @username AND id != @id)
    BEGIN
        SET @result = -1
    -- username already exists
    END
    ELSE
    BEGIN
        UPDATE staffs
        SET username = ISNULL(@username, username),
            password = ISNULL(@password, password),
            fullname = ISNULL(@fullname, fullname),
            active = ISNULL(@active, active)
        WHERE id = @id
        SET @result = 1
    -- staff updated successfully
    END
END
GO

CREATE PROCEDURE RequestOrderCancel
    @OrderId INT
AS
BEGIN
    UPDATE orders
    SET status = 'Cancellation Requested'
    WHERE id = @OrderId
END
go

CREATE PROCEDURE ApproveOrderCancel
    @OrderId INT
AS
BEGIN
    UPDATE orders
    SET status = 'Cancelled'
    WHERE id = @OrderId
END
go

CREATE PROCEDURE DenyOrderCancel
    @OrderId INT
AS
BEGIN
    UPDATE orders
    SET status = 'Cancellation Denied, Shipping Pending'
    WHERE id = @OrderId
END
go

CREATE PROCEDURE ShipOrder
    @OrderId INT
AS
BEGIN
    UPDATE orders
    SET status = 'Shipping'
    WHERE id = @OrderId
END
go

CREATE PROCEDURE CompleteOrder
    @OrderId INT
AS
BEGIN
    UPDATE orders
    SET status = 'Completed'
    WHERE id = @OrderId
END
go

CREATE PROCEDURE getOrderStatus
    @orderId INT
AS
BEGIN
    SELECT TOP 1
        status
    FROM orders
    WHERE id = @orderId
END
go

CREATE or alter PROCEDURE updateProductCPU
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @igpu nvarchar(50),
    @socket nvarchar(10),
    @cores int,
    @threads int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM cpus
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE cpus
    SET generation = @generation,
		igpu = @igpu,
        socket = @socket,
        cores = @cores,
        threads = @threads,
        baseClock = @baseClock,
        boostClock = @boostClock,
        tdp = @tdp
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE or alter PROCEDURE updateProductGPU
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @vram int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM gpus
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE gpus
    SET generation = @generation,
        vram = @vram,
        baseClock = @baseClock,
        boostClock = @boostClock,
        tdp = @tdp
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE or alter PROCEDURE updateProductMotherboard
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @socket nvarchar(10),
    @chipset nvarchar(50),
    @igpu int,
    @formFactor nvarchar(50),
    @ramType nvarchar(50),
    @maxRamSpeed int,
    @maxRamCapacity int,
    @ramSlots int,
    @wifi bit,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM motherboards
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE motherboards
    SET socket = @socket,
        chipset = @chipset,
        igpu = @igpu,
        formFactor = @formFactor,
        ramType = @ramType,
        maxRamSpeed = @maxRamSpeed,
		maxRamCapacity =@maxRamCapacity,
        ramSlots = @ramSlots,
        wifi = @wifi
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE or alter PROCEDURE updateProductPSU
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @wattage int,
    @efficiency nvarchar(50),
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM psus
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE psus
    SET wattage = @wattage,
        efficiency = @efficiency
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE or alter PROCEDURE updateProductRAM
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @capacity int,
    @speed int,
    @latency int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM rams
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE rams
    SET generation = @generation,
        capacity = @capacity,
        speed = @speed,
        latency = @latency
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE or alter PROCEDURE updateProductSSD
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @interface nvarchar(50),
    @capacity int,
    @cache int,
    @image nvarchar(max),
    @quantity int,
    @result varchar(50) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM ssds
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE ssds
    SET interface = @interface,
        capacity = @capacity,
        cache = @cache
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE or alter PROCEDURE updateProductCase
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @formFactor nvarchar(50),
    @color nvarchar(50),
    @image nvarchar(max),
    @quantity int,
    @result nvarchar(50) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM products
               WHERE name = @name AND id != @id)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    IF NOT EXISTS (SELECT 1
    FROM cases
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID ' + CAST(@id AS nvarchar)
        RETURN
    END

    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice,
        quantity = @quantity,
        image = @image,
        name = @name
    WHERE id = @id

    UPDATE cases
    SET formFactor = @formFactor,
        color = @color
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

CREATE PROCEDURE ProductAdjust
    @productId INT,
    @count INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @currentQuantity INT;

    SELECT @currentQuantity = quantity
    FROM products
    WHERE id = @productId;

    IF @currentQuantity IS NOT NULL
    BEGIN
        DECLARE @newQuantity INT;
        SET @newQuantity = @currentQuantity + @count;

        IF @newQuantity >= 0
        BEGIN
            UPDATE products
            SET quantity = @newQuantity
            WHERE id = @productId;
        END
        ELSE
        BEGIN
            RAISERROR ('Insufficient product quantity in the warehouse.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR ('Product does not exist in the warehouse.', 16, 1);
    END
END
go

create procedure ProductQuantity
    @productId int
as
BEGIN
    select quantity
    from products
    where id = @productId
END
go

CREATE PROCEDURE GetEmailFromOrderId
    @OrderId INT
AS
BEGIN
    SELECT ud.email
    FROM userDetails ud
        JOIN orders o ON ud.id = o.userId
    WHERE o.id = @OrderId;
END;
go

CREATE PROCEDURE setQuantity
    @id int
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM products
    WHERE id = @id)
    BEGIN
        UPDATE products
        SET quantity = -1
        WHERE id = @id
    END
END
GO

CREATE PROCEDURE AddProductDescription
    @ProductId INT,
    @Description NVARCHAR(MAX)
AS
BEGIN
    -- Update the description in the products table
    UPDATE products
    SET description = @Description
    WHERE id = @ProductId;

    -- Optionally, check if the update was successful
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'No product found with the given ID.';
    END
END;
GO

create procedure addRating
    @productID int,
    @userID int,
    @ratingStar int,
    @ratingText nvarchar(max),
    @result int output
as
begin
    insert into ratings
        (productId, userId, rating_star, rating_text)
    values
        (@productID, @userID, @ratingStar, @ratingText)

    set @result = 1
end;
go

create procedure updateRatings
    @id int,
    @ratingStar int,
    @ratingText nvarchar(max),
    @result int output
as
begin
    IF NOT EXISTS (SELECT 1
    FROM ratings
    WHERE id = @id)
    BEGIN
        SET @result = 0
        --rating donesn't exist
        RETURN
    END

    update ratings
	set rating_star = @ratingStar,
		rating_text = @ratingText
	where id = @id;

    set @result = 1;
end;
go

create procedure getRatingsByProduct
    @productID int
as
begin
    select id,
        productId,
        userId,
        rating_star,
        rating_text,
        dateRated
    from ratings
    where productId = @productID
end;
go

create procedure checkUserRateProduct
    @userID int,
    @productID int,
    @result int output
as
begin
    IF EXISTS (SELECT 1
    FROM ratings
    WHERE userId = @userID and productId = @productID)
	begin
        set @result = 1
        -- user has rated this product
        return
    end
    else IF EXISTS (SELECT 1
    FROM orders
    WHERE status = 'Completed' and userId = @userID and productId = @productID)
	begin
        set @result = 0
        -- user has bought this product but not rated
        return
    end
	else
	begin
        set @result = -1
        --other
        return
    end
end;
go

CREATE PROCEDURE getMostPopular
AS
BEGIN
    SELECT TOP 4
        productId, COUNT(productId) AS ProductCount
    FROM orders
    GROUP BY productId
    ORDER BY ProductCount DESC
END
GO

CREATE OR ALTER PROCEDURE GetOrderStatistics
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    DECLARE @Sql NVARCHAR(MAX), @Params NVARCHAR(MAX);
    DECLARE @TotalOrders INT, @CompletedOrders INT, @TotalExpense DECIMAL(18,2), @TotalRevenue DECIMAL(18,2);
    DECLARE @Profit DECIMAL(18,2), @ProfitPercentage DECIMAL(18,2), @AverageOrderValue DECIMAL(18,2);
    DECLARE @TotalUsers INT, @UsersWithCompletedOrders INT, @PercentageUsersWithOrders DECIMAL(18,2);
    DECLARE @PercentageCompletedOrders DECIMAL(18,2), @PercentageCashOrders DECIMAL(18,2);
    DECLARE @UniqueCompletedOrders INT, @TotalCashOrders INT;

    DECLARE @WhereClause NVARCHAR(MAX) = ' WHERE 1=1 ';
    IF @StartDate IS NOT NULL
        SET @WhereClause += ' AND dateOrdered >= @StartDate ';
    IF @EndDate IS NOT NULL
        SET @WhereClause += ' AND dateOrdered <= @EndDate ';

    SET @Sql = N'SELECT @UniqueCompletedOrdersOut = COUNT(DISTINCT id) FROM orders ' + @WhereClause + ' AND status = ''Completed''';
    SET @Params = N'@UniqueCompletedOrdersOut INT OUTPUT, @StartDate DATE, @EndDate DATE';
    EXEC sp_executesql @Sql, @Params, @UniqueCompletedOrdersOut = @UniqueCompletedOrders OUTPUT, @StartDate = @StartDate, @EndDate = @EndDate;

    SET @Sql = N'SELECT @TotalOrdersOut = COUNT(*) FROM orders ' + @WhereClause;
    SET @Params = N'@TotalOrdersOut INT OUTPUT, @StartDate DATE, @EndDate DATE';
    EXEC sp_executesql @Sql, @Params, @TotalOrdersOut = @TotalOrders OUTPUT, @StartDate = @StartDate, @EndDate = @EndDate;

    SET @Sql = N'SELECT @CompletedOrdersOut = COUNT(*) FROM orders ' + @WhereClause + ' AND status = ''Completed''';
    SET @Params = N'@CompletedOrdersOut INT OUTPUT, @StartDate DATE, @EndDate DATE';
    EXEC sp_executesql @Sql, @Params, @CompletedOrdersOut = @CompletedOrders OUTPUT, @StartDate = @StartDate, @EndDate = @EndDate;

    SET @PercentageCompletedOrders = CASE WHEN @TotalOrders > 0 THEN (@CompletedOrders * 100.0) / @TotalOrders ELSE 0 END;

    SET @Sql = N'SELECT @TotalExpenseOut = SUM(costPrice), @TotalRevenueOut = SUM(sellingPrice) FROM orders ' + @WhereClause + ' AND status = ''Completed''';
    SET @Params = N'@TotalExpenseOut DECIMAL(18,2) OUTPUT, @TotalRevenueOut DECIMAL(18,2) OUTPUT, @StartDate DATE, @EndDate DATE';
    EXEC sp_executesql @Sql, @Params, @TotalExpenseOut = @TotalExpense OUTPUT, @TotalRevenueOut = @TotalRevenue OUTPUT, @StartDate = @StartDate, @EndDate = @EndDate;

    SET @Profit = @TotalRevenue - @TotalExpense;
    SET @ProfitPercentage = CASE WHEN @TotalRevenue > 0 THEN (@Profit / @TotalRevenue) * 100 ELSE 0 END;

    SET @Sql = N'SELECT @TotalUsersOut = COUNT(*) FROM users';
    SET @Params = N'@TotalUsersOut INT OUTPUT';
    EXEC sp_executesql @Sql, @Params, @TotalUsersOut = @TotalUsers OUTPUT;

    SET @Sql = N'SELECT @UsersWithCompletedOrdersOut = COUNT(DISTINCT userId) FROM orders ' + @WhereClause + ' AND status = ''Completed''';
    SET @Params = N'@UsersWithCompletedOrdersOut INT OUTPUT, @StartDate DATE, @EndDate DATE';
    EXEC sp_executesql @Sql, @Params, @UsersWithCompletedOrdersOut = @UsersWithCompletedOrders OUTPUT, @StartDate = @StartDate, @EndDate = @EndDate;

    SET @PercentageUsersWithOrders = CASE WHEN @TotalUsers > 0 THEN (@UsersWithCompletedOrders * 100.0) / @TotalUsers ELSE 0 END;

    SET @AverageOrderValue = CASE WHEN @CompletedOrders > 0 THEN @TotalRevenue / @CompletedOrders ELSE 0 END;

    SET @Sql = N'SELECT @TotalCashOrdersOut = COUNT(*) FROM orders o
                 JOIN orderInformation oi ON o.id = oi.id ' + @WhereClause + ' AND oi.payment IS NULL';
    SET @Params = N'@TotalCashOrdersOut INT OUTPUT, @StartDate DATE, @EndDate DATE';
    EXEC sp_executesql @Sql, @Params, @TotalCashOrdersOut = @TotalCashOrders OUTPUT, @StartDate = @StartDate, @EndDate = @EndDate;

    SET @PercentageCashOrders = CASE WHEN @TotalOrders > 0 THEN (@TotalCashOrders * 100.0) / @TotalOrders ELSE 0 END;

    SELECT
        @PercentageCompletedOrders AS PercentageCompletedOrders,
        @TotalExpense AS TotalExpense,
        @TotalRevenue AS TotalRevenue,
        @Profit AS Profit,
        @ProfitPercentage AS ProfitPercentage,
        @PercentageUsersWithOrders AS PercentageUsersWithCompletedOrders,
        @AverageOrderValue AS AverageOrderValue,
        @UniqueCompletedOrders AS UniqueCompletedOrders,
        @PercentageCashOrders AS PercentageCashOrders;
END
go

CREATE or alter PROCEDURE getFavoriteProducts
    @userId INT
AS
BEGIN
    SELECT * from favorites
    WHERE userId = @userId
END
go

create or alter procedure addFavorite
    @userId int,
    @productId int
as
BEGIN
    if exists (select 1
    from favorites
    where userId = @userId and productId = @productId)
    begin
        return
    end
    else
    begin
        insert into favorites
            (userId, productId)
        values
            (@userId, @productId)
    end
end
go

create or alter procedure removeFavorite
    @userId int,
    @productId int
as
BEGIN
    delete from favorites
    where userId = @userId and productId = @productId
end
GO

    create or alter procedure createCoupon
        @description nvarchar(max),
        @discount decimal(18,2),
        @code nvarchar(10),
        @expiry date,
        @minPurchase decimal(18,2),
        @maxDiscount decimal(18,2),
        @uses int,
        @result int output
    as
    begin
        if exists (select 1
        from coupons
        where code = @code)
        begin
            set @result = -1
            return
        end
        else
        begin
            insert into coupons
                (description, discount, code, expiry, minPurchase, maxDiscount, uses)
            values
                (@description, @discount, @code, @expiry, @minPurchase, @maxDiscount, @uses)
            set @result = 1
        end
    end
    go

create or alter procedure getCoupons
as
begin
    select *
    from coupons
end
go

create or alter procedure checkCoupon
    @code nvarchar(10),
    @result int output
as
begin
    if not exists (select 1
    from coupons
    where code = @code)
    begin
        set @result = -1
        return
    end
    else
    begin
        declare @uses int
        select @uses = uses
        from coupons
        where code = @code

        if @uses = 0
        begin
            set @result = -1
            return
        end
        else
        begin
            set @result = 1
        end
    end
end
go

create or alter procedure disableCoupon
    @code nvarchar(10)
as
begin
    update coupons
    set uses = 0
    where code = @code
end
go

CREATE OR ALTER PROCEDURE updateCoupon
    @id INT,
    @code NVARCHAR(10),
    @description NVARCHAR(MAX),
    @discount DECIMAL(18,2),
    @expiry DATE,
    @minPurchase DECIMAL(18,2),
    @maxDiscount DECIMAL(18,2),
    @uses INT,
    @result NVARCHAR(50) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
               FROM coupons
               WHERE code = @code AND id != @id)
    BEGIN
        SET @result = 'Already exists: ' + @code
        RETURN
    END

    IF NOT EXISTS (SELECT 1
                   FROM coupons
                   WHERE id = @id)
    BEGIN
        SET @result = 'Coupon not found with ID ' + CAST(@id AS NVARCHAR)
        RETURN
    END

    UPDATE coupons
    SET description = @description,
        discount = @discount,
        expiry = @expiry,
        minPurchase = @minPurchase,
        maxDiscount = @maxDiscount,
        uses = @uses
    WHERE id = @id

    SET @result = 'Update successful'
END
GO

create or alter procedure adjustCouponUses
    @code nvarchar(10),
    @uses int
as
begin
    update coupons
    set uses = uses + @uses
    where code = @code
end
go