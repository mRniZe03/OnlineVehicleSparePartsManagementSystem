package controller.admin;

import model.CompanyOrderReportModel;
import service.admin.AdminOrderService;
import service.admin.AdminOrderServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminCompanyOrderReportServlet")
public class AdminCompanyOrderReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestId = request.getParameter("request_id");
        if (requestId == null || requestId.trim().isEmpty()) {
            response.sendRedirect("AdminCompanyOrdersServlet");
            return;
        }

        AdminOrderService service = new AdminOrderServiceImpl();
        CompanyOrderReportModel report = service.getFullCompanyOrderReport(requestId);

        if (report == null) {
            response.getWriter().println("<script>alert('Order report not found'); window.location.href='AdminCompanyOrdersServlet';</script>");
            return;
        }

        request.setAttribute("report", report);
        RequestDispatcher rd = request.getRequestDispatcher("AdminCompanyOrderReport.jsp");
        rd.forward(request, response);
    }
}

