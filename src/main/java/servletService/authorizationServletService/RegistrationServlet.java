package servletService.authorizationServletService;

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
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    Dao_users dao_users = new Dao_users();
    Connection connection = dao_users.Connect();
    Random rd = new Random();
    private String requestSQL = "SELECT * FROM users";
    //  INSERT INTO users (fio,email,login,password_user,account_user,role_user) VALUES ('///','///','///','///','0000','CLIENT')

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./registration.jsp").forward(req, resp);
    }

    public List<User> getListUsers(HttpServletRequest req){
        List<User> daoUser = (ArrayList<User>) req.getServletContext().getAttribute("daoUser");
        return daoUser;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fio = req.getParameter("fio");
        String email = req.getParameter("email");
        String login = req.getParameter("login");
        String password_user = req.getParameter("password");
        String account_user = String.valueOf(rd.nextInt(9999));
        String role_user = "CLIENT";

        if (checkAttributesNewUser(login, email, req) == true) {

            try {
                String reqSQL = "INSERT INTO users (fio,email,login,password_user,account_user,role_user) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement pS = connection.prepareStatement(reqSQL);
                pS.setString(1, fio);
                pS.setString(2, email);
                pS.setString(3, login);
                pS.setString(4, password_user);
                pS.setString(5, account_user);
                pS.setString(6, role_user);
                pS.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            req.getRequestDispatcher("./loginServlet").forward(req, resp);

        } else {

            req.setAttribute("loginMass", "Пользователь с таким именем или Email уже существует");
            req.getRequestDispatcher("./registration.jsp").forward(req, resp);
        }
     }

    public boolean checkAttributesNewUser(String login, String email, HttpServletRequest req) {
        List<User> listUser = getListUsers(req);
        for (int i = 0; i < listUser.size(); i++) {
            if (login.equals(listUser.get(i).getLogin()) || email.equals(listUser.get(i).getEmail()))
                return false;
        }
        return true;
    }

}
