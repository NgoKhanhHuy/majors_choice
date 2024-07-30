package database;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import main.Email;
import main.User;
import packages.*;
import packages.wrap.*;

public class Database {

    public static Connection connection;

    static {
        try {
            String username = "sa";
            String password = System.getenv("SQLPASSWORD") != null ? System.getenv("SQLPASSWORD") : "123";
            String database = "major";

            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + database;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String selectAll(String table) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from " + table);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            StringBuilder result = new StringBuilder();
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    result.append(metaData.getColumnName(i)).append(": ").append(resultSet.getString(i)).append("\n");
                }
                result.append("\n");
            }
            return result.toString();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean forceActivate(String username) {
        try {
            String sql = "{call forceActivate(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, username);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean userExists(String email) {
        try {
            String sql = "{call userExists(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, email);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static ArrayList<CPU> getCPUs(String inputName) {
        try {
            String sql = "{call getCPU(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<CPU> cpus = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String generation = resultSet.getString("generation");
                String socket = resultSet.getString("socket");
                int cores = resultSet.getInt("cores");
                int threads = resultSet.getInt("threads");
                int baseClock = resultSet.getInt("baseClock");
                int boostClock = resultSet.getInt("boostClock");
                int tdp = resultSet.getInt("tdp");
                String igpu = resultSet.getString("igpu");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                cpus.add(new CPU(generation, socket, cores, threads, baseClock, boostClock, tdp, image, igpu, name,
                        id, sellingPrice, costPrice, description, quantity, rateStar, rateSize));
            }
            return cpus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<GPU> getGPUs(String inputName) {
        try {
            String sql = "{call getGPU(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<GPU> gpus = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String generation = resultSet.getString("generation");
                int vram = resultSet.getInt("vram");
                int baseClock = resultSet.getInt("baseClock");
                int boostClock = resultSet.getInt("boostClock");
                int tdp = resultSet.getInt("tdp");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                gpus.add(
                        new GPU(generation, vram, baseClock, boostClock, tdp, image, name,
                                id, sellingPrice, costPrice, description, quantity, rateStar, rateSize));
            }
            return gpus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<RAM> getRAMs(String inputName) {
        try {
            String sql = "{call getRAM(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<RAM> rams = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String generation = resultSet.getString("generation");
                int capacity = resultSet.getInt("capacity");
                int speed = resultSet.getInt("speed");
                int latency = resultSet.getInt("latency");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                rams.add(new RAM(generation, capacity, speed, latency, image, name, id,
                        sellingPrice, costPrice, description, quantity, rateStar, rateSize));
            }
            return rams;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<Motherboard> getMotherboards(String inputName) {
        try {
            String sql = "{call getMotherboard(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<Motherboard> motherboards = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String socket = resultSet.getString("socket");
                String chipset = resultSet.getString("chipset");
                int igpu = resultSet.getInt("igpu");
                String formFactor = resultSet.getString("formFactor");
                String ramType = resultSet.getString("ramType");
                int maxRamSpeed = resultSet.getInt("maxRamSpeed");
                int maxRamCapacity = resultSet.getInt("maxRamCapacity");
                int ramSlots = resultSet.getInt("ramSlots");
                int wifi = resultSet.getInt("wifi");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                motherboards
                        .add(new Motherboard(socket, chipset, igpu, formFactor, ramType, maxRamSpeed, maxRamCapacity,
                                ramSlots, wifi, image, name, id, sellingPrice, costPrice, description, quantity,
                                rateStar, rateSize));
            }
            return motherboards;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<SSD> getSSDs(String inputName) {
        try {
            String sql = "{call getSSD(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<SSD> ssds = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String interfaceType = resultSet.getString("interface");
                int capacity = resultSet.getInt("capacity");
                int cache = resultSet.getInt("cache");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                ssds.add(new SSD(interfaceType, capacity, cache, image, name, id,
                        sellingPrice, costPrice, description, quantity, rateStar, rateSize));
            }
            return ssds;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<PSU> getPSUs(String inputName) {
        try {
            String sql = "{call getPSU(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<PSU> psus = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                int wattage = resultSet.getInt("wattage");
                String efficiency = resultSet.getString("efficiency");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                psus.add(new PSU(wattage, efficiency, image, name, id,
                        sellingPrice, costPrice, description, quantity, rateStar, rateSize));
            }
            return psus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static int addProductCPU(double sellingPrice, double costPrice, String name, String generation, String igpu,
            String socket,
            int cores, int threads, int baseClock, int boostClock, int tdp, String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductCPU(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, generation);
            callableStatement.setString(5, socket);
            callableStatement.setInt(6, cores);
            callableStatement.setInt(7, threads);
            callableStatement.setInt(8, baseClock);
            callableStatement.setInt(9, boostClock);
            callableStatement.setInt(10, tdp);
            callableStatement.setString(11, igpu);
            callableStatement.setString(12, image);
            callableStatement.setInt(13, quantity);
            callableStatement.registerOutParameter(14, Types.NVARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(14);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int getMaxProductId() {
        int maxId = 0;
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            if (resultSet.next()) {
                maxId = resultSet.getInt("max_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return maxId;
    }

    public static int updateProductCPU(int id, double sellingPrice, double costPrice, String name, String generation,
            String igpu,
            String socket, int cores, int threads, int baseClock, int boostClock, int tdp, String image, int quantity) {
        try {
            String sql = "{call updateProductCPU(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, generation);
            callableStatement.setString(6, igpu);
            callableStatement.setString(7, socket);
            callableStatement.setInt(8, cores);
            callableStatement.setInt(9, threads);
            callableStatement.setInt(10, baseClock);
            callableStatement.setInt(11, boostClock);
            callableStatement.setInt(12, tdp);
            callableStatement.setString(13, image);
            callableStatement.setInt(14, quantity);
            callableStatement.registerOutParameter(15, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(15);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int removeCPU(int id) {
        int n = 0;
        String sqlDeleteFromCPUs = "DELETE FROM [dbo].[cpus] WHERE id = ?";
        String sqlDeleteFromProducts = "DELETE FROM [dbo].[products] WHERE id = ?";
        try {
            connection.setAutoCommit(false);
            PreparedStatement psDeleteFromCPUs = connection.prepareStatement(sqlDeleteFromCPUs);
            psDeleteFromCPUs.setInt(1, id);
            n += psDeleteFromCPUs.executeUpdate();
            PreparedStatement psDeleteFromProducts = connection.prepareStatement(sqlDeleteFromProducts);
            psDeleteFromProducts.setInt(1, id);
            n += psDeleteFromProducts.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException e) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
            }
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                }
            } catch (SQLException e) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return n;
    }

    public static int addProductGPU(double sellingPrice, double costPrice, String name, String generation, int vram,
            int baseClock, int boostClock, int tdp, String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductGPU(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, generation);
            callableStatement.setInt(5, vram);
            callableStatement.setInt(6, baseClock);
            callableStatement.setInt(7, boostClock);
            callableStatement.setInt(8, tdp);
            callableStatement.setString(9, image);
            callableStatement.setInt(10, quantity);
            callableStatement.registerOutParameter(11, Types.NVARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(11);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int updateProductGPU(int id, double sellingPrice, double costPrice, String name, String generation,
            int vram,
            int baseClock, int boostClock, int tdp, String image, int quantity) {
        try {
            String sql = "{call updateProductGPU(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, generation);
            callableStatement.setInt(6, vram);
            callableStatement.setInt(7, baseClock);
            callableStatement.setInt(8, boostClock);
            callableStatement.setInt(9, tdp);
            callableStatement.setString(10, image);
            callableStatement.setInt(11, quantity);
            callableStatement.registerOutParameter(12, Types.VARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(12);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int removeGPU(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[gpus]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static int addProductMotherboard(double sellingPrice, double costPrice, String name, String socket,
            String chipset,
            int igpu,
            String formFactor, String ramType, int maxRamSpeed, int maxRamCapacity, int ramSlots, int wifi,
            String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductMotherboard(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, socket);
            callableStatement.setString(5, chipset);
            callableStatement.setInt(6, igpu);
            callableStatement.setString(7, formFactor);
            callableStatement.setString(8, ramType);
            callableStatement.setInt(9, maxRamSpeed);
            callableStatement.setInt(10, maxRamCapacity);
            callableStatement.setInt(11, ramSlots);
            callableStatement.setInt(12, wifi);
            callableStatement.setString(13, image);
            callableStatement.setInt(14, quantity);
            callableStatement.registerOutParameter(15, Types.NVARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(15);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int updateProductMotherboard(int id, double sellingPrice, double costPrice, String name,
            String socket,
            String chipset, int igpu, String formFactor, String ramType, int maxRamSpeed, int maxRamCapacity,
            int ramSlots, int wifi, String image, int quantity) {
        try {
            // Prepare and execute the SQL statement to update the CPU product
            String sql = "{call updateProductMotherboard(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, socket);
            callableStatement.setString(6, chipset);
            callableStatement.setInt(7, igpu);
            callableStatement.setString(8, formFactor);
            callableStatement.setString(9, ramType);
            callableStatement.setInt(10, maxRamSpeed);
            callableStatement.setInt(11, maxRamCapacity);
            callableStatement.setInt(12, ramSlots);
            callableStatement.setInt(13, wifi);
            callableStatement.setString(14, image);
            callableStatement.setInt(15, quantity);
            callableStatement.registerOutParameter(16, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(16);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int removeMotherboard(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[motherboards]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static int removePSU(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[psus]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static int addProductRAM(double sellingPrice, double costPrice, String name, String generation, int capacity,
            int speed, int latency, String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            @SuppressWarnings("unused")
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductRAM(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, generation);
            callableStatement.setInt(5, capacity);
            callableStatement.setInt(6, speed);
            callableStatement.setInt(7, latency);
            callableStatement.setString(8, image);
            callableStatement.setInt(9, quantity);
            callableStatement.registerOutParameter(10, Types.INTEGER);

            callableStatement.execute();
            String result = callableStatement.getString(10);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int updateProductRAM(int id, double sellingPrice, double costPrice, String name, String generation,
            int capacity, int speed, int latency, String image, int quantity) {
        try {
            String sql = "{call updateProductRAM(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, generation);
            callableStatement.setInt(6, capacity);
            callableStatement.setInt(7, speed);
            callableStatement.setInt(8, latency);
            callableStatement.setString(9, image);
            callableStatement.setInt(10, quantity);
            callableStatement.registerOutParameter(11, Types.VARCHAR);

            callableStatement.execute();

            String result = callableStatement.getString(11);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int removeRAM(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[rams] WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static int addProductSSD(double sellingPrice, double costPrice, String name, String connectionInterface,
            int capacity, int cache, String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductSSD(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, connectionInterface);
            callableStatement.setInt(5, capacity);
            callableStatement.setInt(6, cache);
            callableStatement.setString(7, image);
            callableStatement.setInt(8, quantity);
            callableStatement.registerOutParameter(9, Types.NVARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(9);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int updateProductSSD(int id, double sellingPrice, double costPrice, String name,
            String connectionInterface,
            int capacity, int cache, String image, int quantity) {
        try {
            // Prepare and execute the SQL statement to update the SSD product
            String sql = "{call updateProductSSD(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, connectionInterface);
            callableStatement.setInt(6, capacity);
            callableStatement.setInt(7, cache);
            callableStatement.setString(8, image);
            callableStatement.setInt(9, quantity);
            callableStatement.registerOutParameter(10, Types.VARCHAR);

            callableStatement.execute();
            // Get the result from the output parameter
            String result = callableStatement.getString(10);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int removeSSD(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[ssds] WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static String handleFileUpload(HttpServletRequest request, String inputName, String productID) {
        try {
            Part filePart = request.getPart(inputName);
            if (filePart == null || filePart.getSize() == 0) {
                return null;
            }

            String fileName = productID + ".png";

            String uploadPath = request.getServletContext().getRealPath("/images");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            File file = new File(uploadPath, fileName);

            if (file.exists()) {
                file.delete();
            }

            filePart.write(file.getAbsolutePath());
            return file.getAbsolutePath();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int updateProductPSU(int id, double sellingPrice, double costPrice, String name, int wattage,
            String efficiency, String image, int quantity) {
        try {
            String sql = "{call updateProductPSU(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setInt(5, wattage);
            callableStatement.setString(6, efficiency);
            callableStatement.setString(7, image);
            callableStatement.setInt(8, quantity);
            callableStatement.registerOutParameter(9, Types.VARCHAR);

            callableStatement.execute();
            // Get the result from the output parameter
            String result = callableStatement.getString(9);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @SuppressWarnings("unused")
    public static int addProductPSU(double sellingPrice, double costPrice, String name, int wattage, String efficiency,
            String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductPSU(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setInt(4, wattage);
            callableStatement.setString(5, efficiency);
            callableStatement.setString(6, image);
            callableStatement.setInt(7, quantity);
            callableStatement.registerOutParameter(8, Types.NVARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(8);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static ArrayList<Case> getCases(String inputName) {
        try {
            String sql = "{call getCase(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<Case> cases = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String formFactor = resultSet.getString("formFactor");
                String color = resultSet.getString("color");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                ArrayList<Rating> rates = getRating(id);
                int rateSize = rates.size();
                double rateStar = Rating.percentRate(id);
                cases.add(new Case(name, formFactor, color, image, name, id, sellingPrice,
                        costPrice, description, quantity, rateStar, rateSize));
            }
            return cases;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @SuppressWarnings("unused")
    public static int addProductCase(double sellingPrice, double costPrice, String name, String formFactor,
            String color, String image, int quantity) {
        try {
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = Database.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductCase(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = Database.connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, formFactor);
            callableStatement.setString(5, color);
            callableStatement.setString(6, image);
            callableStatement.setInt(7, quantity);
            callableStatement.registerOutParameter(8, Types.NVARCHAR);

            callableStatement.execute();
            String result = callableStatement.getString(8);
            return Integer.parseInt(result);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int updateProductCase(int id, double sellingPrice, double costPrice, String name, String formFactor,
            String color, String image, int quantity) {
        try {
            String sql = "{call updateProductCase(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, formFactor);
            callableStatement.setString(6, color);
            callableStatement.setString(7, image);
            callableStatement.setInt(8, quantity);
            callableStatement.registerOutParameter(9, Types.VARCHAR);

            callableStatement.execute();
            // Get the result from the output parameter
            String result = callableStatement.getString(9);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int deleteCart(int userID) {
        try {
            String sql = "{call deleteCart(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static int updateCart(int userID, ArrayList<Product> products) {
        if (deleteCart(userID) == 1) {
            try {
                String sql = "{call addToCart(?, ?, ?, ?, ?)}";
                CallableStatement statement = connection.prepareCall(sql);
                for (Product product : products) {
                    statement.setInt(1, userID);
                    statement.setInt(2, product.id);
                    statement.setDouble(3, product.sellingPrice);
                    statement.setDouble(4, product.costPrice);
                    statement.registerOutParameter(5, Types.INTEGER);

                    statement.execute();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
                return -1;
            }
        } else {
            return -1;
        }
        return 1;
    }

    public static int placeOrder(int userID) {
        try {
            String sql = "{call placeOrder(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();

            if (statement.getInt(2) == 1) {
                deleteCart(userID);
            }

            return statement.getInt(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        deleteCart(userID);
        return 1;
    }

    public static void addOrderInformation(String name, String phoneNumber, String address) {
        OrderInfo info = new OrderInfo();
        info.fullName = name;
        info.phoneNumber = phoneNumber;
        info.address = address;
        addOrderInformation(info);
    }

    public static void addOrderInformation(OrderInfo info) {
        try {
            String sql = "{call addOrderInformation(?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, info.fullName);
            statement.setString(2, info.phoneNumber);
            statement.setString(3, info.address);
            statement.setString(4, info.payment);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<Product> getCart(int userID) {
        ArrayList<CPU> cpus = getCPUs("");
        ArrayList<GPU> gpus = getGPUs("");
        ArrayList<Motherboard> motherboards = getMotherboards("");
        ArrayList<RAM> rams = getRAMs("");
        ArrayList<SSD> ssds = getSSDs("");
        ArrayList<PSU> psus = getPSUs("");
        ArrayList<Case> cases = getCases("");
        ArrayList<Product> products = new ArrayList<>();

        try {
            String sql = "{call getCartItems(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("productId");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String type = resultSet.getString("productType");
                switch (type) {
                    case "CPU":
                        for (CPU cpu : cpus) {
                            if (cpu.id == id) {
                                cpu.sellingPrice = sellingPrice;
                                cpu.costPrice = costPrice;
                                products.add(cpu);
                                break;
                            }
                        }
                        break;
                    case "GPU":
                        for (GPU gpu : gpus) {
                            if (gpu.id == id) {
                                gpu.sellingPrice = sellingPrice;
                                gpu.costPrice = costPrice;
                                products.add(gpu);
                                break;
                            }
                        }
                        break;
                    case "Motherboard":
                        for (Motherboard motherboard : motherboards) {
                            if (motherboard.id == id) {
                                motherboard.sellingPrice = sellingPrice;
                                motherboard.costPrice = costPrice;
                                products.add(motherboard);
                                break;
                            }
                        }
                        break;
                    case "RAM":
                        for (RAM ram : rams) {
                            if (ram.id == id) {
                                ram.sellingPrice = sellingPrice;
                                ram.costPrice = costPrice;
                                products.add(ram);
                                break;
                            }
                        }
                        break;
                    case "SSD":
                        for (SSD ssd : ssds) {
                            if (ssd.id == id) {
                                ssd.sellingPrice = sellingPrice;
                                ssd.costPrice = costPrice;
                                products.add(ssd);
                                break;
                            }
                        }
                        break;
                    case "PSU":
                        for (PSU psu : psus) {
                            if (psu.id == id) {
                                psu.sellingPrice = sellingPrice;
                                psu.costPrice = costPrice;
                                products.add(psu);
                                break;
                            }
                        }
                        break;
                    case "Case":
                        for (Case c : cases) {
                            if (c.id == id) {
                                c.sellingPrice = sellingPrice;
                                c.costPrice = costPrice;
                                products.add(c);
                                break;
                            }
                        }
                        break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public static OrderInfo getOrderInfo(int orderID) {
        OrderInfo orderInfo = new OrderInfo();
        try {
            String sql = "{call getOrderInformation(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                orderInfo.fullName = resultSet.getString("fullname");
                orderInfo.phoneNumber = resultSet.getString("phoneNumber");
                orderInfo.address = resultSet.getString("address");
                String payment = resultSet.getString("payment");
                if (payment == null) {
                    orderInfo.payment = "Cash on delivery";
                } else {
                    orderInfo.payment = payment;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderInfo;
    }

    public static ArrayList<Order> getOrders(int userID) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "{call getOrders(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                boolean found = false;
                for (Order order : orders) {
                    if (order.id == resultSet.getInt("id")) {
                        found = true;
                        order.products
                                .add(new Product(resultSet.getInt("productId"), resultSet.getString("productName"),
                                        resultSet.getDouble("sellingPrice"), resultSet.getDouble("costPrice")));
                        order.date = resultSet.getString("dateOrdered");
                        order.user = new User();
                        order.user.id = resultSet.getInt("userId") + "";
                        order.user.retrieveData("user");
                        break;
                    }
                }

                if (!found) {
                    Order order = new Order(resultSet.getInt("id"), resultSet.getString("status"));
                    orders.add(order);
                    order.products.add(new Product(resultSet.getInt("productId"), resultSet.getString("productName"),
                            resultSet.getDouble("sellingPrice"), resultSet.getDouble("costPrice")));
                    order.date = resultSet.getString("dateOrdered");
                    order.user = new User();
                    order.user.id = resultSet.getInt("userId") + "";
                    order.user.retrieveData("user");
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (Order order : orders) {
            order.orderInfo = getOrderInfo(order.id);
            order.updateQuantity();
        }
        return orders;
    }

    public static ArrayList<User> getUserDetails(String tableName) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "{call GetUserDetails(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, tableName);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                if (tableName.equals("staffs")) {
                    user.username = rs.getString("username");
                    user.retrieveData("staff");
                    users.add(user);
                } else {
                    user.username = rs.getString("username");
                    user.retrieveData("user");
                    users.add(user);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return users;
    }

    public static int addStaff(User staff) {
        try {
            String sql = "{call addStaff(?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, staff.username);
            statement.setString(2, staff.password);
            statement.setString(3, staff.fullName);
            statement.registerOutParameter(4, Types.INTEGER);

            statement.execute();
            return statement.getInt(4);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static int updateStaff(User staff) {
        try {
            String sql = "{call updateStaff(?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, Integer.parseInt(staff.id));
            statement.setString(2, staff.username);
            statement.setString(3, staff.password);
            statement.setString(4, staff.fullName);
            statement.setInt(5, staff.active);
            statement.registerOutParameter(6, Types.INTEGER);

            statement.execute();
            return statement.getInt(6);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static String getOrderStatus(int orderId) {
        String result = "";
        try {
            String sql = "{call getOrderStatus(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                result = rs.getString("status");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        switch (result) {
            case "Pending":
                return "pending";
            case "Cancellation Requested":
                return "cancel";
            case "Cancelled":
                return "cancelled";
            case "Cancellation Denied, Shipping Pending":
                return "denied";
            case "Shipping":
                return "shipping";
            case "Completed":
                return "completed";
            default:
                return null;
        }
    }

    public static void updateOrder(int id, String action) {
        String current = getOrderStatus(id);

        switch (action) {
            case "forceCancel":
                RequestOrderCancel(id);
                ApproveOrderCancel(id);
                break;
            case "cancel":
                if (current.equals("pending")) {
                    RequestOrderCancel(id);
                }
                break;
            case "approve":
                if (current.equals("cancel")) {
                    ApproveOrderCancel(id);
                }
                break;
            case "deny":
                if (current.equals("cancel")) {
                    DenyOrderCancel(id);
                }
                break;
            case "ship":
                if (current.equals("pending") || current.equals("denied")) {
                    ShipOrder(id);
                }
                break;
            case "complete":
                if (current.equals("shipping")) {
                    CompleteOrder(id);
                }
                break;
        }

        String address = getEmailFromOrderId(id);
        String status = "";

        switch (getOrderStatus(id)) {
            case "pending":
                status = "Order is pending";
                break;
            case "cancel":
                status = "Cancellation request is pending";
                break;
            case "cancelled":
                status = "Order has been cancelled";
                break;
            case "denied":
                status = "Cancellation request denied, order is pending shipping";
                break;
            case "shipping":
                status = "Order is being shipped";
                break;
            case "completed":
                status = "Order has been completed";
                break;
        }

        Email email = new Email();
        email.sendOrderStatus(address, id + "", status);
    }

    public static void CompleteOrder(int orderId) {
        try {
            String sql = "{call CompleteOrder(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void ShipOrder(int orderId) {
        try {
            String sql = "{call ShipOrder(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void DenyOrderCancel(int orderId) {
        try {
            String sql = "{call DenyOrderCancel(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void ApproveOrderCancel(int orderId) {
        try {
            String sql = "{call ApproveOrderCancel(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void RequestOrderCancel(int orderId) {
        try {
            String sql = "{call RequestOrderCancel(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void productAdjust(int productId, int count) {
        try {
            String sql = "{call ProductAdjust(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, productId);
            statement.setInt(2, count);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static int productStock(int productId) {
        try {
            String sql = "{call productQuantity(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, productId);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static String getEmailFromOrderId(int orderId) {
        try {
            String sql = "{call GetEmailFromOrderId(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static int setQuantity(int id) {
        try {
            String sql = "{call setQuantity(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, id);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static int addRating(int productId, int userId, int ratingStar, String ratingText) {
        try {
            String sql = "{call addRating(?, ?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, productId);
            statement.setInt(2, userId);
            statement.setInt(3, ratingStar);
            statement.setString(4, ratingText);
            statement.registerOutParameter(5, Types.INTEGER);

            statement.execute();
            return statement.getInt(5);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static int updateRating(int id, int ratingStar, String ratingText) {
        try {
            String sql = "{call updateRatings(?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, id);
            statement.setInt(2, ratingStar);
            statement.setString(3, ratingText);
            statement.registerOutParameter(4, Types.INTEGER);

            statement.execute();
            return statement.getInt(4);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static ArrayList<Rating> getRating(int productID) {
        try {
            String sql = "{call getRatingsByProduct(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, productID);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<Rating> list = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int productId = resultSet.getInt("productId");
                int userId = resultSet.getInt("userId");
                int rating_star = resultSet.getInt("rating_star");
                String rating_text = resultSet.getString("rating_text");
                String dateRated = resultSet.getString("dateRated");
                Rating rating = new Rating(id, userId, productId, rating_star, rating_text, dateRated);
                list.add(rating);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static int checkUserRateProduct(int productId, int userId) {
        try {
            String sql = "{call checkUserRateProduct(?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userId);
            statement.setInt(2, productId);
            statement.registerOutParameter(3, Types.INTEGER);

            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static List<Product> getMostPopularProducts() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "{call getMostPopular()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                products.add(new Product(productId));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public static int reserveCoupon(String code) {
        try {
            String sql = "{call reserveCoupon(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, code);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static double getCouponDiscount(String code) {
        try {
            String sql = "{call getCouponDiscount(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, code);
            statement.registerOutParameter(2, Types.DOUBLE);

            statement.execute();
            return statement.getDouble(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static Coupon getCouponNumbers(String code) {
        try {
            String sql = "{call getCouponNumbers(?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, code);
            statement.registerOutParameter(2, Types.DECIMAL);
            statement.registerOutParameter(3, Types.DECIMAL);
            statement.registerOutParameter(4, Types.DECIMAL);

            statement.execute();
            return new Coupon(statement.getDouble(2), statement.getDouble(3), statement.getDouble(4), code);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
