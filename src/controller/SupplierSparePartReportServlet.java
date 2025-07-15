package controller.supplier;

import model.SupplierSparePartReportModel;
import service.supplier.SupplierReportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SupplierSparePartReportServlet")
public class SupplierSparePartReportServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String request_id = request.getParameter("request_id");

        SupplierSparePartReportModel report = SupplierReportService.getReportDetailsByRequestId(request_id);
        request.setAttribute("report", report);
        request.getRequestDispatcher("SupplierSparePartOrderReport.jsp").forward(request, response);
    }
}

