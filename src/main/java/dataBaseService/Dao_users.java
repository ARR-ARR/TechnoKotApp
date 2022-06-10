package dataBaseService;

import model.User;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao_users extends Dao_base {

    private Connection connection = null;


    public Dao_users() {
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

    public synchronized List<User> getResultSet(String requestSQL) throws SQLException {

        List<User> userList = new ArrayList<>();
        ResultSet resultSet = getConnection().createStatement().executeQuery(requestSQL);
        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            String fio = resultSet.getString(2);
            String email = resultSet.getString(3);
            String login = resultSet.getString(4);
            String password = resultSet.getString(5);
            String account = resultSet.getString(6);
            double sum = resultSet.getDouble(7);
            String getRole = resultSet.getString(8);
            User.ROLE role = User.ROLE.valueOf(getRole);

            userList.add(new User(id, fio, email, login, password, account, sum,  role));

        }


        return userList;
    }


}


