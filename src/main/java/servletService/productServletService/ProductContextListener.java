package servletService.productServletService;

import dataBaseService.Dao_mysql;
import model.Product;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
@WebListener
public class ProductContextListener implements ServletContextListener {

    private List<Product> dao_productList;
    private Dao_mysql dao_mysql = new Dao_mysql();
    private String requestSQL = "SELECT * FROM products";
    private Connection connection = null;
    @Override
    public synchronized void contextInitialized(ServletContextEvent sce) {
        try{
            connection = dao_mysql.Connect();
            dao_productList = dao_mysql.getResultSet(requestSQL);
            ServletContext servletContext =
                    sce.getServletContext();
            servletContext.setAttribute("dao_productList", dao_productList);
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    @Override
    public synchronized void contextDestroyed(ServletContextEvent sce) {
        dao_mysql.Disconnect(connection);
    }
}
