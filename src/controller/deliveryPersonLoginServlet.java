package controller.deliverypersonnel;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.DeliveryPersonModel;
import service.deliverypersonnel.deliveryPersonServiceImpl;


@WebServlet("/deliveryPersonLoginServlet")
public class deliveryPersonLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String deliverypersonusername = request.getParameter("deliverypersonusername");
        String deliverypersonpassword = request.getParameter("deliverypersonpassword");

        // Call service to validate credentials
        DeliveryPersonModel delivery = new deliveryPersonServiceImpl().login(deliverypersonusername,deliverypersonpassword);

        if (delivery != null) {
            HttpSession session = request.getSession();
            session.setAttribute("delivery", delivery); // store delivery person in session

            response.sendRedirect("deliveryHome.jsp");
        } else {
        	response.getWriter().println("<script>alert('Invalid Username or Password.');window.location.href='deliveryPersonLogin.jsp';</script>");
        }
    }
}