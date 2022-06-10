package servletService.moneyService;

import model.Product;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/payServlet")
public class PayServlet extends HttpServlet {
    public double finalSum;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map<String, User> userMap = (Map<String, User>) req.getServletContext().getAttribute("MapUser");
        List<Product> cartProduct = (List<Product>) req.getSession().getAttribute("cart");
        String login = (String) req.getSession().getAttribute("login");

        if (login != null) {
            User user = userMap.get(login);
            String mess = getMessage(cartProduct, user);
            cartProduct.clear();
            req.setAttribute("mess", mess);
            req.getRequestDispatcher("./buyOperation.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("./errorPay.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    public String getMessage(List<Product> cartProduct, User user) {
        double sum = 0;
        double sumCount = user.getSum();
        String message = null;
        sum = getSumCart(cartProduct, sum);

        if ((sumCount - sum) >= 0) {
            message = "Заказ оплачен!";

        } else {
            message = "Недостаточно средств на счете!";
        }
        return message;
    }

    private double getSumCart(List<Product> cartProduct, double sum) {
        for (int i = 0; i < cartProduct.size(); i++) {
            sum += cartProduct.get(i).getPrice();
        }
        return sum;
    }
}
