package controller.supplier;

import model.SupplierModel;
import model.SupplierNotificationModel;
import service.supplier.SupplierNotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/SupplierNotificationHistoryServlet")
public class SupplierNotificationHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Use the existing concrete class
    private SupplierNotificationService notificationService = new SupplierNotificationService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");

        if (supplier == null) {
            response.sendRedirect("SupplierLogin.jsp");
            return;
        }

        int supplierId = supplier.getSupplierid();

        List<SupplierNotificationModel> notifications = notificationService.getNotificationsBySupplierId(supplierId);

        request.setAttribute("notifications", notifications);
        request.getRequestDispatcher("SupplierNotificationHistory.jsp").forward(request, response);
    }
}
