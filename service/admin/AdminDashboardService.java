package service.admin;

import java.util.Map;

public interface AdminDashboardService {
    int getTotalSpareParts();
    int getNewOrdersCount();
    int getPendingDeliveries();
    int getRegisteredUserCount();
    int getTotalSuppliers();
    Map<String, Integer> fetchRecentMonthlyOrderStats();
    Map<String, Double> getMonthlyRevenue();
    Map<String, Integer> getTop3SellingParts();

}
