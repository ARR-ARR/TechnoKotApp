package servletService.moneyService;

import dataBaseService.Dao_users;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/addingMoney")
public class AddingMoneyServlet extends HttpServlet {
    Dao_users dao_users = new Dao_users();
    Connection connection = dao_users.Connect();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("./addingMoney.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double sumAdding = Double.parseDouble(req.getParameter("sum"));
        Map<String, User> userMap = (Map<String, User>) req.getServletContext().getAttribute("MapUser");
        String login = (String) req.getSession().getAttribute("login");
        if (login != null) {
            User user = userMap.get(login);
            double userSum = user.getSum();
            userSum = sumAdding + userSum;

            try {
                PreparedStatement p = connection.prepareStatement("UPDATE users SET sum=? WHERE login=?");

                user.setSum(userSum);
                p.setDouble(1, userSum);
                p.setString(2, login);
                p.executeUpdate();


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("newSum", ("Ваш баланс: " + userMap.get(login).getSum()));
            req.setAttribute("sumMass", "Средства зачислены!");
            req.getRequestDispatcher("./addingMoney.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("./errorPay.jsp").forward(req, resp);
        }
    }
}
