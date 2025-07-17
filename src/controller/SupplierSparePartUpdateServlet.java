package controller.supplier;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.supplier.SparePartService;

@WebServlet("/SupplierSparePartUpdateServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,
	    maxFileSize = 1024 * 1024 * 5,
	    maxRequestSize = 1024 * 1024 * 10
	)
public class SupplierSparePartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
            // Get parameters
            String spare_id = request.getParameter("spare_id");
            String name = request.getParameter("name");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            String category = request.getParameter("category");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");
            
            // Process photo upload if present
            byte[] photoBytes = null;
            Part filePart = request.getPart("spare_photo");
            if (filePart != null && filePart.getSize() > 0) {
                photoBytes = filePart.getInputStream().readAllBytes();
            }
            
            // Update data
            boolean isUpdated = SparePartService.updatedata(
                spare_id, name, price, category, quantity, description, photoBytes);
            
            if (isUpdated) {
                response.getWriter().println("<script>alert('Update successful'); window.location.href='SupplierSparePartGetAllServlet'</script>");
            } else {
            	 response.getWriter().println("<script>alert('Update failed: New quantity cannot be less than current quantity'); window.location.href='SupplierDashboard.jsp'</script>");
            }
            	 
        } catch (Exception e) {
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); history.back();</script>");
        }
		
	}

}
