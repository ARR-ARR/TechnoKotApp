package servletService.productServletService;

import model.Product;
import dataBaseService.Dao_mysql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/filterServlet")
public class FilterProductServlet extends HttpServlet {
    public Dao_mysql dao_mysql = new Dao_mysql();
    private String requestSQL = null;

    public String minValue, maxValue;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String nameProduct = request.getParameter("nameProduct");
        requestSQL = "SELECT * FROM products WHERE nameProduct=\"" + nameProduct + "\";";
        getResult(request, response, requestSQL);
        request.getRequestDispatcher("/catalog.jsp").forward(request, response);
        //utf8mb4_0900_ai_ci
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);


        minValue = request.getParameter("minValue");
        maxValue = request.getParameter("maxValue");

        if (!minValue.isEmpty() && !maxValue.isEmpty()) {
            requestSQL = "SELECT * FROM products WHERE price BETWEEN " + minValue + " AND " + maxValue + ";";
        } else if (!minValue.isEmpty() && maxValue.isEmpty()) {
            requestSQL = "SELECT * FROM products WHERE price>\"" + minValue + "\";";
        } else if (!maxValue.isEmpty() && minValue.isEmpty()) {
            requestSQL = "SELECT * FROM products WHERE price<\"" + maxValue + "\";";
        } else {
            requestSQL = "SELECT * FROM products;";
        }

        getResult(request, response, requestSQL);


    }

    private void getResult(HttpServletRequest request, HttpServletResponse response, String requestSQL) throws
            ServletException, IOException {

        dao_mysql.Connect();

        try {
            List<Product> lp = dao_mysql.getResultSet(requestSQL);
            request.setAttribute("listProduct", lp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        //getServletContext().getRequestDispatcher("/catalog.jsp").forward(request, response);
        request.getRequestDispatcher("/catalog.jsp").forward(request, response);
    }
}
