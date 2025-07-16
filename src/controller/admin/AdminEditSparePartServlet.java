package controller.admin;

import model.AdminSparePartModel;
import service.admin.AdminSparePartService;
import service.admin.AdminSparePartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminEditSparePartServlet")
public class AdminEditSparePartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String spareId = request.getParameter("spare_id");
        AdminSparePartService service = new AdminSparePartServiceImpl();
        AdminSparePartModel sparePart = service.getSparePartById(spareId);

        if (sparePart == null) {
            response.sendRedirect("AdminSparePartGetAllServlet");
            return;
        }

        request.setAttribute("sparePart", sparePart);
        request.getRequestDispatcher("UpdateSparePartForm.jsp").forward(request, response);
    }
}

