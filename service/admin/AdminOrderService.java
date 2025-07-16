package service.admin;

import java.util.List;

import model.CompanyOrderModel;
import model.CompanyOrderReportModel;

public interface AdminOrderService {
    boolean addCompanyOrder(String requestId, String spareId, int adminId, int supplierId, int amount, String status,String reason,  String orderdate);
    CompanyOrderModel getCompanyOrderById(String requestId);
    List<CompanyOrderModel> getAllCompanyOrders();
    CompanyOrderReportModel getFullCompanyOrderReport(String requestId);

}
