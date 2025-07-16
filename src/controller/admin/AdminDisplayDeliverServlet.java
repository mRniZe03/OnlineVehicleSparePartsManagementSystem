package controller.admin;

import model.DeliveryPersonModel;
import service.admin.DeliveryService;
import service.admin.DeliveryServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDisplayDeliverServlet")
public class AdminDisplayDeliverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DeliveryService service = new DeliveryServiceImpl();
        List<DeliveryPersonModel> deliveryList = service.getAllDeliveryPersons();

        request.setAttribute("deliveryList", deliveryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminManageDeliveryAccounts.jsp");
        dispatcher.forward(request, response);
    }
}
