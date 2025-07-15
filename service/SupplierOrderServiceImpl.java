package service.supplier;

import java.util.List;

import dao.supplier.SupplierOrderDAO;
import model.SupplierCompanyOrderModel;

public class SupplierOrderServiceImpl implements SupplierOrderService {

    private SupplierOrderDAO orderDAO = new SupplierOrderDAO();

    @Override
    public List<SupplierCompanyOrderModel> getOrdersBySupplierId(int supplierId) {
        return orderDAO.getOrdersBySupplierId(supplierId);
    }

    @Override
    public SupplierCompanyOrderModel getOrderDetails(String requestId, int supplierId) {
        return orderDAO.getOrderDetails(supplierId); // confirm logic
    }

    @Override
    public boolean updateOrderStatus(String requestId, String newStatus) {
        return orderDAO.updateOrderStatus(requestId, newStatus);
    }

    @Override
    public boolean updateSparePartsQuantity(String requestId, int supplierId) {
        return orderDAO.updateSparePartsQuantity(requestId, supplierId);
    }

    @Override
    public void acceptOrderAndNotify(String requestId, String spareId, int supplierId, int amount) {
        orderDAO.acceptOrderAndNotify(requestId, spareId, supplierId, amount);
    }

    @Override
    public void declineOrderAndNotify(String requestId, int supplierId) {
        orderDAO.declineOrderAndNotify(requestId, supplierId);
    }


}
