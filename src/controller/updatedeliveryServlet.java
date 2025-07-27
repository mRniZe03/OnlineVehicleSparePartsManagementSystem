package controller.deliverypersonnel;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.deliveryModel;

@WebServlet("/updatedeliveryServlet")
public class updatedeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String address= request.getParameter("address");
		String joining_date= request.getParameter("joining_date");
		
		boolean isTrue;
		isTrue =deliveryController.updatedata(id, name, email, phone, address, joining_date);
				if(isTrue== true) {
				List<deliveryModel> deliverydetails = deliveryController.getById(id);
					request.setAttribute("deliverydetails",deliverydetails);
					String alertMessage="Data update successful";
					response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='deliveryallServlet'</script>");
					
				}
				else {
					RequestDispatcher dis2= request.getRequestDispatcher("wrong.jsp");
					dis2.forward(request,response);
				}
	};

}