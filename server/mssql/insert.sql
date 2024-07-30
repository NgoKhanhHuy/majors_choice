use major
SET NOCOUNT ON;
go

DECLARE @resultInt int
-- User 1
EXEC register
    @username = 'phong', 
    @password = 'phong', 
    @fullname = 'Pham Thanh Phong', 
    @email = 'alternative@themajorones.dev', 
    @phoneNumber = '123-456-7890', 
    @address = '123 Main St, Anytown, USA', 
    @dateOfBirth = '1980-01-01',
    @confirmCode = 'phong',
    @result = @resultInt OUTPUT

-- User 2
EXEC register
    @username = 'emilyjohnson', 
    @password = 'password456', 
    @fullname = 'Emily Johnson', 
    @email = 'emilyjohnson@example.com', 
    @phoneNumber = '234-567-8901', 
    @address = '456 Elm St, Anytown, USA', 
    @dateOfBirth = '1985-02-02', 
    @confirmCode = 'DfjgR',
    @result = @resultInt OUTPUT

-- User 3
EXEC register 
    @username = 'michaelbrown', 
    @password = 'password789', 
    @fullname = 'Michael Brown', 
    @email = 'michaelbrown@example.com', 
    @phoneNumber = '345-678-9012', 
    @address = '789 Pine St, Anytown, USA', 
    @dateOfBirth = '1990-03-03', 
    @confirmCode = 'GhjKl',
    @result = @resultInt OUTPUT

-- User 4
EXEC register 
    @username = 'sarahmiller', 
    @password = 'password012', 
    @fullname = 'Sarah Miller', 
    @email = 'sarahmiller@example.com', 
    @phoneNumber = '456-789-0123', 
    @address = '012 Oak St, Anytown, USA', 
    @dateOfBirth = '1995-04-04', 
    @confirmCode = 'JkLmN',
    @result = @resultInt OUTPUT

-- User 5
EXEC register 
    @username = 'jamesdavis', 
    @password = 'password345', 
    @fullname = 'James Davis', 
    @email = 'jamesdavis@example.com', 
    @phoneNumber = '567-890-1234', 
    @address = '345 Maple St, Anytown, USA', 
    @dateOfBirth = '2000-05-05', 
    @confirmCode = 'LmNoP',
    @result = @resultInt OUTPUT

INSERT INTO staffs
    (username, password, possition, fullname, active)
VALUES
    ('manager', 'password', 1, 'Manager', 1)

EXEC addStaff @username = 'staff1', @password = 'password2', @fullname = 'Staff One', @result = @resultInt OUTPUT
EXEC addStaff @username = 'staff2', @password = 'password3', @fullname = 'Staff Two', @result = @resultInt OUTPUT
EXEC addStaff @username = 'staff3', @password = 'password4', @fullname = 'Staff Three', @result = @resultInt OUTPUT
EXEC addStaff @username = 'staff4', @password = 'password5', @fullname = 'Staff Four', @result = @resultInt OUTPUT

-- >> Add CPUs
DECLARE @result varchar(50)

EXEC addProductCPU
    @sellingPrice = 5200000,
    @costPrice = 4500000,
    @name = 'AMD Ryzen 5 5500',
    @generation = 'Cezanne',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.6,
    @boostClock = 4.2,
    @tdp = 65,
    @igpu = 'Radeon Vega 7',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 7500000,
    @costPrice = 6500000,
    @name = 'AMD Ryzen 7 5700X',
    @generation = 'Vermeer',
    @socket = 'AM4',
    @cores = 8,
    @threads = 16,
    @baseClock = 3.4,
    @boostClock = 4.6,
    @tdp = 65,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 13000000,
    @costPrice = 11000000,
    @name = 'AMD Ryzen 9 7950X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 16,
    @threads = 32,
    @baseClock = 4.5,
    @boostClock = 5.7,
    @tdp = 170,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'AMD Ryzen 3 5300G',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 4,
    @threads = 8,
    @baseClock = 3.8,
    @boostClock = 4.2,
    @tdp = 65,
    @igpu = 'Radeon Vega 6',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 4500000,
    @costPrice = 4000000,
    @name = 'AMD Ryzen 3 5600G',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.9,
    @boostClock = 4.6,
    @tdp = 65,
    @igpu = 'Radeon Vega 7',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEc addProductCPU
    @sellingPrice = 4700000,
    @costPrice = 4200000,
    @name = 'AMD Ryzen 5 5600GE',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.9,
    @boostClock = 4.4,
    @tdp = 46,
    @igpu = 'Radeon Vega 7',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 5000000,
    @costPrice = 4500000,
    @name = 'AMD Ryzen 5 5500G',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.8,
    @boostClock = 4.2,
    @tdp = 65,
    @igpu = 'Radeon Vega 7',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 5000000,
    @costPrice = 5800000,
    @name = 'AMD Ryzen 5 5600',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.7,
    @boostClock = 4.6,
    @tdp = 65,
    @igpu = 'Radeon Vega 7',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 7800000,
    @costPrice = 9000000,
    @name = 'AMD Ryzen 7 5800X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 8,
    @threads = 16,
    @baseClock = 3.8,
    @boostClock = 4.7,
    @tdp = 105,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 10500000,
    @costPrice = 9000000,
    @name = 'AMD Ryzen 9 5900X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 12,
    @threads = 24,
    @baseClock = 3.7,
    @boostClock = 4.8,
    @tdp = 105,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 12000000,
    @costPrice = 10500000,
    @name = 'AMD Ryzen 9 5950X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 16,
    @threads = 32,
    @baseClock = 3.4,
    @boostClock = 4.9,
    @tdp = 105,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 9500000,
    @costPrice = 8000000,
    @name = 'AMD Ryzen 7 7700X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 8,
    @threads = 16,
    @baseClock = 4.5,
    @boostClock = 5.4,
    @tdp = 105,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 5500000,
    @costPrice = 5000000,
    @name = 'AMD Ryzen 5 7600X',
    @generation = 'Zen 4',
    @socket = 'AM5',
    @cores = 6,
    @threads = 12,
    @baseClock = 4.7,
    @boostClock = 5.3,
    @tdp = 105,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 11000000,
    @costPrice = 10000000,
    @name = 'AMD Ryzen 7 7800X',
    @generation = 'Zen 4',
    @socket = 'AM5',
    @cores = 8,
    @threads = 16,
    @baseClock = 4.3,
    @boostClock = 5.7,
    @tdp = 170,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 13000000,
    @costPrice = 11500000,
    @name = 'AMD Ryzen 9 7900X',
    @generation = 'Zen 4',
    @socket = 'AM5',
    @cores = 12,
    @threads = 24,
    @baseClock = 4.7,
    @boostClock = 5.6,
    @tdp = 170,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 7500000,
    @costPrice = 8500000,
    @name = 'Intel Core i7-13700K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 16,
    @threads = 24,
    @baseClock = 3.4,
    @boostClock = 5.4,
    @tdp = 125,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 11000000,
    @costPrice = 9500000,
    @name = 'Intel Core i9-13900K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3,
    @boostClock = 5.8,
    @tdp = 125,
    @igpu = 'Intel UHD Graphics 770',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 09700000,
    @costPrice = 8200000,
    @name = 'Intel Core i7-14700F',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 20,
    @threads = 28,
    @baseClock = 3.6,
    @boostClock = 5.5,
    @tdp = 125,
    @igpu = 'Intel UHD Graphics 770',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 011500000,
    @costPrice = 010000000,
    @name = 'Intel Core i9-14900F',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.5,
    @boostClock = 5.8,
    @tdp = 125,
    @igpu = 'Intel UHD Graphics 770',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 07000000,
    @costPrice = 06000000,
    @name = 'Intel Core i5-13600K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 14,
    @threads = 20,
    @baseClock = 3.5,
    @boostClock = 5.1,
    @tdp = 125,
    @igpu = 'Intel UHD Graphics 770',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 06500000,
    @costPrice = 05500000,
    @name = 'Intel Core i5-13600KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 14,
    @threads = 20,
    @baseClock = 3.5,
    @boostClock = 5.1,
    @tdp = 125,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 010500000,
    @costPrice = 09000000,
    @name = 'Intel Core i9-13900KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3,
    @boostClock = 5.8,
    @tdp = 125,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 08000000,
    @costPrice = 07000000,
    @name = 'Intel Core i7-13700KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 16,
    @threads = 24,
    @baseClock = 3.4,
    @boostClock = 5.4,
    @tdp = 125,
    @igpu = 'Intel UHD Graphics 770',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 012000000,
    @costPrice = 010500000,
    @name = 'Intel Core i9-14900K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.2,
    @boostClock = 6,
    @tdp = 125,
    @igpu = 'Intel UHD Graphics 770',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 011500000,
    @costPrice = 010000000,
    @name = 'Intel Core i9-14900KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.2,
    @boostClock = 6,
    @tdp = 125,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 010200000,
    @costPrice = 08700000,
    @name = 'Intel Core i7-14700K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 20,
    @threads = 28,
    @baseClock = 3.4,
    @boostClock = 5.6,
    @tdp = 125,
    @igpu = '',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


-- >> Add GPUs
EXEC addProductGPU
    @sellingPrice = 14000000,
    @costPrice = 11000000,
    @name = 'AMD Radeon RX 6900 XT',
    @generation = 'RDNA 2',
    @vram = 16,
    @baseClock = 1825,
    @boostClock = 2250,
    @tdp = 300,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 11500000,
    @costPrice = 8500000,
    @name = 'AMD Radeon RX 6800 XT',
    @generation = 'RDNA 2',
    @vram = 16,
    @baseClock = 1825,
    @boostClock = 2250,
    @tdp = 300,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 10500000,
    @costPrice = 7500000,
    @name = 'AMD Radeon RX 6700 XT',
    @generation = 'RDNA 2',
    @vram = 12,
    @baseClock = 2321,
    @boostClock = 2581,
    @tdp = 230,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 8500000,
    @costPrice = 6000000,
    @name = 'AMD Radeon RX 6600 XT',
    @generation = 'RDNA 2',
    @vram = 8,
    @baseClock = 1968,
    @boostClock = 2589,
    @tdp = 160,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 27000000,
    @costPrice = 22000000,
    @name = 'NVIDIA GeForce RTX 3090',
    @generation = 'Ampere',
    @vram = 24,
    @baseClock = 1395,
    @boostClock = 1695,
    @tdp = 350,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 23000000,
    @costPrice = 18000000,
    @name = 'NVIDIA GeForce RTX 3080',
    @generation = 'Ampere',
    @vram = 10,
    @baseClock = 1440,
    @boostClock = 1710,
    @tdp = 320,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 20000000,
    @costPrice = 15000000,
    @name = 'NVIDIA GeForce RTX 3070',
    @generation = 'Ampere',
    @vram = 8,
    @baseClock = 1500,
    @boostClock = 1725,
    @tdp = 220,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 14000000,
    @costPrice = 11000000,
    @name = 'NVIDIA GeForce RTX 3060',
    @generation = 'Ampere',
    @vram = 8,
    @baseClock = 1410,
    @boostClock = 1665,
    @tdp = 200,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 20000000,
    @costPrice = 16000000,
    @name = 'AMD Radeon RX 7900 XTX',
    @generation = 'RDNA 3',
    @vram = 24,
    @baseClock = 1900,
    @boostClock = 2400,
    @tdp = 355,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 18000000,
    @costPrice = 14000000,
    @name = 'AMD Radeon RX 7900 XT',
    @generation = 'RDNA 3',
    @vram = 20,
    @baseClock = 1500,
    @boostClock = 2200,
    @tdp = 300,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 14000000,
    @costPrice = 11000000,
    @name = 'AMD Radeon RX 7800 XT',
    @generation = 'RDNA 3',
    @vram = 16,
    @baseClock = 1600,
    @boostClock = 2100,
    @tdp = 290,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 12000000,
    @costPrice = 9000000,
    @name = 'AMD Radeon RX 7700 XT',
    @generation = 'RDNA 3',
    @vram = 12,
    @baseClock = 1700,
    @boostClock = 2000,
    @tdp = 250,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 9000000,
    @costPrice = 7000000,
    @name = 'AMD Radeon RX 7600 XT',
    @generation = 'RDNA 3',
    @vram = 8,
    @baseClock = 1800,
    @boostClock = 2100,
    @tdp = 190,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 35000000,
    @costPrice = 30000000,
    @name = 'NVIDIA GeForce RTX 4090',
    @generation = 'Ada Lovelace',
    @vram = 24,
    @baseClock = 2235,
    @boostClock = 2520,
    @tdp = 450,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 30000000,
    @costPrice = 25000000,
    @name = 'NVIDIA GeForce RTX 4080',
    @generation = 'Ada Lovelace',
    @vram = 16,
    @baseClock = 2205,
    @boostClock = 2505,
    @tdp = 320,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 27000000,
    @costPrice = 22000000,
    @name = 'NVIDIA GeForce RTX 4070 Ti',
    @generation = 'Ada Lovelace',
    @vram = 12,
    @baseClock = 2310,
    @boostClock = 2610,
    @tdp = 285,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 23000000,
    @costPrice = 18000000,
    @name = 'NVIDIA GeForce RTX 4070',
    @generation = 'Ada Lovelace',
    @vram = 10,
    @baseClock = 2150,
    @boostClock = 2450,
    @tdp = 250,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 20000000,
    @costPrice = 15000000,
    @name = 'NVIDIA GeForce RTX 4060 Ti',
    @generation = 'Ada Lovelace',
    @vram = 8,
    @baseClock = 2100,
    @boostClock = 2400,
    @tdp = 220,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT



-- >> Add RAMs

EXEC addProductRAM
    @sellingPrice = 600000,
    @costPrice = 500000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 2400',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 650000,
    @costPrice = 550000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 2666',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 700000,
    @costPrice = 600000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 3000',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 750000,
    @costPrice = 650000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 3200',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 800000,
    @costPrice = 700000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 3600',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3600,
    @latentcy = 18,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1200000,
    @costPrice = 1000000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 2400',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1300000,
    @costPrice = 1100000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 2666',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1400000,
    @costPrice = 1200000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 3000',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1500000,
    @costPrice = 1300000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 3200',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1600000,
    @costPrice = 1400000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 3600',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3600,
    @latentcy = 18,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 2400000,
    @costPrice = 2000000,
    @name = 'Corsair Vengeance LPX DDR4 1x32 2400',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 2600000,
    @costPrice = 2200000,
    @name = 'Corsair Vengeance LPX DDR4 1x32 2666',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 2800000,
    @costPrice = 2400000,
    @name = 'Corsair Vengeance LPX DDR4 1x32 3000',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 600000,
    @costPrice = 500000,
    @name = 'Kingston HyperX Fury DDR4 1x8 2133',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2133,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 650000,
    @costPrice = 550000,
    @name = 'Kingston HyperX Fury DDR4 1x8 2400',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 700000,
    @costPrice = 600000,
    @name = 'Kingston HyperX Fury DDR4 1x8 2666',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 750000,
    @costPrice = 650000,
    @name = 'Kingston HyperX Fury DDR4 1x8 3000',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 800000,
    @costPrice = 700000,
    @name = 'Kingston HyperX Fury DDR4 1x8 3200',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3200,
    @latentcy = 18,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 850000,
    @costPrice = 750000,
    @name = 'Kingston HyperX Fury DDR4 1x8 3466',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3466,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 800000,
    @costPrice = 650000,
    @name = 'Kingston HyperX Fury DDR4 1x16 2133',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2133,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 850000,
    @costPrice = 700000,
    @name = 'Kingston HyperX Fury DDR4 1x16 2400',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 900000,
    @costPrice = 750000,
    @name = 'Kingston HyperX Fury DDR4 1x16 2666',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 950000,
    @costPrice = 800000,
    @name = 'Kingston HyperX Fury DDR4 1x16 3000',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1000000,
    @costPrice = 850000,
    @name = 'Kingston HyperX Fury DDR4 1x16 3200',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3200,
    @latentcy = 18,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1050000,
    @costPrice = 900000,
    @name = 'Kingston HyperX Fury DDR4 1x16 3466',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3466,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1400000,
    @costPrice = 1200000,
    @name = 'Kingston HyperX Fury DDR4 1x32 3200',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 3200,
    @latentcy = 18,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 550000,
    @costPrice = 450000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 2400',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2400,
    @latentcy = 15,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 600000,
    @costPrice = 500000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 2666',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2666,
    @latentcy = 15,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 650000,
    @costPrice = 550000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 2800',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2800,
    @latentcy = 15,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 700000,
    @costPrice = 600000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 3000',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 950000,
    @costPrice = 800000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 2800',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2800,
    @latentcy = 15,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1000000,
    @costPrice = 850000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 3000',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3000,
    @latentcy = 15,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1050000,
    @costPrice = 900000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 3200',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1150000,
    @costPrice = 1000000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 3600',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3600,
    @latentcy = 19,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1700000,
    @costPrice = 1500000,
    @name = 'G.Skill Ripjaws V DDR4 1x32 2666',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 2666,
    @latentcy = 18,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1800000,
    @costPrice = 1600000,
    @name = 'G.Skill Ripjaws V DDR4 1x32 3200',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 3200000,
    @costPrice = 2800000,
    @name = 'G.Skill Trident DDR5 2x16 5600',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 5600,
    @latentcy = 28,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 3600000,
    @costPrice = 3200000,
    @name = 'G.Skill Trident DDR5 2x16 6000',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6000,
    @latentcy = 32,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 4000000,
    @costPrice = 3600000,
    @name = 'G.Skill Trident DDR5 2x16 6400',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6400,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 4800000,
    @costPrice = 4200000,
    @name = 'G.Skill Trident DDR5 2x32 6000',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6000,
    @latentcy = 30,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5000000,
    @costPrice = 4500000,
    @name = 'Corsair Vengeance DDR5 2x16 5200',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 5200,
    @latentcy = 40,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5300000,
    @costPrice = 4800000,
    @name = 'Corsair Vengeance DDR5 2x16 5600',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 5600,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5500000,
    @costPrice = 5000000,
    @name = 'Corsair Vengeance DDR5 2x16 6000',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6000,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5700000,
    @costPrice = 5200000,
    @name = 'Corsair Vengeance DDR5 2x16 6200',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6200,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5900000,
    @costPrice = 5400000,
    @name = 'Corsair Vengeance DDR5 2x16 6400',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6400,
    @latentcy = 38,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6100000,
    @costPrice = 5600000,
    @name = 'Corsair Vengeance DDR5 2x16 6600',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6600,
    @latentcy = 38,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6300000,
    @costPrice = 5800000,
    @name = 'Corsair Vengeance DDR5 2x16 6800',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6800,
    @latentcy = 40,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6500000,
    @costPrice = 6000000,
    @name = 'Corsair Vengeance DDR5 2x16 7000',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 7000,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6300000,
    @costPrice = 5800000,
    @name = 'Corsair Vengeance DDR5 2x16 7200',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 7000,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6000000,
    @costPrice = 5500000,
    @name = 'Corsair Vengeance DDR5 2x32 5200',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 5200,
    @latentcy = 40,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6300000,
    @costPrice = 5800000,
    @name = 'Corsair Vengeance DDR5 2x32 5600',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 5600,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6500000,
    @costPrice = 6000000,
    @name = 'Corsair Vengeance DDR5 2x32 6000',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6000,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6700000,
    @costPrice = 6200000,
    @name = 'Corsair Vengeance DDR5 2x32 6200',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6200,
    @latentcy = 36,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6900000,
    @costPrice = 6400000,
    @name = 'Corsair Vengeance DDR5 2x32 6400',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6400,
    @latentcy = 38,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 7100000,
    @costPrice = 6600000,
    @name = 'Corsair Vengeance DDR5 2x32 6600',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6400,
    @latentcy = 38,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


-- >> Add Motherboards
EXEC addProductMotherboard
    @sellingPrice = 9000000,
    @costPrice = 8000000,
    @name = 'ASUS ROG Strix X670E-E',
    @socket = 'AM5',
    @chipset = 'X670E',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6600,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 9500000,
    @costPrice = 8500000,
    @name = 'MSI MAG B550 TOMAHAWK',
    @socket = 'AM4',
    @chipset = 'B550',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 5100,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 13500000,
    @costPrice = 12000000,
    @name = 'ASUS ROG Maximus Z790 Hero',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7200,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 8000000,
    @costPrice = 7000000,
    @name = 'MSI PRO Z690-A',
    @socket = 'LGA 1700',
    @chipset = 'Z690',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6400,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 11500000,
    @costPrice = 10000000,
    @name = 'Gigabyte B650 AORUS Elite',
    @socket = 'AM5',
    @chipset = 'B650',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6400,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 7500000,
    @costPrice = 6500000,
    @name = 'MSI MPG Z790 Carbon WiFi',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7200,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 12000000,
    @costPrice = 10500000,
    @name = 'ASUS TUF Gaming X570-Plus',
    @socket = 'AM4',
    @chipset = 'X570',
    @igpu = 0,
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 4400,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 6500000,
    @costPrice = 5500000,
    @name = 'Gigabyte AORUS Master X570',
    @socket = 'AM4',
    @chipset = 'X570',
    @igpu = 0,
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 4400,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 8500000,
    @costPrice = 7500000,
    @name = 'Gigabyte B650E Aorus Master',
    @socket = 'AM5',
    @chipset = 'B650E',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6600,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 6000000,
    @costPrice = 5000000,
    @name = 'ASUS ROG Strix B760-F Gaming',
    @socket = 'LGA 1700',
    @chipset = 'B760',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6400,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 10000000,
    @costPrice = 9000000,
    @name = 'MSI MAG Z790 TOMAHAWK',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7200,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 11500000,
    @costPrice = 10000000,
    @name = 'ASRock Z790 Pro RS',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7000,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 8000000,
    @costPrice = 7000000,
    @name = 'ASUS Prime Z790-P WIFI D4',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 5333,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 9000000,
    @costPrice = 8000000,
    @name = 'MSI PRO Z790-P WIFI DDR4',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @igpu = 1,
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 5333,
    @maxRamCapacity = 128,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


-- >> Add PSUs
EXEC addProductPSU
    @sellingPrice = 3600000,
    @costPrice = 3000000,
    @name = 'Corsair RM850x',
    @wattage = 850,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'EVGA SuperNOVA 750 G6',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4700000,
    @costPrice = 4000000,
    @name = 'Seasonic PRIME TX-1000',
    @wattage = 1000,
    @efficiency = '80+ Titanium',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Cooler Master MWE Gold 650 V2',
    @wattage = 650,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4200000,
    @costPrice = 3500000,
    @name = 'be quiet! Straight Power 11 850W',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3900000,
    @costPrice = 3300000,
    @name = 'Thermaltake Toughpower GF1 850W',
    @wattage = 850,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 8500000,
    @costPrice = 7000000,
    @name = 'Corsair AX1600i',
    @wattage = 1600,
    @efficiency = '80+ Titanium',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'NZXT C750',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4400000,
    @costPrice = 3700000,
    @name = 'SilverStone Strider Platinum 850W',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Antec Earthwatts Gold Pro 750W',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Gigabyte P750GM',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 5800000,
    @costPrice = 5000000,
    @name = 'ASUS ROG Thor 850P',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Fractal Design Ion+ 760P',
    @wattage = 760,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Super Flower Leadex III Gold',
    @wattage = 650,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3800000,
    @costPrice = 3300000,
    @name = 'XPG Core Reactor 750W',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4200000,
    @costPrice = 3500000,
    @name = 'Lian Li SP750',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 5200000,
    @costPrice = 4500000,
    @name = 'be quiet! Dark Power Pro 11',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3900000,
    @costPrice = 3400000,
    @name = 'Cooler Master V750 Gold V2',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4500000,
    @costPrice = 3800000,
    @name = 'Thermaltake Toughpower Grand',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 5000000,
    @costPrice = 4300000,
    @name = 'FSP Hydro PTM Pro 850W',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT


-- >> Add SSDs
EXEC addProductSSD
    @sellingPrice = 1500000,
    @costPrice = 1200000,
    @name = 'Samsung 970 Evo 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Samsung 970 Evo 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Samsung 970 Evo 2TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Samsung 970 Evo Plus 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Samsung 970 Evo Plus 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Samsung 970 Evo Plus 2TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 2048,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Samsung 960 Evo 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1300000,
    @costPrice = 1000000,
    @name = 'Samsung 960 Evo 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1600000,
    @costPrice = 1300000,
    @name = 'Samsung 960 Evo 2TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Samsung 980 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1100000,
    @costPrice = 800000,
    @name = 'Samsung 981 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5000000,
    @costPrice = 4200000,
    @name = 'Samsung 980 Pro 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 6000000,
    @costPrice = 5000000,
    @name = 'Samsung 980 Pro 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5500000,
    @costPrice = 4500000,
    @name = 'Samsung 980 Pro 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5800000,
    @costPrice = 4800000,
    @name = 'Acer Predator GM7000 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Acer Predator GM7001 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2400000,
    @costPrice = 2000000,
    @name = 'Acer Predator GM7002 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2600000,
    @costPrice = 2200000,
    @name = 'Western Digital Black SN850 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1500000,
    @costPrice = 1200000,
    @name = 'Western Digital Black SN851 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2500000,
    @costPrice = 2000000,
    @name = 'Western Digital Black SN852 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1300000,
    @costPrice = 1000000,
    @name = 'Western Digital Black SN850X 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1500000,
    @costPrice = 1200000,
    @name = 'Western Digital Black SN850X 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1600000,
    @costPrice = 1300000,
    @name = 'Sabrent Rocket 4 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Sabrent Rocket 5 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Sabrent Rocket 4 Plus 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Sabrent Rocket 4 Plus 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Crucial P5 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2400000,
    @costPrice = 2000000,
    @name = 'Crucial P6 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2600000,
    @costPrice = 2200000,
    @name = 'Crucial P7 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Samsung 860 Evo 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Samsung 860 Evo 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Samsung 860 Evo 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Samsung 860 Pro 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1600000,
    @costPrice = 1300000,
    @name = 'Samsung 860 Pro 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Samsung 860 Pro 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3700000,
    @costPrice = 3200000,
    @name = 'Samsung 850 Evo 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Samsung 850 Evo 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Samsung 850 Evo 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5000000,
    @costPrice = 4200000,
    @name = 'Samsung 850 Pro 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5500000,
    @costPrice = 4500000,
    @name = 'Samsung 850 Pro 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5800000,
    @costPrice = 4800000,
    @name = 'Western Digital Blue 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Western Digital Blue 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Western Digital Blue 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Crucial MX500 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Crucial MX500 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Crucial MX500 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Crucial MX300 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3700000,
    @costPrice = 3200000,
    @name = 'Crucial MX300 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

	--> Add Cases
EXEC addProductCase
    @sellingPrice = 3350000,
    @costPrice = 2560000,
    @name = 'Thermaltake Tower 300',
    @formFactor = 'Micro Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 1990000,
    @costPrice = 1500000,
    @name = 'Corsair 3000D Airflow',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 2990000,
    @costPrice = 2500000,
    @name = 'Corsair 5000D Core Airflow',
    @formFactor = 'Mid Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3650000,
    @costPrice = 3350000,
    @name = 'Corsair 2500D Airflow',
    @formFactor = 'Mid Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 4190000,
    @costPrice = 3500000,
    @name = 'Cooler Master Mastercase H500P',
    @formFactor = 'Mid Tower',
    @color = 'Grey',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 11290000,
    @costPrice = 9500000,
    @name = 'Lian Li V3000',
    @formFactor = 'FullTower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 5790000,
    @costPrice = 4500000,
    @name = 'Lian Li O11D',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 10990000,
    @costPrice = 8500000,
    @name = 'ASUS ROG Hyperion GR701',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 1330000,
    @costPrice = 1000000,
    @name = 'MIK LV12 M',
    @formFactor = 'FullTower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 2190000,
    @costPrice = 1650000,
    @name = 'Cooler Master MasterBox NR200P',
    @formFactor = 'Mini ITX',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3990000,
    @costPrice = 2500000,
    @name = 'INWIN N515 Nebula',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3590000,
    @costPrice = 2400000,
    @name = 'Lian Li Lancool 3 RGB',
    @formFactor = 'FullTower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 1490000,
    @costPrice = 1300000,
    @name = 'MSI MAG Vampiric 010M',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3290000,
    @costPrice = 2650000,
    @name = 'InWin N127 Nebula',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 2750000,
    @costPrice = 2430000,
    @name = 'InWin B1 Pure',
    @formFactor = 'Mid Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 4390000,
    @costPrice = 4200000,
    @name = 'NZXT H7 Elite',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 12490000,
    @costPrice = 11000000,
    @name = 'Cougar Cratus',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT
    	--> Add Cases
EXEC addProductCase
    @sellingPrice = 3350000,
    @costPrice = 2560000,
    @name = 'Thermaltake Tower 300',
    @formFactor = 'Micro Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 1990000,
    @costPrice = 1500000,
    @name = 'Corsair 3000D Airflow',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 2990000,
    @costPrice = 2500000,
    @name = 'Corsair 5000D Core Airflow',
    @formFactor = 'Mid Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3650000,
    @costPrice = 3350000,
    @name = 'Corsair 2500D Airflow',
    @formFactor = 'Mid Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 4190000,
    @costPrice = 3500000,
    @name = 'Cooler Master Mastercase H500P',
    @formFactor = 'Mid Tower',
    @color = 'Grey',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 11290000,
    @costPrice = 9500000,
    @name = 'Lian Li V3000',
    @formFactor = 'FullTower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 5790000,
    @costPrice = 4500000,
    @name = 'Lian Li O11D',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 10990000,
    @costPrice = 8500000,
    @name = 'ASUS ROG Hyperion GR701',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 1330000,
    @costPrice = 1000000,
    @name = 'MIK LV12 M',
    @formFactor = 'FullTower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 2190000,
    @costPrice = 1650000,
    @name = 'Cooler Master MasterBox NR200P',
    @formFactor = 'Mini ITX',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3990000,
    @costPrice = 2500000,
    @name = 'INWIN N515 Nebula',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3590000,
    @costPrice = 2400000,
    @name = 'Lian Li Lancool 3 RGB',
    @formFactor = 'FullTower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 1490000,
    @costPrice = 1300000,
    @name = 'MSI MAG Vampiric 010M',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 3290000,
    @costPrice = 2650000,
    @name = 'InWin N127 Nebula',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 2750000,
    @costPrice = 2430000,
    @name = 'InWin B1 Pure',
    @formFactor = 'Mid Tower',
    @color = 'White',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 4390000,
    @costPrice = 4200000,
    @name = 'NZXT H7 Elite',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

EXEC addProductCase
    @sellingPrice = 12490000,
    @costPrice = 11000000,
    @name = 'Cougar Cratus',
    @formFactor = 'Mid Tower',
    @color = 'Black',
    @image = '',
    @quantity = 10,
    @result = @result OUTPUT

-- add ProductDescription
EXEC AddProductDescription 
    @ProductId = 1, 
    @Description = 'The AMD Ryzen 5 5500 is a desktop processor with 6 cores and 12 threads, launched in April 2022. It uses the Zen 3 (Cezanne) architecture and has a base clock speed of 3.6 GHz and a boost clock speed of 4.2 GHz. It is part of the Ryzen 5 lineup and is based on 7 nm manufacturing technology. The processor is primarily aimed at office systems.'

EXEC AddProductDescription 
    @ProductId = 2, 
    @Description = 'The AMD Ryzen 7 5700X is an 8-core, 16-thread desktop processor launched in April 2022. With a base clock frequency of 3.4 GHz (boosting up to 3.6 GHz), it offers strong performance for its price point. The 7 nm lithography, 32 MB L3 cache, and 65-watt TDP make it an attractive choice for budget-conscious users seeking reliable computing power.'

EXEC AddProductDescription 
    @ProductId = 3, 
    @Description = 'The Ryzen 9 7950X excels in gaming performance, making it a top choice for demanding gamers. Its innovative 3D-stacked design enhances gaming horsepower, although it may show reduced productivity performance in certain applications.'

EXEC AddProductDescription 
    @ProductId = 4, 
    @Description = 'The AMD Ryzen 3 5300G is a budget-friendly desktop processor featuring 4 cores and 8 threads. Built on the Zen 3 (Cezanne) architecture, it’s compatible with Socket AM4. Although not widely available for retail purchase, this chip delivers impressive performance, especially considering its integrated graphics—powered by Radeon Vega 6.'

EXEC AddProductDescription 
    @ProductId = 5, 
    @Description = 'The Ryzen 5 5600G is a solid choice for budget-conscious users seeking a balance of CPU performance and integrated graphics capabilities. Whether you’re building a gaming PC on a budget or need a reliable processor for daily tasks, the Ryzen 5 5600G offers great value.'

EXEC AddProductDescription 
    @ProductId = 6, 
    @Description = 'The Ryzen 5 5600GE offers a balance of CPU performance and power efficiency, making it suitable for compact systems or those with strict thermal constraints. Its integrated graphics, powered by Radeon Vega 7, provide decent visuals for everyday tasks and light gaming. If you’re building a small form factor PC, the Ryzen 5 5600GE is worth considering.'

EXEC AddProductDescription 
    @ProductId = 7, 
    @Description = 'The Ryzen 5 5600 offers solid performance for its price range, making it suitable for various tasks. Keep in mind that it doesn’t have integrated graphics, so a dedicated GPU is necessary. If you’re building a system, this CPU is worth considering!'

EXEC AddProductDescription 
    @ProductId = 8, 
    @Description = 'The Ryzen 5 5600 offers solid performance for its price range, making it suitable for various tasks. Keep in mind that it doesn’t have integrated graphics, so a dedicated GPU is necessary. If you’re building a system, this CPU is worth considering!'

EXEC AddProductDescription 
    @ProductId = 9, 
    @Description = 'The Ryzen 7 5800X is optimized for high-FPS gaming rigs, making it an excellent choice for gamers. Its modern PCI-Express 4.0 bus ensures compatibility with next-gen graphics cards. If you’re building a powerful gaming system, the Ryzen 7 5800X is worth considering!'

EXEC AddProductDescription 
    @ProductId = 10, 
    @Description = 'The Ryzen 9 5900X excels in both gaming and content creation tasks, making it a top choice for enthusiasts. Its impressive performance, large cache, and PCIe 4.0 support contribute to its popularity. If you’re building a high-end system, the Ryzen 9 5900X is definitely worth considering!'

EXEC AddProductDescription 
    @ProductId = 11, 
    @Description = 'The Ryzen 9 5950X excels in both gaming and content creation tasks, making it a top choice for enthusiasts. Its impressive performance, large cache, and PCIe 4.0 support contribute to its popularity. If you’re building a high-end system, the Ryzen 9 5950X is definitely worth considering!'

EXEC AddProductDescription 
    @ProductId = 12, 
    @Description = 'The AMD Ryzen 7 7700X is a dominant gaming desktop processor with 8 CPU cores, 16 threads, and a maximum boost clock speed of up to 5.4 GHz. It belongs to the Ryzen 7 lineup and utilizes the Zen 4 (Raphael) architecture, compatible with Socket AM5. This powerful processor is designed to lead your team to victory in gaming. While it excels in gaming performance, it’s also suitable for other demanding tasks. If you’re building a high-performance system, the Ryzen 7 7700X is worth considering!'

EXEC AddProductDescription 
    @ProductId = 13, 
    @Description = 'The Ryzen 5 7600X offers impressive performance for its price range, making it a competitive choice for both gaming and productivity tasks. Keep in mind that it doesn’t have integrated graphics, so a dedicated GPU is necessary. If you’re building a system, the Ryzen 5 7600X is worth considering!'

EXEC AddProductDescription 
    @ProductId = 14, 
    @Description = 'The AMD Ryzen 7 7800X3D is a dominant gaming processor with 8 fast cores and 3D V-Cache technology stacked on top. Priced at $450, it outperforms Intel’s 13900K and even the 7950X3D in gaming performance. Whether you’re aiming for victory in gaming or tackling demanding tasks, the Ryzen 7 7800X3D is an excellent choice!'

EXEC AddProductDescription 
    @ProductId = 15, 
    @Description = 'The AMD Ryzen 9 7900X is a powerful desktop processor designed for gaming and streaming. It features 12 CPU cores, 24 threads, and a base clock speed of 4.7 GHz. This enthusiast processor provides a competitive edge for gamers and creators alike. If you’re building a high-performance system, the Ryzen 9 7900X is definitely worth considering!'

EXEC AddProductDescription 
    @ProductId = 16, 
    @Description = 'The Intel Core i7 13700K processor is one of the first high-performance CPUs from Intel Gen 13. Equipped with a completely new architecture with advanced features, the Intel Core i7 13700K will bring great performance to subjects requiring high performance to handle above-average gaming tasks and graphics tasks. This is definitely the final deciding factor in creating a powerful PC gaming system that you should not ignore.'

EXEC AddProductDescription 
    @ProductId = 17, 
    @Description = 'Intel Core i9 13900K CPU is Intel 13th generation CPU. As the most powerful and advanced child, the i9 13900K is favored based on the LGA 1700 Socket and applies a new architecture and has superior performance compared to previous generation products. Intel Core i9 13900K will be a great choice if you want to build the best gaming PC today. With high cores, threads, and clock speeds, it will be suitable for high-end devices, streaming services, gaming, or professional software use.'

EXEC AddProductDescription 
    @ProductId = 18, 
    @Description = 'The Intel Core i7-14700F is a desktop processor from Intel’s 14th generation lineup, codenamed Raptor Lake.'

EXEC AddProductDescription 
    @ProductId = 19, 
    @Description = 'The Intel Core i9-14900F is a powerful desktop processor with impressive specifications. For gaming, it’s a solid choice, especially considering its high core count and clock speeds. However, other factors like GPU and RAM also play a crucial role in gaming performance.'

EXEC AddProductDescription 
    @ProductId = 20, 
    @Description = 'Intel Core i5 13600K CPU is Intel''s 13th generation CPU. As a newborn, the i5 13600K is favored based on Socket LGA 1700 and applies new architecture and has superior performance compared to previous generation products. Intel Core i5 13600K will be a great choice if you want to build the best gaming PC today. With high cores, threads and clock speeds, it will be suitable for high-end devices, streaming services, games or professional software use.'

EXEC AddProductDescription 
    @ProductId = 21, 
    @Description = 'Intel Core i5 13600KF CPU is Intel''s 13th generation CPU. As a late child, the Intel Core i5 13600KF is favored based on the LGA 1700 Socket and applies a new architecture, with superior performance compared to previous generation products. Intel Core i5 13600KF will be a great choice if you want to build the best gaming PC today. With its high core count, threads, and clock speeds, it will be suitable for high-end devices, streaming services, gaming, or professional software use.'

EXEC AddProductDescription 
    @ProductId = 22, 
    @Description = 'Intel Core i9 14900KF CPU is Intel''s 14th generation CPU. As the most powerful and advanced child, the i9 14900KF possesses 24 cores and 32 threads combined with the new Raptor Lake architecture to create superior performance compared to previous generation products. Intel Core i9 14900KF will be a great choice if you want to build the best gaming PC today. With high cores, threads, and clock speeds, it will be suitable for high-end devices, streaming services, gaming, or professional software use.'

EXEC AddProductDescription 
    @ProductId = 23, 
    @Description = 'Intel Gen 14, the latest generation of microprocessors from the green house, is expected with new streams of power. Maintaining its format, Intel spans many segments and the Intel Core i7 14700KF CPU will be an important factor for the mid-range and near-high-end segments for PC building needs.'

EXEC AddProductDescription 
    @ProductId = 24, 
    @Description = 'Intel Core i9 14900K CPU is Intel''s 14th generation CPU. As the most powerful and advanced child, the i9 14900K is favored based on the LGA 1700 Socket and applies a new architecture and has superior performance compared to previous generation products. Intel Core i9 14900K will be a great choice if you want to build the best gaming PC today. With high cores, threads, and clock speeds, it will be suitable for high-end devices, streaming services, gaming, or professional software use.'

EXEC AddProductDescription 
    @ProductId = 25, 
    @Description = 'Intel Core i9 14900KF CPU is Intel''s 14th generation CPU. As the most powerful and advanced child, the i9 14900KF possesses 24 cores and 32 threads combined with the new Raptor Lake architecture, creating superior performance compared to previous generation products. Intel Core i9 14900KF will be a great choice if you want to build the best gaming PC today. With its high core count, threads, and clock speeds, it will be suitable for high-end devices, streaming services, gaming, or professional software use.'

EXEC AddProductDescription 
    @ProductId = 26, 
    @Description = 'The Intel Core i7 14700K processor is one of the first high-performance CPUs from Intel Gen 14. Equipped with a completely new architecture with advanced features, the Intel Core i7 14700K will bring great performance to subjects requiring high performance to handle above-average gaming tasks and graphics tasks. This is definitely the final deciding factor in creating a powerful PC gaming system that you should not ignore.'

EXEC AddProductDescription 
    @ProductId = 27, 
    @Description = 'The AMD Radeon RX 6900 XT is a high-performance graphics card based on the AMD RDNA 2 architecture. It features 80 compute units, 16GB GDDR6 memory, and 128MB AMD Infinity Cache. Designed for 4K gaming, it offers compatibility with DirectX 12 Ultimate and delivers impressive frame rates.'

EXEC AddProductDescription 
    @ProductId = 28, 
    @Description = 'The AMD Radeon RX 6800 XT is a high-performance graphics card based on the AMD RDNA 2 architecture. It features 72 compute units, 16GB GDDR6 memory, and 128MB AMD Infinity Cache. Designed for 4K gaming, it offers compatibility with DirectX 12 Ultimate and delivers impressive frame rates.'

EXEC AddProductDescription 
    @ProductId = 29, 
    @Description = 'The AMD Radeon RX 6700 XT is an excellent graphics card designed for 1440p gaming. It features 40 compute units, 12GB of GDDR6 memory, and a game frequency of 2424 MHz. With real-time ray tracing capabilities, it’s a great choice for high-refresh-rate gaming at 1440p resolution.'

EXEC AddProductDescription 
    @ProductId = 30, 
    @Description = 'The AMD Radeon RX 6600 XT is an excellent graphics card designed for the ultimate 1080p gaming experience. It features 2048 shader units, a boost frequency of 2539 MHz, 8GB of GDDR6 memory, and a 160W TDP. With 32 ray accelerators, ray tracing can be turned on for better lighting and reflections, although it comes at a significant cost to FPS.'

EXEC AddProductDescription 
    @ProductId = 31, 
    @Description = 'The NVIDIA GeForce RTX 3090 is a top-tier graphics card designed for high-end gaming and professional workloads. It features cutting-edge technologies like real-time ray tracing and AI-enhanced graphics, delivering exceptional visual fidelity and performance. With 24 GB of GDDR6X memory, it handles demanding applications such as 4K gaming and intensive 3D rendering with ease. The RTX 3090 also supports NVIDIA’s DLSS technology, which uses AI to boost frame rates while maintaining image quality. Ideal for enthusiasts and professionals, the RTX 3090 offers unparalleled power and advanced features for the most demanding tasks.'

EXEC AddProductDescription 
    @ProductId = 32, 
    @Description = 'The NVIDIA GeForce RTX 3080 is a high-performance graphics card designed for gaming and creative workloads. It features NVIDIA''s Ampere architecture, providing significant improvements in ray tracing and AI performance. With 10GB of GDDR6X memory, it supports high-resolution gaming and demanding applications with ease. The RTX 3080 excels in 4K gaming, offering smooth frame rates and stunning visuals. Additionally, it supports NVIDIA''s DLSS technology, which uses AI to enhance image quality and performance in supported games.'

EXEC AddProductDescription 
    @ProductId = 33, 
    @Description = 'The NVIDIA GeForce RTX 3070 is a high-performance graphics card ideal for gaming and creative work. It delivers exceptional 1440p and capable 4K gaming, leveraging the powerful Ampere architecture. With real-time ray tracing and AI-powered features, it enhances visual fidelity and performance in demanding applications. The RTX 3070 also supports NVIDIA DLSS for improved frame rates and image quality. Overall, it offers a great balance of performance and value for gamers and content creators.'

EXEC AddProductDescription 
    @ProductId = 34, 
    @Description = 'The NVIDIA GeForce RTX 3060 is a mid-range graphics card offering excellent performance for gaming and creative applications. With its powerful Ampere architecture, it supports ray tracing and AI-enhanced graphics, delivering stunning visuals and realistic lighting effects. The RTX 3060 is equipped with 12 GB of GDDR6 memory, ensuring smooth gameplay and efficient handling of demanding tasks like video editing and 3D rendering. It also features NVIDIA DLSS technology, which boosts frame rates while maintaining high image quality. Ideal for gamers and content creators, the RTX 3060 balances performance and affordability, making it a popular choice for modern PC builds.'

EXEC AddProductDescription 
    @ProductId = 35, 
    @Description = 'The AMD Radeon RX 7900 XTX is a high-performance graphics card designed for gaming and intensive graphical tasks. Featuring advanced RDNA architecture, it offers exceptional graphics rendering capabilities with high frame rates and detailed visuals. Equipped with ample VRAM and efficient cooling solutions, it ensures smooth gameplay even in demanding titles at high resolutions. The RX 7900 XTX supports features like ray tracing and variable rate shading, enhancing realism and performance in modern games. With its robust design and cutting-edge technologies, it''s a top choice for gamers and professionals seeking uncompromising graphics performance.'

EXEC AddProductDescription 
    @ProductId = 36, 
    @Description = 'The AMD Radeon RX 7900 XT is a high-performance graphics card designed for gaming and content creation. It features the latest RDNA architecture, delivering impressive graphics capabilities and efficient power usage. With advanced ray tracing and variable rate shading technologies, it offers stunning visual fidelity and smooth gameplay experiences. The card supports 4K gaming at high frame rates and is equipped with ample VRAM for handling demanding textures and resolutions. Overall, the Radeon RX 7900 XT is tailored for enthusiasts and professionals seeking top-tier graphics performance in modern gaming and creative applications.'

EXEC AddProductDescription 
    @ProductId = 37, 
    @Description = 'The AMD Radeon RX 7800 XT is a high-performance graphics card known for its advanced capabilities in gaming and professional applications. It features AMD''s latest architecture, delivering impressive graphics rendering and support for high-resolution gaming. With its robust feature set and substantial VRAM, it''s designed to handle demanding tasks like 3D rendering and VR gaming with ease.'

EXEC AddProductDescription 
    @ProductId = 38, 
    @Description = 'The AMD Radeon RX 7700 XT is a high-performance graphics card designed for gaming and content creation. It features advanced RDNA 3 architecture, offering significant improvements in performance and efficiency over previous generations. With support for ray tracing and AI-driven features, it delivers stunning visual fidelity and fast frame rates, making it ideal for demanding AAA games and professional applications like 3D rendering and video editing. Its robust cooling system ensures stable performance under heavy loads, while efficient power management enhances overall system reliability. The RX 7700 XT is tailored for enthusiasts seeking cutting-edge graphics performance and immersive gaming experiences.'

EXEC AddProductDescription 
    @ProductId = 39, 
    @Description = 'The AMD Radeon RX 7600 XT is a high-performance graphics card designed for gaming enthusiasts and professionals alike. Built on advanced RDNA 2 architecture, it offers substantial improvements in performance and efficiency over previous generations. With features like ray tracing and variable rate shading, it delivers stunning visual fidelity and smooth gameplay experiences. Its high core count and memory bandwidth make it ideal for demanding AAA games and creative workloads. Equipped with advanced cooling solutions, it ensures reliable performance even during extended gaming sessions, making it a compelling choice for users seeking top-tier graphics performance.'

EXEC AddProductDescription 
    @ProductId = 40, 
    @Description = 'The NVIDIA GeForce RTX 4090 is a flagship graphics card known for its cutting-edge performance and advanced features. Built on NVIDIA''s latest architecture, it boasts significant improvements in ray tracing, AI capabilities, and overall graphical rendering power. With a high core count and memory bandwidth, it excels in handling demanding games, 3D rendering, and professional applications requiring intensive graphical processing. The RTX 4090 is designed for enthusiasts and professionals seeking top-tier performance, offering unmatched visual fidelity and gaming experiences at the highest resolutions and frame rates available on the market.'

EXEC AddProductDescription 
    @ProductId = 41, 
    @Description = 'The NVIDIA GeForce RTX 4080 is a high-performance graphics card known for its cutting-edge capabilities in gaming and professional applications. Built on NVIDIA''s latest architecture, it offers significant improvements in ray tracing, AI processing, and overall graphics rendering compared to previous generations. With advanced features like DLSS (Deep Learning Super Sampling) and real-time ray tracing, it delivers stunning visual fidelity and smooth gameplay. The RTX 4080 is designed for enthusiasts and professionals seeking top-tier performance, making it suitable for demanding tasks such as 4K gaming, content creation, and VR experiences.'

EXEC AddProductDescription 
    @ProductId = 42, 
    @Description = 'The NVIDIA GeForce RTX 4070 Ti is a high-performance graphics card known for its advanced Ampere architecture, offering substantial improvements in ray tracing and AI rendering capabilities compared to previous generations. With its powerful CUDA cores and tensor cores, it delivers exceptional gaming performance, supporting high frame rates and ultra-high graphics settings in modern AAA titles. The card features significant VRAM, ensuring smooth operation in demanding applications and future-proofing for upcoming games. Its efficient cooling solutions and design make it suitable for enthusiasts and gamers looking to maximize visual fidelity and performance in their gaming setups.'

EXEC AddProductDescription 
    @ProductId = 43, 
    @Description = 'The NVIDIA GeForce RTX 4070 is a high-performance graphics card from NVIDIA''s RTX 4000 series, known for its powerful capabilities in gaming, content creation, and AI tasks. It features advanced ray-tracing and AI technologies, delivering exceptional visual fidelity and performance for modern games and applications. With a significant increase in CUDA cores and memory bandwidth compared to its predecessors, the RTX 4070 offers smoother gameplay at higher resolutions and frame rates. Its enhanced DLSS technology improves performance while maintaining image quality, making it a top choice for enthusiasts and professionals seeking cutting-edge graphics performance.'

EXEC AddProductDescription 
    @ProductId = 44, 
    @Description = 'The NVIDIA GeForce RTX 4060 Ti is a high-performance graphics card known for its robust gaming capabilities and efficient rendering of graphics-intensive tasks. Built on NVIDIA''s Ampere architecture, it features advanced ray-tracing and AI capabilities, enhancing visual fidelity and realism in games and creative applications. With ample VRAM and fast memory bandwidth, it excels in handling high-resolution textures and complex visual effects. The RTX 4060 Ti is designed to deliver smooth gameplay at high settings, making it a top choice for gamers and content creators seeking top-tier graphics performance.'

EXEC AddProductDescription 
    @ProductId = 45, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x8 2400 RAM module is a reliable choice for budget-conscious users looking to upgrade their system''s memory. With a capacity of 8 GB and operating at a speed of 2400 MHz, it offers decent performance for everyday computing tasks and light multitasking. The low-profile design of the LPX series ensures compatibility with a wide range of CPU coolers, making it suitable for compact builds. Corsair''s Vengeance series is known for its stability and overclocking potential, providing a balance of affordability and reliability for gaming and general computing needs.'

EXEC AddProductDescription 
    @ProductId = 46, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x8 2666 RAM module offers reliable performance and compatibility with a wide range of systems. Featuring a capacity of 8 GB and operating at a speed of 2666 MHz, it provides sufficient memory for multitasking and gaming. Its low-profile design ensures compatibility with most CPU coolers, making it suitable for compact builds. The module is optimized for Intel and AMD DDR4 motherboards, delivering stable performance and reliability for both casual and intensive computing tasks.'

EXEC AddProductDescription 
    @ProductId = 47, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x8 3000 RAM module offers reliable performance and efficiency for desktop systems. Featuring a single 8GB stick, it operates at a speed of 3000 MHz, providing sufficient memory bandwidth for multitasking and gaming. Its low-profile design ensures compatibility with most CPU coolers, while its XMP 2.0 support allows for easy overclocking. Ideal for budget-conscious builders, it combines Corsair''s renowned reliability with decent performance, making it suitable for a variety of computing tasks.'

EXEC AddProductDescription 
    @ProductId = 48, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x8 3200 RAM module is a reliable choice for enhancing system performance. With its 8GB capacity and high-speed 3200 MHz frequency, it ensures smooth multitasking and responsiveness for various computing tasks. The LPX design with a low-profile heat spreader helps maintain optimal temperature levels, contributing to stable operation even during intensive use. Ideal for gaming setups and professional workstations alike, this RAM module offers a balance of speed, reliability, and compatibility with modern motherboards, making it a versatile option for upgrading or building a new PC.'

EXEC AddProductDescription 
    @ProductId = 49, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x8 3600 RAM module offers high-speed performance with its 3600 MHz frequency, ideal for enhancing system responsiveness and multitasking capabilities. Featuring a single 8GB module, it strikes a balance between capacity and speed, suitable for gaming and productivity tasks. The low-profile design ensures compatibility with most CPU coolers, maximizing airflow and cooling efficiency. With Corsair''s renowned reliability and compatibility, the Vengeance LPX series is a popular choice among gamers and enthusiasts looking to optimize their PC performance without compromising on stability or reliability.'

EXEC AddProductDescription 
    @ProductId = 50, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x16 2400 RAM module provides reliable performance with its 2400 MHz speed, suitable for basic computing tasks and moderate multitasking. Featuring a single 16GB module, it offers ample capacity for demanding applications and future upgrades. The low-profile design ensures compatibility with various CPU coolers, optimizing system airflow and thermal management. Corsair''s reputation for quality and compatibility makes the Vengeance LPX series a trusted choice for users seeking stable and efficient memory solutions that deliver consistent performance for everyday computing needs.'

EXEC AddProductDescription 
    @ProductId = 51, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x16 2666 RAM module provides reliable performance with its 2666 MHz speed, suitable for various computing tasks. With a single 16GB module, it offers ample capacity for multitasking, content creation, and moderate gaming. The low-profile design ensures compatibility with most CPU coolers, promoting efficient heat dissipation. Corsair''s Vengeance LPX series is known for its stability and compatibility, making it a trusted choice among users seeking dependable performance and seamless integration into their systems.'

EXEC AddProductDescription 
    @ProductId = 52, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x16 3000 RAM module offers a balance of capacity and speed with its 16GB capacity and 3000 MHz frequency. Designed for reliable performance, it supports multitasking and gaming tasks effectively. The low-profile design ensures compatibility with various CPU coolers, optimizing airflow and system cooling. Corsair''s Vengeance LPX series is known for its stability and compatibility, making it a popular choice among users looking to enhance their system''s performance without compromising on reliability.'

EXEC AddProductDescription 
    @ProductId = 53, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x16 3200 RAM module provides reliable performance with its 3200 MHz speed, suitable for a wide range of applications from gaming to content creation. With a single 16GB module, it offers ample capacity for multitasking and handling memory-intensive tasks efficiently. The low-profile design ensures compatibility with various CPU coolers, allowing for efficient heat dissipation. Corsair''s Vengeance LPX series is known for its stability and compatibility, making it a trusted choice among users seeking dependable performance and seamless integration into their systems.'

EXEC AddProductDescription 
    @ProductId = 54, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x16 3600 RAM module offers high-speed performance at 3600 MHz, providing significant bandwidth for demanding applications and gaming. With a single 16GB module, it provides ample capacity for multitasking and memory-intensive tasks without needing additional modules, optimizing both performance and cost-effectiveness. The low-profile design ensures compatibility with various CPU coolers, enhancing system airflow and cooling efficiency. Known for its reliability and compatibility, Corsair''s Vengeance LPX series is a popular choice among users seeking robust performance and stability for their gaming rigs or high-performance workstations.'

EXEC AddProductDescription 
    @ProductId = 55, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x32 2400 RAM module offers a substantial 32GB capacity with a speed of 2400 MHz. This configuration is well-suited for tasks requiring large amounts of memory, such as video editing, 3D rendering, and virtualization. While it operates at a lower speed compared to higher-frequency modules, its large capacity ensures efficient handling of intensive applications and multitasking scenarios. The low-profile design enhances compatibility with various CPU coolers, optimizing airflow and cooling performance within the system. Corsair''s Vengeance LPX series is renowned for reliability, making this module a reliable choice for users needing ample memory for professional and high-performance computing tasks.'

EXEC AddProductDescription 
    @ProductId = 56, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x32 2666 RAM module offers substantial memory capacity at 32GB, albeit at a slightly lower speed of 2666 MHz. This configuration is ideal for tasks that require large amounts of memory, such as video editing, virtualization, or handling large datasets. Despite the lower speed compared to higher-frequency modules, it still provides sufficient performance for most applications, ensuring smooth multitasking and responsiveness. The low-profile design ensures compatibility with various CPU coolers, facilitating efficient airflow and cooling within the system. Corsair''s Vengeance LPX series is known for its reliability, making it a dependable choice for users needing high-capacity memory without compromising on stability.'

EXEC AddProductDescription 
    @ProductId = 57, 
    @Description = 'The Corsair Vengeance LPX DDR4 1x32 3000 RAM module offers substantial memory capacity with 32GB, suitable for intensive multitasking, content creation, and high-performance computing tasks. Operating at a speed of 3000 MHz, it provides reliable performance for a wide range of applications, though slightly lower than the 3600 MHz variant. Its low-profile design ensures compatibility with various CPU coolers, optimizing system airflow and cooling efficiency. Corsair''s Vengeance LPX series is known for its reliability and compatibility, making it a preferred choice for users who prioritize stability and robust performance in their systems.'

EXEC AddProductDescription 
    @ProductId = 58, 
    @Description = 'The Kingston HyperX Fury DDR4 1x8 2133 RAM module offers reliable performance with 8GB capacity and operates at a speed of 2133 MHz. It provides sufficient memory for everyday computing tasks, including web browsing, document editing, and light gaming. The low-profile design ensures compatibility with most CPU coolers, maintaining efficient system cooling. Kingston''s HyperX Fury series is known for its affordability and reliability, making it a popular choice among budget-conscious users looking to upgrade their system''s performance without compromising stability.'

EXEC AddProductDescription 
    @ProductId = 59, 
    @Description = 'The Kingston HyperX Fury DDR4 1x8 2400 RAM module delivers reliable performance with its 8GB capacity and 2400 MHz speed, suitable for everyday computing tasks and light gaming. Its low-profile design ensures compatibility with most CPU coolers, maximizing system cooling efficiency. Kingston''s HyperX Fury series is known for its stability and ease of installation, making it a popular choice among budget-conscious users looking to upgrade their system''s memory without compromising performance.'

EXEC AddProductDescription 
    @ProductId = 60, 
    @Description = 'The Kingston HyperX Fury DDR4 1x8 2666 RAM module offers reliable performance with a capacity of 8GB and operates at a speed of 2666 MHz. It provides sufficient memory for everyday computing tasks, including web browsing, office applications, and light gaming. The low-profile design ensures compatibility with various CPU coolers, optimizing system airflow for efficient cooling. Kingston''s HyperX Fury series is known for its stability and compatibility, making it a popular choice among users seeking cost-effective memory solutions without compromising performance.'

EXEC AddProductDescription 
    @ProductId = 61, 
    @Description = 'The Kingston HyperX Fury DDR4 1x8 3000 RAM module offers solid performance with its 3000 MHz speed, suitable for enhancing system responsiveness in gaming and productivity applications. Featuring a single 8GB module, it strikes a balance between capacity and affordability, ideal for budget-conscious users looking to upgrade their system''s memory. The Fury series is known for its stylish design and plug-and-play functionality, ensuring easy installation and compatibility with various systems. Kingston''s HyperX Fury RAM is a reliable choice for users seeking dependable performance and stability in their gaming setups or everyday computing tasks.'

EXEC AddProductDescription 
    @ProductId = 62, 
    @Description = 'The Kingston HyperX Fury DDR4 1x8 3200 RAM module offers solid performance with its 3200 MHz speed, ideal for enhancing system responsiveness and multitasking capabilities. Featuring a single 8GB module, it strikes a balance between capacity and speed, suitable for gaming and everyday computing tasks. The stylish heat spreader design not only looks great but also helps in heat dissipation, ensuring stable performance under heavy loads. Kingston''s HyperX Fury series is known for its reliability and compatibility, making it a popular choice among gamers and enthusiasts looking for reliable performance without compromising on aesthetics or efficiency.'

EXEC AddProductDescription 
    @ProductId = 63, 
    @Description = 'The Kingston HyperX Fury DDR4 1x8 3466 RAM module delivers fast and efficient performance with a speed of 3466 MHz, ideal for enhancing overall system responsiveness and multitasking capabilities. Featuring a single 8GB module, it strikes a balance between capacity and speed, suitable for gaming and everyday computing tasks. The Fury series is known for its stylish design and compatibility with various motherboard platforms, ensuring easy integration into gaming setups and workstations alike. Kingston''s HyperX Fury RAM modules are reliable and popular among users looking to boost their system''s performance without compromising on stability or quality.'

EXEC AddProductDescription 
    @ProductId = 64, 
    @Description = 'The Kingston HyperX Fury DDR4 1x16 2133 RAM module offers reliable performance with a capacity of 16GB and operates at a speed of 2133 MHz. While not the fastest in terms of speed, it provides sufficient memory for multitasking and general computing tasks. The Fury series is known for its robust design and compatibility with various motherboard platforms, ensuring easy integration into a wide range of systems. Kingston''s HyperX Fury RAM modules are trusted for their reliability and are suitable for users who prioritize decent performance and stability in their everyday computing experiences.'

EXEC AddProductDescription 
    @ProductId = 65, 
    @Description = 'The Kingston HyperX Fury DDR4 1x16 2400 RAM module offers reliable performance with its 2400 MHz speed, providing sufficient capacity and speed for multitasking and general computing tasks. With a single 16GB module, it accommodates memory-intensive applications and ensures smooth operation. The Fury series features a sleek design and is compatible with various motherboard platforms, making it easy to integrate into gaming setups and workstations. Kingston''s HyperX Fury RAM modules are known for their stability and quality, making them a popular choice among users seeking reliable performance for their gaming and productivity needs.'

EXEC AddProductDescription 
    @ProductId = 66, 
    @Description = 'The G.Skill Ripjaws V DDR4 1x16 2666 RAM module offers reliable performance with a capacity of 16GB and operates at a speed of 2666 MHz. This combination provides ample memory for multitasking and handling memory-intensive applications. The Ripjaws V series is known for its compatibility and ease of installation, making it suitable for various motherboard platforms. With its low-profile design, it ensures compatibility with most CPU coolers, optimizing system airflow and cooling efficiency. G.Skill''s Ripjaws V RAM modules are trusted for their stability and are a popular choice among users seeking reliable performance for gaming and productivity tasks.'

EXEC AddProductDescription 
    @ProductId = 67, 
    @Description = 'The Kingston HyperX Fury DDR4 1x16 3000 RAM module provides reliable performance with its 16GB capacity and operating speed of 3000 MHz. This configuration offers ample memory for multitasking and handling memory-intensive applications, making it suitable for both gaming and professional use. The HyperX Fury series is known for its stylish design and compatibility with various motherboard platforms, ensuring easy installation and reliable performance. Kingston''s HyperX Fury RAM modules are favored by users seeking a balance of speed, capacity, and affordability for enhancing system performance and responsiveness.'

EXEC AddProductDescription 
    @ProductId = 68, 
    @Description = 'The Kingston HyperX Fury DDR4 RAM module, specifically the 1x16GB 3200MHz variant, offers robust performance suitable for gaming and multitasking. With its high frequency of 3200MHz, it provides fast data transfer rates, enhancing overall system responsiveness. This single stick configuration allows for easy future upgrades and is ideal for systems that require high memory capacity for intensive tasks like video editing or running virtual machines. The HyperX Fury series is known for its reliability and is a popular choice among gamers and PC enthusiasts looking to boost their system''s performance without breaking the bank.'

EXEC AddProductDescription 
    @ProductId = 69, 
    @Description = 'The Kingston HyperX Fury DDR4 RAM variant you''re asking about, the 1x16 3466, offers a single stick of 16GB memory running at a speed of 3466 MHz. This configuration is ideal for systems that benefit from higher memory capacity and faster data transfer rates, such as gaming rigs and content creation workstations. The Fury series is known for its reliable performance and compatibility with various motherboard setups, making it a popular choice among enthusiasts looking to enhance their PC''s speed and responsiveness.'

EXEC AddProductDescription 
    @ProductId = 70, 
    @Description = 'The Kingston HyperX Fury DDR4 1x32 3200 RAM module offers a substantial 32GB capacity with a clock speed of 3200MHz. This makes it suitable for demanding applications like gaming, video editing, and multitasking, where large amounts of RAM are beneficial for smooth performance. The DDR4 technology ensures efficiency and reliability, while the higher clock speed enhances overall system responsiveness. It''s a good choice for users needing ample memory capacity and solid performance from their system.'
EXEC AddProductDescription
    @ProductId = 71,
    @Description = 'The G.Skill Ripjaws V DDR4 1x8 2400 RAM module offers decent performance at a lower speed of 2400 MHz. It''s designed primarily for budget-conscious users or systems where moderate performance is sufficient. With a capacity of 8GB, it''s suitable for general computing tasks, light gaming, and everyday applications. However, for more intensive tasks like video editing or gaming with demanding applications, faster RAM speeds or larger capacities might be more beneficial. Overall, it provides a cost-effective solution for basic computing needs without sacrificing reliability or stability.';

EXEC AddProductDescription
    @ProductId = 72,
    @Description = 'The G.Skill Ripjaws V DDR4 RAM in the 1x8GB 2666MHz variant is known for its reliable performance and affordability. It''s a single module configuration, which can be advantageous for future upgrades by adding more modules without needing to replace existing ones. Operating at 2666MHz, it offers decent speed for general computing tasks and gaming, though higher speeds might be preferred for more demanding applications. Overall, it''s a solid choice for budget-conscious users looking to enhance their system''s memory performance without breaking the bank.';

EXEC AddProductDescription
    @ProductId = 73,
    @Description = 'The G.Skill Ripjaws V DDR4 1x8 2800 RAM module offers reliable performance with its 2800 MHz speed and single 8GB capacity. It''s suitable for systems that require moderate RAM capacity and decent speed, making it a good choice for gaming and general computing tasks. However, for more demanding applications like video editing or heavy multitasking, you might consider higher capacity modules or faster speeds to ensure optimal performance.';

EXEC AddProductDescription
    @ProductId = 74,
    @Description = 'The G.Skill Ripjaws V DDR4 1x8GB 3000 MHz RAM module is a solid choice for those looking to upgrade their system''s memory performance. With its 3000 MHz speed, it offers faster data transfer rates, which can enhance overall system responsiveness, particularly in tasks that benefit from higher memory bandwidth. This module is designed for compatibility with various motherboards and processors, making it versatile for different PC configurations. Its single-channel configuration with 8GB capacity is suitable for users who need a moderate amount of memory for gaming, everyday computing, and multitasking without the need for extreme performance demands.';

EXEC AddProductDescription
    @ProductId = 75,
    @Description = 'The G.Skill Ripjaws V DDR4 1x16 2800 RAM module offers a single 16GB stick running at a speed of 2800MHz. This configuration is suitable for users looking to maximize their system''s RAM capacity with a single module, ideal for tasks requiring ample memory like multitasking or moderate gaming. The Ripjaws V series is known for its reliable performance and compatibility with a variety of systems, making it a popular choice among enthusiasts and builders aiming to balance cost and performance in their setups.';

EXEC AddProductDescription
    @ProductId = 76,
    @Description = 'The G.Skill Ripjaws V DDR4 1x16 3000 RAM module offers solid performance and reliability for various computing tasks. With a capacity of 16GB, it provides ample space for multitasking and demanding applications, while its 3000 MHz speed ensures smooth operation and responsiveness. This module is suitable for users who need a balance between capacity and speed, making it ideal for gaming, content creation, and everyday computing tasks where performance is key.';

EXEC AddProductDescription
    @ProductId = 77,
    @Description = 'The G.Skill Ripjaws V DDR4 1x16 3200 RAM module offers a single 16GB stick operating at a speed of 3200 MHz. It''s designed for high performance in gaming and heavy multitasking scenarios, providing ample capacity for modern applications and games. With its high speed, it ensures smooth operation and responsiveness, making it suitable for both gaming rigs and productivity-focused systems that require fast data processing.';

EXEC AddProductDescription
    @ProductId = 78,
    @Description = 'The G.Skill Ripjaws V DDR4 1x16 3600 RAM module offers high-speed performance suitable for gaming and intensive applications. With a frequency of 3600 MHz, it provides fast data transfer rates, enhancing overall system responsiveness. This module is ideal for users seeking a balance between price and performance, especially in setups where a single large capacity stick is preferred over multiple smaller ones. It''s crucial to ensure compatibility with your motherboard''s specifications to maximize its effectiveness in your system.';

EXEC AddProductDescription
    @ProductId = 79,
    @Description = 'The G.Skill Ripjaws V DDR4 1x32 2666 RAM module offers a single stick with a capacity of 32GB and operates at a speed of 2666MHz. It''s designed for systems that require high memory capacity for tasks such as content creation, virtualization, or heavy multitasking. This configuration is suitable for users who prioritize large amounts of RAM over faster speeds, ensuring smooth performance in demanding applications without the need for dual-channel configurations.';

EXEC AddProductDescription
    @ProductId = 80,
    @Description = 'The G.Skill Ripjaws V DDR4 1x32 3200 RAM module is a high-capacity memory stick designed for systems that require extensive memory for multitasking, content creation, or professional applications. Operating at a speed of 3200 MHz, it offers fast data transfer rates, which can enhance overall system performance, especially in tasks that benefit from high memory bandwidth.';

EXEC AddProductDescription
    @ProductId = 81,
    @Description = 'The G.Skill Trident DDR5 RAM, especially the 2x16GB 5600 variant, is designed for high-performance systems, offering impressive speed and capacity. It''s optimized for the latest DDR5 technology, promising enhanced bandwidth and efficiency compared to DDR4, which can significantly benefit tasks requiring intensive data processing and multitasking. The dual-channel configuration of 2x16GB ensures better performance in applications that benefit from dual-channel memory access, such as gaming and content creation.';

EXEC AddProductDescription
    @ProductId = 82,
    @Description = 'The G.Skill Trident DDR5 RAM, particularly the 2x16 6000 variant, offers exceptional performance suitable for high-end gaming and demanding applications. With a memory speed of 6000 MHz and dual-channel configuration (2x16GB), it provides excellent bandwidth for handling intensive tasks smoothly. This RAM is optimized for systems that require top-tier performance, ensuring responsiveness and efficiency even under heavy workloads. It''s a solid choice for enthusiasts and professionals looking to maximize their system''s capabilities with cutting-edge DDR5 technology.';

EXEC AddProductDescription
    @ProductId = 83,
    @Description = 'The G.Skill Trident DDR5 RAM, 2x16 6400 variant, offers high-speed performance suitable for demanding tasks like gaming, content creation, and heavy multitasking. With a dual-channel configuration and a speed of 6400 MHz, it ensures excellent data transfer rates and responsiveness, ideal for maximizing the capabilities of modern processors and applications.';

EXEC AddProductDescription
    @ProductId = 84,
    @Description = 'The G.Skill Trident DDR5 RAM in the 2x32GB 6000 variant offers high performance with a capacity of 64GB (32GB per module) and operates at a speed of 6000 MHz. This makes it suitable for demanding tasks such as high-end gaming, content creation, and professional applications where fast data transfer and multitasking capabilities are essential. The dual-channel configuration enhances performance by enabling simultaneous data access across both modules, ensuring efficient utilization of the system''s bandwidth.';

EXEC AddProductDescription
    @ProductId = 85,
    @Description = 'The Corsair Vengeance DDR5 RAM in the 2x16 5200 variant offers high-speed performance suitable for demanding applications and gaming. With a frequency of 5200 MHz, it provides excellent bandwidth for multitasking and handling intensive tasks. The dual-channel configuration enhances performance by allowing simultaneous data access across both modules. This RAM is ideal for users seeking top-tier performance and reliability in their systems, especially those built for gaming or professional use requiring high data throughput.';

EXEC AddProductDescription
    @ProductId = 86,
    @Description = 'The Corsair Vengeance DDR5 RAM with a 2x16 configuration at 5600 MHz offers high-speed performance suitable for demanding tasks like gaming and content creation. It leverages DDR5 technology for improved bandwidth and efficiency compared to DDR4, making it ideal for systems that require fast data processing and multitasking capabilities.';

EXEC AddProductDescription
    @ProductId = 87,
    @Description = 'The Corsair Vengeance DDR5 RAM kit with a 2x16 configuration at 6000 MHz offers high-speed performance suitable for demanding tasks like gaming and content creation. It utilizes DDR5 technology to provide improved bandwidth and efficiency compared to DDR4, making it ideal for systems that require high data throughput and responsiveness. This kit''s capacity and speed are well-suited for enthusiasts looking to maximize their system''s performance, especially with newer generation processors and applications that benefit from faster memory access.';

EXEC AddProductDescription
    @ProductId = 88,
    @Description = 'The Corsair Vengeance DDR5 2x16 6200 variant offers high-speed performance suitable for demanding applications and gaming. With a speed rating of 6200 MHz, it provides excellent bandwidth for tasks requiring intensive data processing and multitasking capabilities. This RAM configuration is ideal for users seeking top-tier performance and reliability, especially in systems designed for gaming, content creation, and professional applications where speed and efficiency are crucial.';

EXEC AddProductDescription
    @ProductId = 89,
    @Description = 'The Corsair Vengeance DDR5 2x16 6400 RAM kit offers high-speed performance suitable for demanding tasks like gaming, content creation, and multitasking. With a frequency of 6400 MHz, it provides excellent bandwidth for faster data transfer and responsiveness. This kit is designed to leverage the benefits of DDR5 technology, such as improved power efficiency and higher data rates compared to DDR4, making it a solid choice for users looking to future-proof their systems with cutting-edge memory capabilities.';

EXEC AddProductDescription
    @ProductId = 90,
    @Description = 'The Corsair Vengeance DDR5 2x16 6600 RAM kit offers high performance with a capacity of 32GB (2x16GB) and a blazing fast speed of 6600MHz. This makes it ideal for demanding tasks like gaming, content creation, and intensive applications where memory bandwidth is crucial. With Corsair''s reputation for quality and reliability, this RAM kit ensures not only speed but also stability under heavy workloads, making it a solid choice for enthusiasts and professionals alike seeking top-tier performance from their systems.';

EXEC AddProductDescription
    @ProductId = 91,
    @Description = 'Corsair Vengeance DDR5 RAM, particularly the 2x16 6800 variant, offers high-speed performance suitable for demanding tasks like gaming, content creation, and intensive applications. With a memory speed of 6800 MHz, it provides excellent bandwidth for smooth multitasking and enhanced system responsiveness. This RAM configuration is ideal for users looking to maximize their system''s performance with high-frequency memory modules.';

EXEC AddProductDescription
    @ProductId = 92,
    @Description = 'The Corsair Vengeance DDR5 2x16 7000 variant offers high performance with a capacity of 32GB (2x16GB) and operates at a blazing fast speed of 7000MHz. This makes it ideal for demanding tasks like gaming, video editing, and other intensive applications where speed and responsiveness are crucial. The dual-channel configuration enhances memory bandwidth, ensuring smooth multitasking and faster data transfer rates between the RAM and CPU. It''s a great choice for enthusiasts looking to maximize their system''s performance with cutting-edge DDR5 technology.';

EXEC AddProductDescription
    @ProductId = 93,
    @Description = 'The Corsair Vengeance DDR5 RAM with the 2x16 7200 variant offers high-speed performance suitable for demanding tasks like gaming, content creation, and professional applications. With a speed of 7200 MHz, it provides excellent bandwidth for handling intensive workloads and multitasking efficiently. This RAM is ideal for users looking to maximize their system''s performance and responsiveness, especially with modern processors that support high-speed DDR5 memory.';

EXEC AddProductDescription
    @ProductId = 94,
    @Description = 'The Corsair Vengeance DDR5 2x32 5200 RAM kit offers high capacity and decent speed at 5200 MHz, making it suitable for demanding tasks like gaming, video editing, and multitasking. With dual-channel configuration and ample capacity per module, it ensures smooth performance in intensive applications, supported by DDR5 technology''s efficiency and bandwidth improvements. This kit is ideal for users needing both capacity and speed without compromising on performance.';

EXEC AddProductDescription
    @ProductId = 95,
    @Description = 'The Corsair Vengeance DDR5 2x32 5600 RAM kit offers high-speed performance suitable for demanding applications and gaming. With a capacity of 64GB (2x32GB), it provides ample memory for multitasking and memory-intensive tasks. Operating at 5600MHz, it delivers fast data transfer rates, enhancing overall system responsiveness and performance. Ideal for users needing substantial RAM capacity and speed, it''s designed to handle advanced computing needs effectively.';

EXEC AddProductDescription
    @ProductId = 96,
    @Description = 'Corsair Vengeance DDR5 RAM, like the 2x32 6000 variant, offers high-speed performance suitable for demanding applications and gaming. With a frequency of 6000MHz, it provides excellent data transfer rates and responsiveness. This dual-channel kit is designed for enthusiasts looking to maximize their system''s potential, ensuring smooth multitasking and efficient data handling. Its high capacity also supports heavy workloads and future-proofing for upcoming software and games.';

EXEC AddProductDescription
    @ProductId = 97,
    @Description = 'The Corsair Vengeance DDR5 2x32 6200 variant offers high-speed performance suitable for demanding tasks like gaming, content creation, and intensive multitasking. With a speed rating of 6200 MHz and a capacity of 64GB (2x32GB), it provides ample memory for handling large datasets and running memory-intensive applications smoothly. This RAM is designed to deliver excellent overclocking potential and reliability, making it a solid choice for enthusiasts and professionals alike who require top-tier performance from their systems.';

EXEC AddProductDescription
    @ProductId = 98,
    @Description = 'The Corsair Vengeance DDR5 2x32 6400 RAM variant offers high performance with its dual-channel configuration and a speed rating of 6400 MHz. It''s designed for enthusiasts and professionals who require fast and reliable memory for intensive tasks like gaming, content creation, and high-end computing. With a capacity of 64GB (32GBx2), it provides ample room for multitasking and running memory-intensive applications smoothly. This RAM is ideal for systems that demand top-tier performance and responsiveness.';

EXEC AddProductDescription
    @ProductId = 99,
    @Description = 'Corsair Vengeance DDR5 RAM, specifically the 2x32GB 6600MHz variant, offers high-performance capabilities suitable for demanding tasks like gaming, content creation, and heavy multitasking. With its high frequency of 6600MHz, it ensures rapid data processing and responsiveness. This RAM configuration is ideal for enthusiasts and professionals who require top-tier speed and reliability for their systems, ensuring smooth operation even under intensive workloads. It''s designed to maximize the potential of DDR5 technology, offering significant performance improvements over DDR4 counterparts.';

EXEC AddProductDescription
    @ProductId = 100,
    @Description = 'The ASUS ROG Strix X670-E Gaming motherboard offers robust features tailored for gaming enthusiasts and performance seekers. Built around the AMD X670 chipset, it supports the latest Ryzen processors, providing excellent overclocking capabilities and stable performance. It features PCIe 5.0 support for high-speed connectivity, multiple M.2 slots for fast storage, and extensive RGB lighting customization options. The board includes premium audio components and networking features, making it suitable for both gaming and content creation tasks. Overall, it''s a versatile choice for users looking to build a high-end gaming rig with reliable performance and advanced features.';

EXEC AddProductDescription
    @ProductId = 101,
    @Description = 'The MSI MAG B550 TOMAHAWK motherboard is a popular choice among gamers and PC enthusiasts for its robust features and solid performance. It supports AMD Ryzen processors, offering PCIe 4.0 support for high-speed NVMe SSDs and graphics cards. The board features a well-designed VRM setup, making it suitable for overclocking. It also includes ample connectivity options with USB 3.2 Gen 2 ports and onboard Ethernet. Overall, it strikes a good balance between performance, features, and value, making it a reliable choice for gaming and productivity setups alike.';

EXEC AddProductDescription
    @ProductId = 102,
    @Description = 'The ASUS ROG Maximus Z790 Hero is a high-end motherboard designed for gaming and enthusiast-level performance. It typically features robust overclocking capabilities, premium components, and extensive connectivity options. It''s popular among gamers and enthusiasts looking for top-tier performance and reliability in their gaming rigs.';

EXEC AddProductDescription
    @ProductId = 103,
    @Description = 'The MSI PRO Z690-A motherboard is geared towards users looking for a balance of performance and affordability in the Z690 chipset range. It often includes essential features like support for the latest Intel processors, PCIe 5.0 slots for high-speed peripherals, and sufficient connectivity options for everyday use and moderate gaming needs.';

EXEC AddProductDescription
    @ProductId = 104,
    @Description = 'The Gigabyte B650 AORUS Elite motherboard is aimed at users who prioritize a balance of performance and value. It typically features support for Intel''s mid-range processors, solid build quality, and essential gaming-oriented features such as PCIe 4.0 support and robust VRM designs for stable overclocking potential. It''s suitable for gamers and content creators looking for reliable performance without breaking the bank.';

EXEC AddProductDescription
    @ProductId = 105,
    @Description = 'The MSI MPG Z790 Carbon WiFi motherboard is known for its robust performance and feature set tailored towards gamers and enthusiasts. It typically includes high-quality components, advanced overclocking capabilities, and extensive connectivity options such as WiFi 6 and multiple M.2 slots for fast storage. This motherboard is ideal for users seeking a blend of performance, reliability, and modern connectivity features for their gaming or content creation needs.';

EXEC AddProductDescription
    @ProductId = 106,
    @Description = 'The ASUS TUF Gaming X570-Plus motherboard is well-regarded for its durability, performance, and affordability in the X570 chipset lineup. It features robust VRM cooling, PCIe 4.0 support for high-speed components, and a comprehensive set of connectivity options. This motherboard is popular among gamers and enthusiasts alike for its reliability under heavy workloads and its ability to handle high-performance gaming rigs effectively.';

EXEC AddProductDescription
    @ProductId = 107,
    @Description = 'The Gigabyte AORUS Master X570 motherboard is a high-end option within the X570 chipset lineup, known for its exceptional performance and extensive feature set. It typically includes top-tier components, advanced VRM design for stable overclocking, PCIe 4.0 support, and comprehensive cooling solutions. This motherboard is favored by enthusiasts and professionals who demand maximum performance and reliability for gaming, content creation, and intensive computing tasks.';

EXEC AddProductDescription
    @ProductId = 108,
    @Description = 'The Gigabyte B650E Aorus Master motherboard is designed for users looking for a balance of performance and features in the B650 chipset category. It typically offers robust build quality, support for Intel''s mid-range processors, and features such as PCIe 4.0 support for faster data transfer speeds. This motherboard is suitable for gaming and productivity tasks, providing solid performance and reliability at a competitive price point.';

EXEC AddProductDescription
    @ProductId = 109,
    @Description = 'It typically offers robust build quality, support for Intels mid-range processors, and features such as PCIe 4.0 support for faster data transfer speeds. This motherboard is suitable for gaming and productivity tasks, providing solid performance and reliability at a competitive price point.';

EXEC AddProductDescription
    @ProductId = 110,
    @Description = 'The MSI MAG Z790 TOMAHAWK motherboard is part of MSI gaming-oriented lineup, designed for Intel 10th and 11th generation processors. It typically features robust VRM design for stable overclocking, PCIe 4.0 support, high-speed networking options, and extensive connectivity ports. This motherboard is well-suited for gamers and content creators looking for reliable performance and modern features in their PC builds.';

EXEC AddProductDescription
    @ProductId = 111,
    @Description = 'The ASRock Z790 Pro series includes various motherboards designed for different user needs, typically offering robust performance and features suitable for gaming, content creation, and everyday computing tasks. These motherboards often feature support for Intel latest processors, PCIe 4.0 slots for high-speed peripherals, advanced VRM designs for overclocking, and modern connectivity options such as WiFi 6 and multiple M.2 slots for fast storage. They are popular choices among users looking for reliable performance and versatility in their PC builds.';

EXEC AddProductDescription
    @ProductId = 112,
    @Description = 'The ASUS Prime Z790-P WIFI D4 includes various motherboards designed for different user needs, typically offering robust performance and features suitable for gaming, content creation, and everyday computing tasks. These motherboards often feature support for Intel latest processors, PCIe 4.0 slots for high-speed peripherals, advanced VRM designs for overclocking, and modern connectivity options such as WiFi 6 and multiple M.2 slots for fast storage. They are popular choices among users looking for reliable performance and versatility in their PC builds.';

EXEC AddProductDescription
    @ProductId = 113,
    @Description = 'The MSI PRO Z790-P WIFI DDR4 is part of MSI gaming-oriented lineup, designed for Intels 10th and 11th generation processors. It typically features robust VRM design for stable overclocking, PCIe 4.0 support, high-speed networking options, and extensive connectivity ports. This motherboard is well-suited for gamers and content creators looking for reliable performance and modern features in their PC builds.';

EXEC AddProductDescription
    @ProductId = 114,
    @Description = 'The Corsair RM850x is a high-performance power supply unit (PSU) known for its reliability, efficiency, and quiet operation. It is part of Corsair RMx series, featuring 80 Plus Gold certification for energy efficiency, fully modular cables for easier cable management, and a robust design suitable for gaming rigs and high-performance PCs. The RM850x is popular among enthusiasts and builders who prioritize stable power delivery and quiet operation in their systems.';

EXEC AddProductDescription
    @ProductId = 115,
    @Description = 'The EVGA SuperNOVA 750 G6 is a premium power supply unit (PSU) known for its high efficiency and reliability. It is part of EVGA of SuperNOVA G6 series, featuring 80 Plus Gold certification, fully modular cables, and a compact design suitable for mid-range to high-end gaming and workstation builds. The SuperNOVA G6 series is appreciated for its stable power delivery, quiet operation, and robust build quality, making it a popular choice among enthusiasts and professionals alike.';

EXEC AddProductDescription
    @ProductId = 116,
    @Description = 'The Seasonic PRIME TX-1000 is a flagship power supply unit (PSU) known for its exceptional performance and reliability. It belongs to Seasonic of PRIME Titanium series, offering 80 Plus Titanium certification for maximum energy efficiency and performance. The TX-1000 features a fully modular design, premium components, and a silent operation mode, making it ideal for high-end gaming rigs, workstations, and servers that require stable and efficient power delivery. It is highly regarded among enthusiasts and professionals for its top-tier build quality and long-term reliability.';

EXEC AddProductDescription
    @ProductId = 117,
    @Description = 'The Cooler Master MWE Gold 650 V2 is a power supply unit (PSU) known for its efficiency and reliability in mid-range gaming and workstation setups. It features 80 Plus Gold certification, indicating high energy efficiency, which translates to lower power consumption and reduced heat generation. The MWE Gold 650 V2 is equipped with a semi-modular design, ensuring cleaner cable management, and it includes essential protection features such as over-voltage and over-power protection. This PSU is suitable for users looking for a balance between performance, efficiency, and affordability in their PC builds.';

EXEC AddProductDescription
    @ProductId = 118,
    @Description = 'The be quiet! Straight Power 11 850W is a high-quality power supply known for its excellent performance and quiet operation. It features an 80 Plus Gold certification, ensuring high efficiency and lower energy consumption. The Straight Power 11 series is designed with a fully modular cable management system, allowing for easy installation and a cleaner internal layout. It also incorporates Silent Wings 3 fans, which are renowned for their whisper-quiet operation, making the PSU suitable for noise-sensitive environments or users seeking a quieter computing experience. The Straight Power 11 850W is well-regarded among enthusiasts and professionals alike for its reliability and performance.';

EXEC AddProductDescription
    @ProductId = 119,
    @Description = 'The Thermaltake Toughpower GF1 850W power supply unit (PSU) is recognized for its robust performance and reliability, particularly suited for high-end gaming and workstation setups. It boasts an 80 Plus Gold certification, ensuring efficient power delivery with reduced energy wastage and heat generation. The GF1 series features a fully modular design, which facilitates easier cable management and a cleaner internal build. Additionally, it includes high-quality components and comprehensive protection mechanisms to safeguard your PC components against voltage fluctuations and electrical hazards. Overall, the Toughpower GF1 850W PSU is favored by users seeking a combination of power efficiency, performance, and build quality in their systems.';

EXEC AddProductDescription
    @ProductId = 120,
    @Description = 'The Corsair AX1600i is a flagship power supply unit (PSU) renowned for its exceptional performance and efficiency. It belongs to Corsair of AXi series, featuring 80 Plus Titanium certification, which denotes the highest level of energy efficiency available for PSUs. The AX1600i is fully modular, allowing for flexible cable management and cleaner builds. It incorporates Corsair of Digital Signal Processor (DSP) for real-time monitoring and control of power delivery, ensuring stable performance and reliability under varying loads. This PSU is designed for enthusiasts and professionals who demand the best in power efficiency, reliability, and performance for their high-end gaming rigs, workstations, or servers.';

EXEC AddProductDescription
    @ProductId = 121,
    @Description = 'The NZXT C750 is a high-performance power supply unit (PSU) designed for gamers and PC enthusiasts who prioritize efficiency and clean aesthetics. It features 80 Plus Gold certification, ensuring high efficiency and reduced energy consumption. The C750 is fully modular, allowing for easy cable management and a cleaner build inside your PC case. It includes a silent operation mode for minimal noise output during low to moderate loads, making it suitable for noise-sensitive environments. NZXT focus on sleek design and reliable performance makes the C750 a popular choice among users building mid-range to high-end gaming rigs or workstations.';

EXEC AddProductDescription
    @ProductId = 122,
    @Description = 'The SilverStone Strider Platinum 850W power supply unit (PSU) is renowned for its efficiency, reliability, and premium build quality. It features 80 Plus Platinum certification, indicating very high efficiency with reduced energy waste and lower operating temperatures compared to lower-certified PSUs. The Strider Platinum 850W is fully modular, allowing for flexible cable management and a tidy build. It includes high-quality components and advanced protection features to ensure stable power delivery and protect your PC components from electrical hazards. This PSU is well-suited for enthusiasts and professionals seeking a combination of top-tier performance, efficiency, and durability for their gaming rigs, workstations, or high-performance systems.';

EXEC AddProductDescription
    @ProductId = 123,
    @Description = 'The Antec Earthwatts Gold Pro 750W power supply unit is known for its efficiency and reliability, offering 80 Plus Gold certification for energy efficiency. It is suitable for mid-range to high-end gaming rigs or workstations, providing stable power delivery and quiet operation with a thermally controlled fan. The modular design helps in managing cables neatly, improving airflow and ease of installation. Overall, it is a solid choice for users looking for a dependable power supply with good efficiency ratings and sufficient capacity for demanding components.';

EXEC AddProductDescription
    @ProductId = 124,
    @Description = 'The Gigabyte P750GM power supply is a high-performance unit designed for gaming and professional use. It features 80 Plus Gold certification, ensuring high efficiency and lower energy consumption. This PSU offers modular cabling, allowing for better cable management and improved airflow within your PC case. With a quiet 120mm fan and robust build quality, it provides reliable and stable power delivery to support high-end gaming setups or intensive workloads. Overall, it is a suitable choice for users seeking a balance between performance, efficiency, and quiet operation in their PC builds.';

EXEC AddProductDescription
    @ProductId = 125,
    @Description = 'The ASUS ROG Thor 850P power supply unit is engineered for enthusiasts and gamers seeking premium performance and aesthetics. It boasts 80 Plus Platinum certification for excellent efficiency, ensuring minimal energy waste and lower operating costs. What sets it apart is the integrated OLED display that shows real-time power usage, adding a unique feature to monitor system performance. With fully modular cables and a 135mm Wing-Blade fan for quiet operation, it delivers stable and reliable power, making it ideal for high-end gaming rigs or professional workstations where performance and reliability are paramount.';

EXEC AddProductDescription
    @ProductId = 126,
    @Description = 'The Fractal Design Ion+ 760P power supply is crafted with a focus on efficiency and reliability, featuring 80 Plus Platinum certification for high energy efficiency and reduced heat generation. It offers modular cabling, facilitating tidy cable management and improving airflow within your PC case. Designed with a quiet 120mm fan and Japanese capacitors, it ensures stable and dependable power delivery, suitable for both gaming setups and demanding professional applications. Overall, the Ion+ 760P is a solid choice for users looking for a high-quality PSU that prioritizes efficiency, reliability, and quiet operation.';

EXEC AddProductDescription
    @ProductId = 127,
    @Description = 'The Super Flower Leadex III Gold power supply is highly regarded for its robust build quality and excellent performance. It features 80 Plus Gold certification, ensuring high efficiency and energy savings while delivering reliable power to high-performance gaming rigs or workstations. With fully modular cables, it allows for easy installation and improved airflow management within your PC case. The Leadex III Gold is equipped with a silent 135mm Fluid Dynamic Bearing fan for efficient cooling and quiet operation under heavy loads. Overall, it is an ideal choice for users seeking a balance of performance, reliability, and efficiency in their power supply unit.';

EXEC AddProductDescription
    @ProductId = 128,
    @Description = 'The XPG Core Reactor 750W power supply is designed to deliver robust performance and reliability, making it suitable for gaming and high-performance computing setups. It boasts 80 Plus Gold certification for high efficiency, ensuring reduced energy waste and lower operating costs. The unit features fully modular cables, which aid in cable management and improving airflow within your PC case. It includes a quiet 120mm fan with a semi-passive mode for silent operation during low to moderate loads. Overall, the XPG Core Reactor 750W is a solid choice for users looking for a reliable power supply that offers efficiency and quiet operation for demanding applications.';

EXEC AddProductDescription
    @ProductId = 129,
    @Description = 'The Lian Li SP750 power supply unit combines sleek design with reliable performance, catering to enthusiasts and builders aiming for both aesthetics and functionality. It features 80 Plus Gold certification, ensuring high efficiency and reduced energy consumption. With fully modular cables, it allows for clean and efficient cable management, enhancing airflow and overall system neatness. The SP750 is equipped with a quiet 120mm fan for effective cooling and minimal noise output. Overall, it is an excellent choice for users looking for a stylish and efficient power supply to complement their high-performance PC builds';

EXEC AddProductDescription
    @ProductId = 130,
    @Description = 'The be quiet! Dark Power Pro 11 power supply is renowned for its exceptional build quality and performance, catering especially to enthusiasts and professionals who prioritize quiet operation and reliability. It boasts 80 Plus Platinum certification, ensuring high efficiency and reduced energy consumption. The unit features a fully modular design for flexible cable management, improving airflow and system aesthetics. With an innovative SilentWings 3 135mm fan and a unique funnel-shaped vent, it delivers excellent cooling performance while maintaining whisper-quiet operation even under heavy loads. Overall, the Dark Power Pro 11 is a top choice for users seeking premium quality, efficiency, and ultra-quiet operation in their PC power supply.';

EXEC AddProductDescription
    @ProductId = 131,
    @Description = 'The Cooler Master V750 Gold V2 power supply is designed to offer reliable performance and efficiency for gaming and professional use. It features 80 Plus Gold certification, ensuring high efficiency and lower energy consumption. The unit comes with fully modular cables, allowing for easy cable management and improved airflow within your PC case. Equipped with a quiet 120mm HDB fan, it provides effective cooling with reduced noise levels during operation. Overall, the V750 Gold V2 is a solid choice for users looking for a dependable power supply that balances performance, efficiency, and ease of installation.';

EXEC AddProductDescription
    @ProductId = 132,
    @Description = 'The Thermaltake Toughpower Grand power supply series is known for its robust build quality and reliable performance, catering to gaming enthusiasts and professionals alike. It features 80 Plus Gold or Platinum certification, ensuring high efficiency and reduced energy consumption, depending on the model. The Toughpower Grand series includes fully modular cables for easy installation and improved airflow management within your PC case. Equipped with a quiet yet powerful fan and premium components, it delivers stable power output with minimal noise even under heavy loads. Overall, it is a trusted choice for users seeking a durable and efficient power supply for demanding PC builds.';

EXEC AddProductDescription
    @ProductId = 133,
    @Description = 'The FSP Hydro PTM Pro 850W power supply is a high-performance unit designed for gamers and enthusiasts looking for reliable power delivery and efficiency. It features 80 Plus Platinum certification, ensuring excellent energy efficiency and lower operating costs. The power supply is fully modular, allowing for easy cable management and improved airflow within your PC case. Equipped with a silent 135mm FDB fan, it offers effective cooling while maintaining quiet operation under load. Overall, the Hydro PTM Pro 850W from FSP is a solid choice for users seeking a combination of performance, efficiency, and quiet operation in their gaming or high-performance PC setups.';

EXEC AddProductDescription
    @ProductId = 134,
    @Description = 'The Samsung 970 Evo 512GB PCIe 3.0 SSD is a high-performance storage solution known for its speed and reliability, ideal for gaming, content creation, and professional applications. It utilizes PCIe 3.0 interface for fast data transfer rates, offering sequential read speeds up to 3,500 MB/s and write speeds up to 2,500 MB/s, enhancing system responsiveness and reducing load times significantly. The 970 Evo series features Samsung V-NAND technology and a robust controller, ensuring durability and longevity. With capacities ranging from 250GB to 2TB, it is suitable for users looking to upgrade their system with fast, reliable storage for intensive tasks.';

EXEC AddProductDescription
    @ProductId = 135,
    @Description = 'The Samsung 970 Evo 1TB PCIe 3.0 SSD is renowned for its high-speed performance and reliability, making it an excellent choice for users who require fast data transfer rates and storage efficiency. Utilizing NVMe technology, it offers significantly faster read and write speeds compared to traditional SATA SSDs, enhancing overall system responsiveness and reducing load times for applications and games. The 970 Evo series is known for its durability and endurance, making it suitable for both gaming enthusiasts and professionals who handle intensive workloads. Overall, it is a top-tier option for those seeking superior SSD performance and reliability.';

EXEC AddProductDescription
    @ProductId = 136,
    @Description = 'The Samsung 970 Evo 2TB PCIe 3.0 SSD is a high-performance storage solution designed for users demanding fast data transfer speeds and reliable performance. It utilizes PCIe 3.0 interface for high bandwidth connectivity, offering sequential read speeds up to 3,500 MB/s and sequential write speeds up to 2,500 MB/s. This makes it ideal for tasks that require rapid data access, such as gaming, content creation, and large file transfers. The 970 Evo series is known for its endurance and reliability, backed by Samsung advanced V-NAND technology and robust SSD management software. Overall, it is a top choice for users looking to upgrade their system with a high-capacity SSD that delivers exceptional speed and reliability.';

EXEC AddProductDescription
    @ProductId = 137,
    @Description = 'The Samsung 970 Evo Plus 512GB PCIe 3.0 SSD is a high-performance storage solution that combines speed, reliability, and efficiency. It utilizes the PCIe 3.0 interface to deliver impressive sequential read speeds of up to 3,500 MB/s and sequential write speeds of up to 3,200 MB/s, making it well-suited for tasks that demand fast data access, such as gaming, video editing, and multitasking with large files.';

EXEC AddProductDescription
    @ProductId = 138,
    @Description = 'The Samsung 970 Evo Plus 1TB PCIe 3.0 SSD is a high-performance storage solution ideal for users who require fast data transfer speeds and reliable performance. It utilizes the PCIe 3.0 interface to deliver impressive sequential read speeds of up to 3,500 MB/s and sequential write speeds of up to 3,300 MB/s. This makes it well-suited for demanding applications such as gaming, content creation, and data-intensive tasks.';

EXEC AddProductDescription
    @ProductId = 139,
    @Description = 'The Samsung 970 Evo Plus 2TB PCIe 3.0 SSD is an upgraded version of the 970 Evo, offering even faster performance and enhanced reliability. It utilizes the PCIe 3.0 interface to deliver blazing-fast sequential read speeds of up to 3,500 MB/s and sequential write speeds of up to 3,300 MB/s. This makes it exceptionally suitable for demanding tasks like gaming, 3D rendering, and large file transfers.';

EXEC AddProductDescription
    @ProductId = 140,
    @Description = 'The Samsung 960 Evo 512GB PCIe 3.0 SSD is a high-performance storage solution designed for users who require fast data transfer speeds and reliability. It utilizes the PCIe 3.0 interface to achieve impressive sequential read speeds of up to 3,200 MB/s and sequential write speeds of up to 1,900 MB/s. This makes it well-suited for tasks such as gaming, content creation, and booting up large applications quickly';

EXEC AddProductDescription
    @ProductId = 141,
    @Description = 'The Samsung 960 Evo 1TB PCIe 3.0 SSD is a high-performance storage solution that offers fast data transfer speeds and reliability. It utilizes the PCIe 3.0 interface, providing sequential read speeds of up to 3,200 MB/s and sequential write speeds of up to 1,900 MB/s. This makes it well-suited for tasks that require quick data access, such as gaming, multimedia editing, and multitasking.';

EXEC AddProductDescription
    @ProductId = 142,
    @Description = 'The Samsung 960 Evo 2TB PCIe 3.0 SSD was a popular choice for users seeking high-performance storage at its release. It features a PCIe 3.0 x4 interface, offering sequential read speeds up to 3,200 MB/s and sequential write speeds up to 1,900 MB/s. This makes it suitable for tasks requiring fast data transfer, such as gaming, content creation, and multitasking with large files.';

EXEC AddProductDescription
    @ProductId = 143,
    @Description = 'The Samsung 980 512GB PCIe 3.0 SSD is designed to deliver reliable performance and speed for mainstream users and gamers. It utilizes the PCIe 3.0 interface for connectivity, offering sequential read speeds up to 3,500 MB/s and sequential write speeds up to 3,000 MB/s. This makes it suitable for tasks such as gaming, multimedia editing, and everyday computing where fast data access is crucial.';

EXEC AddProductDescription
    @ProductId = 144,
    @Description = 'The Samsung 980 1TB PCIe 3.0 SSD is designed to deliver reliable performance and fast data transfer speeds for mainstream users and gamers. It utilizes the PCIe 3.0 x4 interface, offering sequential read speeds of up to 3,500 MB/s and sequential write speeds of up to 3,000 MB/s. This makes it suitable for tasks such as gaming, multimedia editing, and everyday computing tasks that require quick data access.';

EXEC AddProductDescription
    @ProductId = 145,
    @Description = 'The Samsung 980 Pro 512GB PCIe 4.0 SSD represents a significant leap in performance over its PCIe 3.0 counterparts. It utilizes the PCIe 4.0 interface, offering substantially faster sequential read speeds of up to 6,900 MB/s and sequential write speeds of up to 5,000 MB/s. This makes it ideal for demanding applications that require ultra-fast data transfer speeds, such as 4K video editing, gaming, and large file transfers.';

EXEC AddProductDescription
    @ProductId = 146,
    @Description = 'The Samsung 980 Pro 1TB PCIe 4.0 SSD is a high-performance storage solution designed for enthusiasts and professionals who demand top-tier speed and reliability. It leverages the PCIe 4.0 interface to achieve blazing-fast sequential read speeds of up to 7,000 MB/s and sequential write speeds of up to 5,000 MB/s, making it ideal for intensive tasks like 4K video editing, gaming, and data-intensive applications.';

EXEC AddProductDescription
    @ProductId = 147,
    @Description = 'The Samsung 980 Pro 2TB PCIe 4.0 SSD is a high-performance storage solution designed to leverage the faster speeds offered by PCIe 4.0 interfaces. It delivers exceptional sequential read speeds of up to 7,000 MB/s and sequential write speeds of up to 5,000 MB/s, making it ideal for demanding applications such as 4K video editing, gaming, and data-intensive tasks.';

EXEC AddProductDescription
    @ProductId = 148,
    @Description = 'The Acer Predator GM7000 512GB SSD uses a 12 nm controller with a special compact PCB layout to achieve lower power consumption and temperatures. Additionally, the GM7000 features a custom graphene pad with higher thermal conductivity, dissipating heat and reducing operating temperatures significantly (approximately 18°C)-- even under heavy workloads. Better thermal management makes the GM7000 SSD more reliable, and with it stability comes better speeds.';

EXEC AddProductDescription
    @ProductId = 149,
    @Description = 'The Acer Predator GM7000 1TB SSD uses a 12 nm controller with a special compact PCB layout to achieve lower power consumption and temperatures. Additionally, the GM7000 features a custom graphene pad with higher thermal conductivity, dissipating heat and reducing operating temperatures significantly (approximately 18°C)-- even under heavy workloads. Better thermal management makes the GM7000 SSD more reliable, and with it stability comes better speeds.';

EXEC AddProductDescription
    @ProductId = 150,
    @Description = 'The Acer Predator GM7000 2TB SSD uses a 12 nm controller with a special compact PCB layout to achieve lower power consumption and temperatures. Additionally, the GM7000 features a custom graphene pad with higher thermal conductivity, dissipating heat and reducing operating temperatures significantly (approximately 18°C)-- even under heavy workloads. Better thermal management makes the GM7000 SSD more reliable, and with it stability comes better speeds.';

EXEC AddProductDescription
    @ProductId = 151,
    @Description = 'The Western Digital Black SN850 512GB PCIe 4.0 SSD is a high-performance storage solution designed for enthusiasts and gamers seeking fast data transfer speeds and reliable performance. It utilizes the PCIe 4.0 interface, offering sequential read speeds up to 7,000 MB/s and sequential write speeds up to 5,300 MB/s, which are significantly faster than PCIe 3.0 SSDs.';

EXEC AddProductDescription
    @ProductId = 152,
    @Description = 'The Western Digital Black SN850 1TB PCIe 4.0 SSD is a high-performance storage solution designed for enthusiasts and professionals seeking top-tier speed and reliability. It leverages the PCIe 4.0 interface to deliver blazing-fast sequential read speeds of up to 7,000 MB/s and sequential write speeds of up to 5,300 MB/s, making it ideal for intensive workloads such as gaming, 4K video editing, and data-intensive applications.';

EXEC AddProductDescription
    @ProductId = 153,
    @Description = 'The Western Digital Black SN850 2TB PCIe 4.0 SSD is a high-performance storage solution designed for enthusiasts and professionals seeking top-tier speed and reliability. It leverages the PCIe 4.0 interface to achieve blazing-fast sequential read speeds of up to 7,000 MB/s and sequential write speeds of up to 5,300 MB/s, making it ideal for intensive tasks such as gaming, content creation, and data processing.';

EXEC AddProductDescription
    @ProductId = 154,
    @Description = 'The Western Digital Black SN850X 1TB PCIe 4.0 is known for its high-performance PCIe 4.0 NVMe SSDs, catering to enthusiasts, gamers, and professionals who require fast data transfer speeds and reliable storage solutions.';

EXEC AddProductDescription
    @ProductId = 155,
    @Description = 'The Western Digital Black SN850X 2TB PCIe 4.0 is known for its high-performance PCIe 4.0 NVMe SSDs, catering to enthusiasts, gamers, and professionals who require fast data transfer speeds and reliable storage solutions.';

EXEC AddProductDescription
    @ProductId = 156,
    @Description = 'The Sabrent Rocket 4 1TB PCIe 4.0 SSD offers impressive speeds and reliability for high-performance computing. With read and write speeds that take advantage of PCIe 4.0 interface, it is ideal for tasks like gaming, content creation, and large file transfers. Its NVMe protocol ensures low latency and efficient data handling, making it a solid choice for users looking to enhance their system storage capabilities with cutting-edge technology.';

EXEC AddProductDescription
    @ProductId = 157,
    @Description = 'The Sabrent Rocket 4 2TB PCIe 4.0 SSD offers exceptional performance with read and write speeds that leverage PCIe 4.0 technology, ideal for high-demand applications and gaming. Its large capacity of 2TB provides ample space for storage-intensive tasks, ensuring quick access and data transfer rates for a smoother computing experience. This SSD is known for its reliability and speed, making it a popular choice among enthusiasts and professionals alike.';

EXEC AddProductDescription
    @ProductId = 158,
    @Description = 'The Sabrent Rocket 4 Plus 1TB PCIe 4.0 SSD is a high-performance storage solution designed for enthusiasts and professionals. It utilizes PCIe 4.0 technology to deliver blazing-fast read and write speeds, significantly enhancing data transfer rates and reducing load times for applications and games. With a capacity of 1TB, it offers ample space for large files and applications, making it suitable for gaming rigs and content creation workflows where speed and reliability are paramount.';

EXEC AddProductDescription
    @ProductId = 159,
    @Description = 'The Sabrent Rocket 4 Plus 2TB PCIe 4.0 SSD is an upgraded version known for its even faster performance compared to the standard Rocket 4. It utilizes the PCIe 4.0 interface to deliver blazing-fast read and write speeds, making it suitable for intensive workloads, gaming, and multimedia tasks. With a capacity of 2TB, it provides ample storage for large files and applications, ensuring quick data access and transfer rates. Its reliability and enhanced performance make it a solid choice for users seeking top-tier SSD performance.';

EXEC AddProductDescription
    @ProductId = 160,
    @Description = 'The Crucial P5 Plus is an NVMe M.2 PCIe 4.0 SSD with sequential read speeds of up to 6600MB/s. Leveraging Gen4 NVMe technology, it delivers exceptional performance for demanding tasks such as gaming, video editing, and content creation. Additionally, it is backward compatible with most Gen3 systems. Developed and tested by Micron, this product ensures quality from start to finish.';

EXEC AddProductDescription
    @ProductId = 161,
    @Description = 'The Crucial P5 Plusis an NVMe M.2 PCIe 4.0 SSD with sequential read speeds of up to 6600MB/s. Leveraging Gen4 NVMe technology, it delivers exceptional performance for demanding tasks such as gaming, video editing, and content creation. Additionally, it is backward compatible with most Gen3 systems. Developed and tested by Micron, this product ensures quality from start to finis';

EXEC AddProductDescription
    @ProductId = 162,
    @Description = 'The Crucial P5 Plus is an NVMe M.2 PCIe 4.0 SSD with sequential read speeds of up to 6600MB/s. Leveraging Gen4 NVMe technology, it delivers exceptional performance for demanding tasks such as gaming, video editing, and content creation. Additionally, it is backward compatible with most Gen3 systems. Developed and tested by Micron, this product ensures quality from start to finish.';

EXEC AddProductDescription
    @ProductId = 163,
    @Description = 'The Samsung 860 Evo 1TB SATA 2.5-inch SSD is a popular choice known for its reliability and performance in the SATA SSD category. It offers read and write speeds that significantly enhance overall system responsiveness and can handle intensive workloads effectively. With a capacity of 1TB, it provides ample space for storing large files, games, and applications without compromising speed. It is also known for its durability, backed by Samsung reputation for quality SSDs, making it a solid choice for both casual users and professionals looking for dependable storage solutions.';

EXEC AddProductDescription
    @ProductId = 164,
    @Description = 'The Samsung 860 Evo 2TB SATA 2.5 SSD offers reliable performance and ample storage capacity for everyday computing tasks and gaming. It is known for its SATA interface, which provides decent speeds suitable for most applications, although it is not as fast as NVMe SSDs. The 860 Evo series is also appreciated for its durability and Samsung  reputation for quality components, making it a solid choice for upgrading older systems or adding storage to desktops and laptops.';

EXEC AddProductDescription
    @ProductId = 165,
    @Description = 'The Samsung 860 Evo 4TB SATA 2.5 SSD is known for its reliable performance and large capacity, making it suitable for storing a vast amount of data with fast read and write speeds. It is a popular choice among users looking for high-capacity storage solutions that maintain solid performance over time, particularly in applications requiring consistent data access and reliability.';

EXEC AddProductDescription
    @ProductId = 166,
    @Description = 'The Samsung 860 Pro 2TB SATA 2.5 SSD is renowned for its exceptional durability and performance, making it ideal for intensive workloads and professional use. It offers high endurance ratings and reliable read/write speeds, ensuring long-term reliability and data integrity for demanding applications.';

EXEC AddProductDescription
    @ProductId = 167,
    @Description = 'The Samsung 860 Pro 1TB SATA 2.5 SSD is renowned for its durability and performance, designed for intensive workloads and professional use. It offers high sequential read and write speeds, along with robust endurance ratings, making it ideal for tasks such as content creation, data analysis, and gaming where speed and reliability are critical.';

EXEC AddProductDescription
    @ProductId = 168,
    @Description = 'The Samsung 860 Pro 4TB SATA 2.5 SSD is renowned for its exceptional durability and performance. It is designed for heavy workloads and offers superior reliability with enhanced endurance compared to the 860 Evo series. This makes it ideal for professional users or anyone needing robust storage that can handle intensive tasks without compromising on speed or data integrity.';

EXEC AddProductDescription
    @ProductId = 169,
    @Description = 'The Samsung 850 Evo 1TB SATA 2.5 SSD offers a balance of performance and affordability. It is known for its reliable speed and durability, making it a solid choice for everyday computing tasks and gaming. The 850 Evo series has been praised for its consistent performance over time, making it a popular option among users seeking dependable SSDs for their systems.';

EXEC AddProductDescription
    @ProductId = 170,
    @Description = 'The Samsung 850 Evo 2TB SATA 2.5 SSD is a predecessor to the 860 series, known for its reliability and solid performance. It offers ample storage capacity and delivers good read and write speeds suitable for everyday computing tasks and moderate workloads. While it may not have the latest features of the 860 series, it remains a dependable choice for those seeking a balance of capacity and performance in a SATA SSD.';

EXEC AddProductDescription
    @ProductId = 171,
    @Description = 'The Samsung 850 Evo 4TB SATA 2.5 SSD offers reliable performance and substantial storage capacity, although it has been succeeded by the newer 860 series. Known for its durability and efficient performance, it is a solid choice for users looking to upgrade to a high-capacity SSD with good speed and reliability, especially for everyday computing tasks and gaming.';

EXEC AddProductDescription
    @ProductId = 172,
    @Description = 'The Samsung 850 Pro 1TB SATA 2.5 SSD is recognized for its exceptional endurance and reliable performance. It is designed for demanding applications and offers enhanced durability over standard SSDs, making it suitable for professionals and enthusiasts who require high-speed, consistent storage for intensive workloads or gaming.';

EXEC AddProductDescription
    @ProductId = 173,
    @Description = 'The Samsung 850 Pro 2TB SATA 2.5 SSD is recognized for its exceptional durability and performance, aimed at demanding users and professionals who require reliable storage with high endurance. Known for its fast read and write speeds, it is suitable for tasks that require intensive data handling, such as content creation, video editing, and large file transfers.';

EXEC AddProductDescription
    @ProductId = 174,
    @Description = 'The Western Digital Blue 1TB SATA 2.5 SSD combines solid performance with a balance of storage capacity, making it suitable for everyday computing needs. It offers reliable speed and responsiveness, making tasks such as booting up your system, loading applications, and transferring files efficient. It is a good choice for users looking for dependable SSD performance in a compact 2.5-inch form factor.';

EXEC AddProductDescription
    @ProductId = 175,
    @Description = 'The Western Digital Blue 2TB SATA 2.5 SSD is known for its balance of performance, reliability, and affordability. It is suitable for users looking to upgrade from a traditional hard drive to SSD technology, offering faster data access speeds and quieter operation. The Blue series is generally well-regarded for everyday computing tasks, gaming, and multimedia storage, providing a good blend of capacity and performance for most users needs.';

EXEC AddProductDescription
    @ProductId = 176,
    @Description = 'Western Digital Blue 4TB SATA 2.5-inch SSDs are known for their balance of performance, reliability, and affordability. They provide ample storage capacity for various applications, including gaming, multimedia, and general computing. While they may not match the speed of high-end SSDs, they offer good performance for most everyday tasks and represent a solid choice for users looking to upgrade their storage without breaking the bank.';

EXEC AddProductDescription
    @ProductId = 177,
    @Description = 'The Crucial MX500 1TB SATA 2.5 SSD is highly regarded for its excellent balance of performance, reliability, and value. It delivers fast read and write speeds suitable for both everyday computing and more demanding tasks like gaming or multimedia editing. Known for its durability and efficiency, the MX500 series is a popular choice among users looking to upgrade their system storage to improve overall performance without exceeding their budget.';

EXEC AddProductDescription
    @ProductId = 178,
    @Description = 'The Crucial MX500 2TB SATA 2.5 SSD is highly regarded for its excellent balance of performance, reliability, and affordability. It offers fast read and write speeds, making it suitable for both everyday computing tasks and more demanding applications like gaming or content creation. Known for its durability and energy efficiency, the MX500 series is a popular choice among users looking to upgrade their storage with a reliable SSD that provides ample capacity for various needs.';

EXEC AddProductDescription
    @ProductId = 179,
    @Description = 'The Crucial MX500 4TB SATA 2.5-inch SSD offers excellent value with reliable performance and a large storage capacity. Known for its durability and efficient operation, it is suitable for a wide range of computing needs, from everyday tasks to gaming and multimedia. The MX500 series is well-regarded for providing solid read and write speeds, making it a dependable choice for upgrading storage in desktops or laptops seeking enhanced performance and ample space for data storage.';

EXEC AddProductDescription
    @ProductId = 180,
    @Description = 'The Crucial MX300 1TB SATA 2.5-inch SSD is a solid-state drive known for its balance of performance, reliability, and affordability. It offers good read and write speeds, making it suitable for various computing tasks such as gaming, multimedia editing, and general productivity. While it is slightly older compared to newer models like the MX500 series, it still provides a significant upgrade in speed and responsiveness compared to traditional hard drives, making it a practical choice for users looking to boost their system performance without exceeding their budget.';

EXEC AddProductDescription
    @ProductId = 181,
    @Description = 'The Crucial MX300 2TB SATA 2.5-inch SSD is a solid-state drive known for its balance of performance, reliability, and affordability. It offers good read and write speeds, making it suitable for various computing tasks such as gaming, multimedia editing, and general productivity. While it is slightly older compared to newer models like the MX500 series, it still provides a significant upgrade in speed and responsiveness compared to traditional hard drives, making it a practical choice for users looking to boost their system performance without exceeding their budget.';

EXEC AddProductDescription
    @ProductId = 182,
    @Description = 'Thermaltake Tower 300 is a micro-tower computer case designed to support high-performance systems. It accommodates various motherboard sizes, from ATX to mATX and ITX, providing ample space for easy hardware installation. Constructed with sturdy steel and equipped with cable management solutions inside, it ensures a neat and organized build. With optimal cooling capabilities, this case is tailored to meet the demands of users seeking high performance and stability for their systems.';

EXEC AddProductDescription
    @ProductId = 183,
    @Description = 'The Corsair 3000D Airflow is a compact ATX mid-tower case designed for optimal airflow. It features a minimalist exterior with a spacious interior layout that supports ATX, mATX, and mini-ITX motherboards. The case emphasizes efficient cooling with a focus on airflow, incorporating mesh front panels and strategic ventilation points. It also includes features for easy cable management and tool-free installation, making it suitable for users looking to build a balanced and cool-running gaming or professional workstation PC.';

EXEC AddProductDescription
    @ProductId = 184,
    @Description = 'The Corsair 5000D Core Airflow is a mid-tower ATX case known for its excellent airflow and spacious interior design. It features a minimalist yet functional exterior with a mesh front panel for optimal ventilation. The case supports ATX, mATX, and mini-ITX motherboards, offering ample room for high-performance components and advanced cooling solutions. It includes features such as easy cable management, tool-free drive installation, and multiple radiator mounting options, catering to enthusiasts and professionals seeking robust airflow and versatility in PC builds.';

EXEC AddProductDescription
    @ProductId = 185,
    @Description = 'The CORSAIR 2500D AIRFLOW Mid-Tower Dual Chamber PC Case delivers exceptional airflow and cooling with fully mesh panelling and a dual chamber design for an organized, stunning build, dual chambers for a streamlined look, lots of customization options, Compatible with reverse connector mATX & mITX motherboards, Unrivaled airflow performance, Wide cooling flexibility';

EXEC AddProductDescription
    @ProductId = 186,
    @Description = 'The Cooler Master MasterCase H500P is a high-performance mid-tower case known for its distinctive design and excellent cooling capabilities. It features a dual 200mm RGB fans at the front, which provide ample airflow while adding a vibrant lighting effect. The case supports ATX, micro-ATX, and mini-ITX motherboards and offers ample room for high-end graphics cards and custom cooling solutions.';

EXEC AddProductDescription
    @ProductId = 187,
    @Description = 'The Lian Li V3000 PLUS Black computer case has a simple appearance but is not close to modern with a series of RGB lights that stand out on a luxurious black tone. Lian Li V3000 PLUS Black promises to cause a storm in the user community in the near future.';

EXEC AddProductDescription
    @ProductId = 188,
    @Description = 'The Lian Li O11 Dynamic (O11D) is a sleek mid-tower PC case renowned for its premium build quality and minimalist design. Constructed from aluminum and tempered glass, it offers durability and a modern aesthetic. The case supports various motherboard sizes, including E-ATX and ATX, and provides ample room for high-performance components. With excellent airflow capabilities and support for multiple fan and radiator configurations, the O11 Dynamic is ideal for users looking to showcase their hardware with stylish tempered glass panels and efficient cable management options.';

EXEC AddProductDescription
    @ProductId = 189,
    @Description = 'The ASUS ROG Hyperion GR701 is an E-ATX case built for high-performance PCs, featuring dual 420mm radiator support, four 140mm fans, and an ARGB fan hub for superior airflow. It offers ample space for powerful GPUs, extensive cable management options, and modern conveniences like USB Type-C ports and 60W fast charging. With articulating side windows, integrated storage, and a sleek aluminum frame with Aura Sync lighting, it combines style with functionality for an exceptional build experience.';

EXEC AddProductDescription
    @ProductId = 190,
    @Description = 'MIK LV12 M Black brings a somewhat monotonous appearance when completed with a rectangular block design accompanied by simple lines. But what MIK LV12 M Black brings is much more than that with enhanced show off ability when the front and side are transparent tempered glass. In addition, the meticulously finished angular lines bring perfection to a computer case.';

EXEC AddProductDescription
    @ProductId = 191,
    @Description = 'The Cooler Master MasterBox NR200P is a versatile mini-ITX PC case renowned for its compact size and robust build quality. Featuring a mesh front panel for enhanced airflow and support for multiple fan configurations, it ensures efficient cooling for high-performance components. Its tempered glass side panel allows for a stylish showcase of your build, while modular design elements facilitate easy installation and customization. With ample space for large graphics cards and thoughtful features like tool-free installation and removable dust filters, the NR200P is perfect for building a powerful and visually appealing mini-ITX system.';

EXEC AddProductDescription
    @ProductId = 192,
    @Description = 'The INWIN N515 Nebula is a striking mid-tower PC case known for its eye-catching design and premium build quality. Its standout feature is the nebula-inspired front panel, which adds a futuristic and artistic touch to any gaming or professional setup. Built with high-quality materials, the N515 Nebula ensures durability and a luxurious feel. It supports efficient cooling with options for multiple fans and radiators, catering to high-performance builds. Inside, it offers ample space for ATX and smaller motherboards, along with thoughtful features like tool-less drive installation and removable dust filters for easy maintenance.';

EXEC AddProductDescription
    @ProductId = 193,
    @Description = 'The Lian Li Lancool 3 RGB is a mid-tower chassis designed for optimal airflow and high performance. It features a sleek design with tempered glass panels and pre-installed RGB fans, providing vibrant and customizable lighting. The case supports various motherboard sizes, including E-ATX, and offers ample space for multiple GPUs, large radiators, and extensive storage options. Enhanced cable management and tool-less features make building and maintaining the system easy and efficient. With its sturdy build and modern aesthetics, the Lancool 3 RGB is an excellent choice for gamers and PC enthusiasts.';

EXEC AddProductDescription
    @ProductId = 194,
    @Description = 'The MSI MAG Vampiric 010M is a mid-tower gaming case that combines stylish aesthetics with practical design. It features a tempered glass side panel to showcase your components and comes with a pre-installed ARGB fan that adds vibrant, customizable lighting effects. The case supports a variety of motherboard sizes, including ATX, Micro-ATX, and Mini-ITX, and offers ample room for high-performance components and efficient cooling solutions. With multiple drive bays and versatile cable management options, the Vampiric 010M ensures a clean and organized build. This case is an excellent choice for gamers seeking both functionality and visual appeal.';

EXEC AddProductDescription
    @ProductId = 195,
    @Description = 'The InWin N127 Nebula is a mid-tower chassis that boasts a futuristic design and advanced functionality. It features an eye-catching Nebula front panel with customizable ARGB lighting, creating a striking visual effect. The case supports various motherboard sizes, including ATX, Micro-ATX, and Mini-ITX, and provides ample space for high-end components and efficient cooling solutions. With tempered glass side panels, the N127 Nebula allows users to display their builds in style. Enhanced cable management, multiple drive bays, and tool-less features ensure a clean and easy building experience, making it an ideal choice for gamers and PC enthusiasts.';

EXEC AddProductDescription
    @ProductId = 196,
    @Description = 'The InWin B1 Pure is a compact and stylish mini-ITX case designed for small form factor builds. Its sleek and minimalistic design features a curved front panel and a tempered glass side panel, providing a modern aesthetic while allowing a glimpse of the internal components. Despite its compact size, the B1 Pure supports essential components and includes a 200W 80 PLUS Gold certified power supply, ensuring efficient power delivery. The case also features an innovative stand that can be used horizontally or vertically, offering versatile placement options. Ideal for minimalist setups, the B1 Pure combines elegance and functionality, making it perfect for space-conscious users.';

EXEC AddProductDescription
    @ProductId = 197,
    @Description = 'The NZXT H7 Elite is a premium mid-tower case designed for high-performance gaming and aesthetic appeal. It features a sleek, modern design with tempered glass front and side panels, showcasing the interior components and RGB lighting. The H7 Elite comes with pre-installed RGB fans and an RGB controller, allowing for vibrant, customizable lighting effects. It supports a wide range of motherboard sizes, including ATX, Micro-ATX, and Mini-ITX, and offers ample space for large GPUs, multiple storage drives, and extensive cooling solutions. With a focus on cable management, tool-less features, and optimized airflow, the H7 Elite ensures a clean and efficient build process, making it an excellent choice for gamers and PC enthusiasts.';

EXEC AddProductDescription
    @ProductId = 198,
    @Description = 'The Cougar Cratus is a high-end, mid-tower gaming case designed for enthusiasts seeking both style and performance. It features an innovative, open-frame design with sturdy metal construction and tempered glass panels, providing a unique and aggressive aesthetic. The Cratus supports a variety of motherboard sizes, including E-ATX, ATX, Micro-ATX, and Mini-ITX, and offers extensive cooling options with support for multiple radiators and fans. It includes features like ample cable management, tool-less drive installation, and customizable RGB lighting, ensuring both a visually stunning and practical build. Ideal for showcasing high-performance components, the Cougar Cratus is a top choice for gamers and PC builders who want a standout, high-performance case.';
 
DECLARE @i INT = 1;
DECLARE @rating_star INT;
DECLARE @rating_text NVARCHAR(MAX);
DECLARE @userID INT;
DECLARE @reviewCount INT;
DECLARE @userIDs TABLE (ID INT);
DECLARE @currentUserID INT;

WHILE @i <= 198
BEGIN
    DELETE FROM @userIDs;
    INSERT INTO @userIDs VALUES (1), (2), (3);
    SET @reviewCount = 1 + ABS(CHECKSUM(NEWID())) % 3;

    WHILE @reviewCount > 0
    BEGIN
        SELECT TOP 1 @currentUserID = ID FROM @userIDs ORDER BY NEWID();
        DELETE FROM @userIDs WHERE ID = @currentUserID;

        SET @rating_star = 3 + ABS(CHECKSUM(NEWID())) % 3;

        IF @rating_star = 3
            SET @rating_text = CASE ABS(CHECKSUM(NEWID())) % 3 WHEN 0 THEN 'Decent performance for basic tasks but struggles under heavy loads' WHEN 1 THEN 'Adequate for everyday tasks, not suitable for high-end gaming' ELSE 'Meets expectations for the price, but not without its flaws' END;
        ELSE IF @rating_star = 4
            SET @rating_text = CASE ABS(CHECKSUM(NEWID())) % 3 WHEN 0 THEN 'Smooth performance overall, with minor setup issues' WHEN 1 THEN 'Great value for the money, though lacking in some areas' ELSE 'Performs well for most tasks, though not perfect' END;
        ELSE IF @rating_star = 5
            SET @rating_text = CASE ABS(CHECKSUM(NEWID())) % 3 WHEN 0 THEN 'Outstanding performance and seamless integration' WHEN 1 THEN 'Exceeds expectations in every area, highly recommended' ELSE 'Top of the line performance, well worth the investment' END;

        INSERT INTO ratings(productID, userID, rating_star, rating_text)
        VALUES (@i, @currentUserID, @rating_star, @rating_text);

        SET @reviewCount = @reviewCount - 1;
    END

    SET @i = @i + 1;
END;

INSERT INTO coupons(description, discount, code, expiry, minPurchase, maxDiscount, uses)
VALUES
('Get 10% off on your next purchase', 10.00, 'SAVE10', '2025-12-31', 2000000, 300000, 10),
('Enjoy 15% off on selected items', 15.00, 'DEAL15', '2025-12-31', 2500000, 500000, 10),
('Save 20% on your order', 20.00, 'DISCOUNT20', '2025-12-31', 4000000, 2000000, 10),
('Get 25% off on all products', 25.00, 'SALE25', '2025-12-31', 4000000, 1500000, 10),
('Enjoy 30% off on your purchase', 30.00, 'SAVE30', '2025-12-31', 1000000, 300000, 10),
('50% off everything', 50.00, '50OFF', '2025-12-31', 0, 99999999, 999);