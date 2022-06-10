package servletService.adminService;

import dataBaseService.Dao_mysql;
import model.Product;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpClient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/populateProduct")
public class PopulateProductServlet extends HttpServlet {

    private Dao_mysql dao_mysql = new Dao_mysql();
    private Connection connection = dao_mysql.Connect();;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = (List<Product>) req.getServletContext().getAttribute("dao_productList");
        String nameProduct = req.getParameter("nameProduct");
        String brand = req.getParameter("brand");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        String page = req.getParameter("page");
        int id = productList.size() + 1;
        Product product = new Product(nameProduct, brand, price,description, page, id);
        productList.add(product);
        addToDBProduct(product);
        req.setAttribute("populateMass", "Товар добавлен");
        req.getRequestDispatcher("./populateProduct.jsp").forward(req, resp);

    }

    public void addToDBProduct(Product product){
        try {
            String reqSQL = "INSERT INTO products (id,nameProduct,brand,price,description,page) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pS = connection.prepareStatement(reqSQL);
            pS.setInt(1, product.getId());
            pS.setString(2, product.getNameProduct());
            pS.setString(3, product.getBrand());
            pS.setDouble(4, product.getPrice());
            pS.setString(5, product.getDescription());
            pS.setString(6, product.getPage());
            pS.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
