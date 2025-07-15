package service.supplier;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import dao.supplier.SparePartReportDAO;

public class SupplierCompanyOrderService {

    private static final SparePartReportDAO dao = new SparePartReportDAO();

    public static int getLowStockCount(int supplierid) {
        return dao.getLowStockCount(supplierid);
    }

    public static int getSparePartsCount(int supplierid) {
        return dao.getSparepartCount(supplierid);
    }

    public static int getNewOrdersCount(int supplierid) {
       
    	 return dao.getNewOrdersCount(supplierid);
    }

    public static BigDecimal getAdditionalIncome(int supplierid) {
        return dao.getAdditionalIncome(supplierid);
    }

    public static String getFormattedIncome(int supplierid) {
        BigDecimal income = getAdditionalIncome(supplierid);
        return (income != null) ? String.format("%,.2f", income) : "0.00";
    }

    public static List<Map<String, String>> getRecentOrders(int supplierid) {
        return dao.getRecentOrders(supplierid);
    }
} 

	  
	 


