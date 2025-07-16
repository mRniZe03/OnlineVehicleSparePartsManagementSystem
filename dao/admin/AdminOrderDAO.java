package dao.admin;

import java.sql.SQLException;
import java.util.List;

import model.CompanyOrderModel;
import model.CompanyOrderReportModel;

public interface AdminOrderDAO {
    boolean insertCompanyOrder(String requestId, String spareId, int adminId, int supplierId, int amount, String reason, String status, String orderdate) throws SQLException;
    CompanyOrderModel getCompanyOrderById(String requestId);
    List<CompanyOrderModel> getAllCompanyOrders();
    CompanyOrderReportModel getFullCompanyOrderReport(String requestId) throws SQLException;



}
