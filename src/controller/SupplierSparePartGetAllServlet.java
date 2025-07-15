package controller.supplier;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SupplierModel;
import model.SupplierSparePartModel;
import service.supplier.SparePartService;



@WebServlet("/SupplierSparePartGetAllServlet")
public class SupplierSparePartGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		HttpSession session = request.getSession(false);
		Integer supplierid = 0;

		if (session != null) {
			SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");
			if (supplier != null) {
				supplierid = supplier.getSupplierid();
			}
		}else {
			response.sendRedirect("SupplierLogin.jsp");
			return;
		}
        List<SupplierSparePartModel> spareparts = SparePartService.getPartsBySupplierId(supplierid);
		
		System.out.println("Fetched spare parts count: " + spareparts.size());
		
		 for (SupplierSparePartModel part : spareparts) {
			 
		        byte[] photoBytes = part.getPhoto(); // assuming your byte[] getter is getSpare_photo()
		        
		        if (photoBytes != null && photoBytes.length > 0) {
		            String photoBase64 = Base64.getEncoder().encodeToString(photoBytes);
		            part.setPhotoBase64(photoBase64); // store in new field
		        }
		    }

		request.setAttribute("allspareparts",spareparts);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("SupplierSparePartManagement.jsp");
	    
		dispatcher.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
