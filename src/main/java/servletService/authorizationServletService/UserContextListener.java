package servletService.authorizationServletService;

import dataBaseService.Dao_users;
import model.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebListener
public class UserContextListener implements ServletContextListener {

    private List<User> daoUser;
    private Map<String, User> userMap = new HashMap<>();
    private Dao_users dao_users = new Dao_users();
    private Connection connection = null;
    private String requestSQL = "SELECT * FROM users";

    @Override
    public synchronized void contextInitialized(ServletContextEvent sce) {
        try {
            connection = dao_users.Connect();
            daoUser = dao_users.getResultSet(requestSQL);
            ServletContext servletContext =
                    sce.getServletContext();
            getUserMap(daoUser);
            servletContext.setAttribute("daoUser", daoUser);
            servletContext.setAttribute("MapUser", userMap);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public synchronized void contextDestroyed(ServletContextEvent sce) {
        dao_users.Disconnect(connection);
    }

    public Map<String, User> getUserMap(List<User> daoUser) {

        for (User user : daoUser) {
            int id = user.getId();
            String fio = user.getFio();
            String email = user.getEmail();
            String login = user.getLogin();
            String password = user.getPassword();
            String account = user.getAccount();
            double sum = user.getSum();
            User.ROLE role = user.getRole();
            userMap.put(user.getLogin(), new User(id, fio, email, login, password, account, sum, role));
        }
        return userMap;
    }
}
