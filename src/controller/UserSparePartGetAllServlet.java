package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;


import javax.servlet.http.HttpSession;

import model.UserSparePartModel;
import service.supplier.SparePartService;


@WebServlet("/UserSparePartGetAllServlet")
public class UserSparePartGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<UserSparePartModel> parts = SparePartService.getAllSpareParts();
        request.setAttribute("spareParts", parts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("UserShop.jsp");
        dispatcher.forward(request, response);
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
	}

}
