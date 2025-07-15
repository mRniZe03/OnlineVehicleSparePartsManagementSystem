package service.supplier;

import model.SupplierSparePartReportModel;
import dao.supplier.SupplierReportDAO;

public class SupplierReportService {


	    public static SupplierSparePartReportModel getReportDetailsByRequestId(String request_id) {
	        return SupplierReportDAO.getReportDetailsByRequestId(request_id);
	    }
}



