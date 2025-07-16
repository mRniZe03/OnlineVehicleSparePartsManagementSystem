package controller.admin;

import model.DeliveryPersonModel;
import service.admin.DeliveryService;
import service.admin.DeliveryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminUpdateDeliverServlet")
public class AdminUpdateDeliverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        int deliverypersonid = Integer.parseInt(request.getParameter("deliverypersonid"));
        String name = request.getParameter("deliverypersonname");
        String email = request.getParameter("deliverypersonemail");
        String phone = request.getParameter("deliverypersonphone");

        // Create model (username & password not updated here)
        DeliveryPersonModel deliveryPerson = new DeliveryPersonModel(deliverypersonid, name, email, null, phone, null);

        // Call service
        DeliveryService service = new DeliveryServiceImpl();
        boolean updated = service.updateDeliveryPerson(deliveryPerson);

        // Redirect
        if (updated) {
            response.sendRedirect("AdminDisplayDeliverServlet");
        } else {
            response.getWriter().println("<script>alert('Update failed'); window.history.back();</script>");
        }
    }
}
