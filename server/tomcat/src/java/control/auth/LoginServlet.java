package control.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User user = new User(request.getParameter("user"), request.getParameter("pass"));

        if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
            request.getSession().invalidate();
            request.setAttribute("loginStatus", "Logged out");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            return;
        }

        switch (user.login()) {
            case 1:
                user.retrieveData("user");
                request.getSession().setAttribute("userObject", user);
                request.setAttribute("loginStatus", "Logged in");
                request.getSession().setAttribute("table", "user");
                request.getRequestDispatcher("/auth/login.jsp").forward(request, response);

                // response.sendRedirect("profile");
                // response.sendRedirect("Test");
                break;
            case -1:
                request.getSession().setAttribute("table", "user");
                request.getSession().setAttribute("userObject", user);
                request.setAttribute("user", user.username);
                request.getRequestDispatcher("/auth/activate.jsp").forward(request, response);
                break;
            case 0:
                switch (user.loginEmployee()) {
                    case 1: // manager role
                        user.retrieveData("staff");
                        request.getSession().setAttribute("userObject", user);
                        request.getSession().setAttribute("table", "manager");
                        request.setAttribute("loginStatus", "Logged in as Manager");
                        request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                        break;
                    case 0: // staff role
                        user.retrieveData("staff");
                        request.getSession().setAttribute("userObject", user);
                        request.getSession().setAttribute("table", "staff");
                        request.setAttribute("loginStatus", "Logged in as Staff");
                        request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                        break;
                    default:
                        String error = "Login failed!";
                        request.setAttribute("loginStatus", error);
                        request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                        break;
                }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}