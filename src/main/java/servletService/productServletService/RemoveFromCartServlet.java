package servletService.productServletService;

import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/removeProduct")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Product> productList = (List<Product>) req.getSession().getAttribute("cart");

        int id = Integer.valueOf(req.getParameter("id"));

        if (productList != null) {
            List<Product> basketList = productList;
            basketList.remove(id);
            System.out.println(basketList);
        } else {
            System.out.println("Что-то пошло не так");
        }
        req.getRequestDispatcher("./cart.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
