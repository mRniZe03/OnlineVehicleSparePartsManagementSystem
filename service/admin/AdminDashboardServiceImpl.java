package service.admin;

import java.util.Map;

import dao.admin.AdminDashboardDAO;
import dao.admin.AdminDashboardDAOImpl;

public class AdminDashboardServiceImpl implements AdminDashboardService {

    private AdminDashboardDAO dashboardDAO = new AdminDashboardDAOImpl();

    public int getTotalSpareParts() {
        return dashboardDAO.fetchTotalSpareParts();
    }

    public int getNewOrdersCount() {
        return dashboardDAO.fetchNewOrdersCount();
    }

    public int getPendingDeliveries() {
        return dashboardDAO.fetchPendingDeliveriesCount();
    }

    public int getRegisteredUserCount() {
        return dashboardDAO.fetchRegisteredUsersCount();
    }

    public int getTotalSuppliers() {
        return dashboardDAO.fetchTotalSuppliersCount();
    }
    

    @Override
    public Map<String, Integer> fetchRecentMonthlyOrderStats() {
        return dashboardDAO.getRecentMonthlyOrderCounts();
    }
    
    public Map<String, Double> getMonthlyRevenue() {
        return dashboardDAO.fetchMonthlyRevenue();
    }
    public Map<String, Integer> getTop3SellingParts() {
        return dashboardDAO.fetchTop3SellingParts();
    }

}
