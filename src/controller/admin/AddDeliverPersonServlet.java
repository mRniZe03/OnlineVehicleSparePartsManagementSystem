package controller.admin;

import model.DeliveryPersonModel;
import service.admin.DeliveryService;
import service.admin.DeliveryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddDeliverPersonServlet")
public class AddDeliverPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("deliverypersonname");
        String email = request.getParameter("deliverypersonemail");
        String username = request.getParameter("deliverypersonusername");
        String phone = request.getParameter("deliverypersonphone");
        String password = request.getParameter("deliverypersonpassword");

        DeliveryPersonModel deliveryPerson = new DeliveryPersonModel(0, name, email, username, phone, password);

        DeliveryService service = new DeliveryServiceImpl();
        boolean success = service.addDeliveryPerson(deliveryPerson);

        if (success) {
            response.getWriter().println("<script>alert('Delivery person added successfully'); window.location='AdminDisplayDeliverServlet';</script>");
        } else {
            response.getWriter().println("<script>alert('Failed to add delivery person'); window.location='AdminAddDelivery.jsp';</script>");
        }
    }
}
