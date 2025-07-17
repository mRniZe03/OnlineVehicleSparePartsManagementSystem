package service.supplier;

import dao.supplier.SupplierNotificationDAO;
import model.SupplierNotificationModel;

import java.util.List;

public class SupplierNotificationService {

    private SupplierNotificationDAO dao = new SupplierNotificationDAO();

    public boolean notifyAction(String requestId, int supplierId, String actionStatus) {
        return dao.insertNotification(requestId, supplierId, actionStatus);
    }

    public List<SupplierNotificationModel> getNotificationsBySupplierId(int supplierId) {
        return dao.getNotificationsBySupplierId(supplierId);
    }
}
