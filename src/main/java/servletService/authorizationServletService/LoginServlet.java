package servletService.authorizationServletService;

import dataBaseService.UserService;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        setAuthorization(req, resp);

    }

    private void setAuthorization(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(600000);

        List<User> daoUser = (ArrayList<User>) req.getServletContext().getAttribute("daoUser");
        if (session != null &&
                session.getAttribute("login") != null &&
                session.getAttribute("password") != null) {
            User.ROLE role = (User.ROLE) session.getAttribute("role");

            moveToMenu(req, resp, role);

        } else if (userService.userIsExist(login, password, daoUser)) {

            User.ROLE role = userService.getRoleByLoginPassword(login, password, daoUser);

            session.setAttribute("password", password);
            session.setAttribute("login", login);
            session.setAttribute("role", role);

            moveToMenu(req, resp, role);
        } else {
            moveToMenu(req, resp, User.ROLE.UNKNOWN);
        }
    }

    private void moveToMenu(HttpServletRequest req, HttpServletResponse resp, User.ROLE role) throws ServletException, IOException {
        if (role.equals(User.ROLE.ADMIN)) {

            req.getRequestDispatcher("./admin_menu.jsp").forward(req, resp);

        } else if (role.equals(User.ROLE.CLIENT)) {

            req.getRequestDispatcher("./profile.jsp").forward(req, resp);

        } else {
            req.getRequestDispatcher("./login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        setAuthorization(req, resp);
    }


}
