package controller.admin;

import service.admin.DeliveryService;
import service.admin.DeliveryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminDeleteDeliverServlet")
public class AdminDeleteDeliverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int deliverypersonid = Integer.parseInt(request.getParameter("deliverypersonid"));

        DeliveryService service = new DeliveryServiceImpl();
        boolean deleted = service.deleteDeliveryPerson(deliverypersonid);

        if (deleted) {
            response.sendRedirect("AdminDisplayDeliverServlet");
        } else {
            response.getWriter().println("<script>alert('Delete failed'); window.history.back();</script>");
        }
    }
}

