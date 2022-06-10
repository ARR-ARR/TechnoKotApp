package servletService.cartServletService;

import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@WebServlet("/addProductToCart")
public class AddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = (List<Product>) getServletContext().getAttribute("dao_productList");
        int id = Integer.valueOf(req.getParameter("id"));
        Product product = productList.get(id-1);

        Object cart = req.getSession().getAttribute("cart");
        List<Product> cartProduct;

        if(cart != null){
            cartProduct = (List<Product>) cart;
            cartProduct.add(product);


        } else {
            cartProduct = new ArrayList<>();
            cartProduct.add(product);
            req.getSession().setAttribute("cart", cartProduct);

        }

        String answer = "<p>Product " + product.getBrand() + " added to cart</p>";
        req.getSession().setAttribute("answer", answer);

        req.getRequestDispatcher("./catalogServlet").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }


}
