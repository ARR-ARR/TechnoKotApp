package servletService.productServletService;

import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/showProduct")
public class ShowProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.valueOf(req.getParameter("id"));
        List<Product> productList = (List<Product>) req.getSession().getAttribute("cart");
        if (productList != null) {
            Product product = productList.get(id);
            req.setAttribute("product", product);


        } else {
            req.getRequestDispatcher("./errorPay.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("./showProduct.jsp").forward(req, resp);

    }
}
