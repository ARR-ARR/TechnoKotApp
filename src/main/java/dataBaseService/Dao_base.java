package dataBaseService;

import model.Product;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

public abstract class Dao_base {
    public static final String DATABASE_PROPERTIES = "src/main/resources/database.properties";
    protected String driver = null;
    protected Properties properties = null;

    private List<Product> listProduct = null;

    public Dao_base(String driver) {
        this.driver = driver;
    }

    protected void RegisterDriverManager() {
        try {
            Class.forName(driver).getDeclaredConstructor().newInstance();

        } catch (NoSuchMethodException ex) {
            ex.printStackTrace();
        } catch (SecurityException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException | InstantiationException | InvocationTargetException ex) {
            ex.printStackTrace();
        }
    }

    public abstract Connection getConnection();

    private Properties getProperties() {

        properties = new Properties();
        try (InputStream in = Files.newInputStream(Paths.get(DATABASE_PROPERTIES))) {
            properties.load(in);
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return properties;

    }

    public Connection Connect() {

        RegisterDriverManager();
        getProperties();


        return getConnection();
    }

    public void Disconnect(Connection connection) {
        try {
            connection.close();
            connection = null;
        } catch (SQLException e) {
        }
    }




}

