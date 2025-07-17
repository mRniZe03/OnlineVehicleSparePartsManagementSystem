// SupplierDashboardServlet.java
package controller.supplier;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SupplierModel;
import dao.supplier.SparePartReportDAO;

@WebServlet("/SupplierDashboardServlet")
public class SupplierDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        SupplierModel supplier = (session != null) ? (SupplierModel) session.getAttribute("supplier") : null;

        if (supplier == null) {
            response.sendRedirect("SupplierLogin.jsp");
            return;
        }

        int supplierId = supplier.getSupplierid();

        SparePartReportDAO reportDAO = new SparePartReportDAO();

        int lowStock = reportDAO.getLowStockCount(supplierId);
        int sparePartsCount = reportDAO.getSparepartCount(supplierId);
        BigDecimal income = reportDAO.getAdditionalIncome(supplierId);
        List<Map<String, String>> recentOrders = reportDAO.getRecentOrders(supplierId);
        int newOrders = reportDAO.getNewOrdersCount(supplierId); 

        request.setAttribute("lowStock", lowStock);
        request.setAttribute("sparePartsCount", sparePartsCount);
        request.setAttribute("newOrders", newOrders);
        request.setAttribute("additionalIncome", income);
        request.setAttribute("recentOrders", recentOrders);
        
        
      

        request.getRequestDispatcher("SupplierDashboard.jsp").forward(request, response);
    }
}

