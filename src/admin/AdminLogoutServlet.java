package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Invalidate the current session
        HttpSession session = request.getSession(false); // don't create if not exists
        if (session != null) {
            session.invalidate();
        }

        // Redirect to login page
        response.sendRedirect("RegisteredUserLogin.jsp");
    }
}
