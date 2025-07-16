package service.admin;

import java.util.List;

import dao.admin.AdminSupplierDAO;
import model.AdminSupplierModel;


public class AdminSupplierServiceImpl implements AdminSupplierService {
	
	private AdminSupplierDAO dao = new AdminSupplierDAO();

    @Override
    public boolean addSupplier(AdminSupplierModel supplier) {
        
        return dao.addSupplier(supplier);
    }
    
    @Override
    public List<AdminSupplierModel> getAllSuppliers() {
    	 
        return dao.getAllSuppliers();
    }
    
    @Override
    public boolean updateSupplier(AdminSupplierModel supplier) {
        return dao.updateSupplier(supplier);
    }
    
    @Override
    public boolean deleteSupplier(int supplierid) {
        return dao.deleteSupplier(supplierid);
    }

	

}
