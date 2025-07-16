package service.admin;

import java.util.List;

import dao.admin.AdminOrderDAO;
import dao.admin.AdminOrderDAOImpl;
import model.CompanyOrderModel;
import model.CompanyOrderReportModel;

public class AdminOrderServiceImpl implements AdminOrderService {

    private AdminOrderDAO orderDAO = new AdminOrderDAOImpl();

    @Override
    public boolean addCompanyOrder(String requestId, String spareId, int adminId, int supplierId, int amount, String status,String reason,  String orderdate) {
        try {
            return orderDAO.insertCompanyOrder(requestId, spareId, adminId, supplierId, amount, status,reason,  orderdate);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public CompanyOrderModel getCompanyOrderById(String requestId) {
        try {
            return orderDAO.getCompanyOrderById(requestId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public List<CompanyOrderModel> getAllCompanyOrders() {
        return orderDAO.getAllCompanyOrders();
    }
    
    @Override
    public CompanyOrderReportModel getFullCompanyOrderReport(String requestId) {
        try {
            return orderDAO.getFullCompanyOrderReport(requestId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
