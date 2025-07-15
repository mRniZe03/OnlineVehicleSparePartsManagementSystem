package controller.supplier;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.SupplierCompanyOrderModel;
import model.SupplierModel;
import service.supplier.SupplierOrderService;
import service.supplier.SupplierOrderServiceImpl;

@WebServlet("/SupplierOrderActionServlet")
public class SupplierOrderActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private SupplierOrderService orderService = new SupplierOrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");

        if (supplier == null) {
            response.sendRedirect("SupplierLogin.jsp");
            return;
        }

        int supplierId = supplier.getSupplierid();

        List<SupplierCompanyOrderModel> orders = orderService.getOrdersBySupplierId(supplierId);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("SupplierViewOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String requestId = request.getParameter("requestId");
            String spareId = request.getParameter("spareId");  // should be a string
            int amount = Integer.parseInt(request.getParameter("amount"));
            int supplierId = Integer.parseInt(request.getParameter("supplierid"));

            if ("accept".equalsIgnoreCase(action)) {
                // FIXED: match correct parameter order as per method declaration
                orderService.acceptOrderAndNotify(requestId, spareId, supplierId, amount);
            } else if ("decline".equalsIgnoreCase(action)) {
                orderService.declineOrderAndNotify(requestId, supplierId);
            }

            response.sendRedirect("SupplierOrderActionServlet");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Order action failed: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
