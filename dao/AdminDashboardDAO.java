package dao.admin;

import java.util.Map;

public interface AdminDashboardDAO {
    int fetchTotalSpareParts();
    int fetchNewOrdersCount();
    int fetchPendingDeliveriesCount();
    int fetchRegisteredUsersCount();
    int fetchTotalSuppliersCount();
    Map<String, Integer> getRecentMonthlyOrderCounts();
    Map<String, Double> fetchMonthlyRevenue();
    Map<String, Integer> fetchTop3SellingParts();

}
