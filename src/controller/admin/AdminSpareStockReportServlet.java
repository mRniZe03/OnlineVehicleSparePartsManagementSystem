package controller.admin;

import model.AdminSparePartModel;
import model.SupplierSparePartModel;
import service.admin.AdminSparePartService;
import service.admin.AdminSparePartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminSpareStockReportServlet")
public class AdminSpareStockReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String spare_id = request.getParameter("spare_id");

        AdminSparePartService service = new AdminSparePartServiceImpl();
        AdminSparePartModel part = service.getSparePartById(spare_id);

        request.setAttribute("part", part);
        request.getRequestDispatcher("AdminSpareStockReport.jsp").forward(request, response);

    }
}
