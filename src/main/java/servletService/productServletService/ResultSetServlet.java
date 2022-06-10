package servletService.productServletService;

import model.Product;
import dataBaseService.Dao_mysql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/catalogServlet")
public class ResultSetServlet extends HttpServlet {
    Dao_mysql dao_mysql = new Dao_mysql();
    String requestSQL = "SELECT * FROM products";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection connection = dao_mysql.Connect();


        try {
            List<Product> lp = dao_mysql.getResultSet(requestSQL);

        request.setAttribute("listProduct", lp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        getServletContext().getRequestDispatcher("/catalog.jsp").forward(request, response);

        dao_mysql.Disconnect(connection);
    }


}
