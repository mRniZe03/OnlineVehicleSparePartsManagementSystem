package controller.supplier;

import util.DBconnection;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.SupplierModel;
import service.supplier.SparePartService;

@WebServlet("/SupplierSparePartInsertServlet")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 5,      // 5MB
    maxRequestSize = 1024 * 1024 * 10   // 10MB
)
public class SupplierSparePartInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Session Validation
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("supplier") == null) {
            response.sendRedirect("SupplierLogin.jsp");
            return;
        }
        SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");
        int supplierid = supplier.getSupplierid();

        // 2. Parameter Extraction
        String name = request.getParameter("name");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String status = "active";
        byte[] spare_photo = null;

        // 3. Image Processing
        Part filePart = request.getPart("spare_photo");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                spare_photo = inputStream.readAllBytes();
            } catch (IOException e) {
                handleError(request, response, "Error processing image upload");
                return;
            }
        }

        // 4. Generate SP-0001 format ID
        String spare_id = generateNextSpareId();

        // 5. Database Insertion
        boolean isInserted = false;
        try {
            isInserted = SparePartService.insertdata(
                spare_id, name, price, category, quantity,
                description, spare_photo, supplierid, status
            );
        } catch (Exception e) {
            handleError(request, response, "Database error: " + e.getMessage());
            return;
        }

        // 6. Result Handling
        if (isInserted) {
            response.getWriter().println("<script>alert('Spare Part Added Successfully');"+
                                       "location.href='SupplierSparePartGetAllServlet?success=true'</script>");
        } else {
            request.setAttribute("allspareparts", SparePartService.getById(spare_id));
            request.setAttribute("errorMsg", "Insert failed");
            request.getRequestDispatcher("SupplierSparepartInsert.jsp").forward(request, response);
        }
    }

    private String generateNextSpareId() {
        String spare_id = "SP-0001"; // Default if something fails
        
        String sql = "SELECT MAX(CAST(SUBSTRING(spare_id, 4) AS UNSIGNED)) as max_id " +
                     "FROM spare_parts WHERE spare_id REGEXP '^SP-[0-9]+$'";
        
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                int maxId = rs.getInt("max_id");
                spare_id = String.format("SP-%04d", maxId + 1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Fall through to return default
        }
        
        return spare_id;
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message) 
            throws ServletException, IOException {
        request.setAttribute("error", message);
        request.getRequestDispatcher("SupplierSparepartInsert.jsp")
               .forward(request, response);
    }
}
    


