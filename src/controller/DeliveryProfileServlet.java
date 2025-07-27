package controller.deliverypersonnel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.deliveryModel;


@WebServlet("/DeliveryProfileServlet")
public class DeliveryProfileServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<deliveryModel> alldelivery = deliveryController.getAllstaff();
		request.setAttribute("alldelivery", alldelivery);

		// ✅ Forward to new JSP (view-only)
		request.getRequestDispatcher("DeliveryProfile.jsp").forward(request, response);
	}
}