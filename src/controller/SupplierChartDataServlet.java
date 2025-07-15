package controller.supplier;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.supplier.SparePartReportDAO;
import model.SupplierModel;

@WebServlet("/SupplierChartDataServlet")
public class SupplierChartDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        SupplierModel supplier = (session != null) ? (SupplierModel) session.getAttribute("supplier") : null;

        if (supplier == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Supplier not logged in");
            return;
        }

        int supplierId = supplier.getSupplierid();
        SparePartReportDAO dao = new SparePartReportDAO();
        Map<String, Integer> categoryData = dao.getSparePartCountByCategory(supplierId);

        StringBuilder json = new StringBuilder();
        json.append("{ \"labels\": [");
        StringBuilder data = new StringBuilder("\"data\": [");

        boolean first = true;
        for (Map.Entry<String, Integer> entry : categoryData.entrySet()) {
            if (!first) {
                json.append(",");
                data.append(",");
            }
            json.append("\"").append(entry.getKey()).append("\"");
            data.append(entry.getValue());
            first = false;
        }

        json.append("], ").append(data).append("] }");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.write(json.toString());
        out.flush();
    }
}

