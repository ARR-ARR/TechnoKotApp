package dataBaseService;

import model.Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Dao_mysql extends Dao_base {

    private Connection connection = null;

    public Dao_mysql() {
        super("com.mysql.cj.jdbc.Driver");
    }

    @Override
    public Connection getConnection() {
        return connection;
    }

    @Override
    public Connection Connect() {
        super.Connect();
        String url = properties.getProperty("url");
        String username = properties.getProperty("username");
        String password = properties.getProperty("password");


        try {
            connection = DriverManager.getConnection(url, username, password);

            return connection;
        } catch (SQLException e) {
            connection = null;
        }
        return null;
    }


    public List<Product> getResultSet(String requestSQL) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        ResultSet resultSet = getConnection().createStatement().executeQuery(requestSQL);
        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            String nameProduct = resultSet.getString(2);
            String brand = resultSet.getString(3);
            double price = resultSet.getDouble(4);
            String description = resultSet.getString(5);
            String page = resultSet.getString(6);

            listProduct.add(new Product(nameProduct, brand, price, description, page, id));

        }


        return listProduct;
    }
}
