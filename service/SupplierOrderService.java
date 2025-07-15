package service.supplier;

import java.util.List;
import model.SupplierCompanyOrderModel;

public interface SupplierOrderService {

    List<SupplierCompanyOrderModel> getOrdersBySupplierId(int supplierId);

    SupplierCompanyOrderModel getOrderDetails(String requestId, int supplierId);

    boolean updateOrderStatus(String requestId, String newStatus);

    boolean updateSparePartsQuantity(String requestId, int supplierId);

    void acceptOrderAndNotify(String requestId, String spareId, int supplierId, int amount);
    void declineOrderAndNotify(String requestId, int supplierId);
    

}
