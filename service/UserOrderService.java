package service.user;

import model.UserOrderModel;

import model.UserProductModel;
import java.util.List;

public interface UserOrderService {

	boolean insertOrder(UserOrderModel order);
	
    boolean insertProduct(UserProductModel product);
    String generateOrderId();
    
    boolean cancelOrder(String orderId);
    List<UserOrderModel> getOrdersByUser(int userId);
    
    //summary method
    List<UserProductModel> getOrderDetailsByOrderId(String orderId);
}
