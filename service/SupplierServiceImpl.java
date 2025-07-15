package service.supplier;
import dao.supplier.SupplierDAO;



import model.SupplierModel;

public class SupplierServiceImpl {
	 private SupplierDAO dao = new SupplierDAO();

	    public SupplierModel login(String supplierusername, String supplierpassword) {
	        return dao.validateLogin(supplierusername, supplierpassword);
	    }

	public SupplierModel getSupplierByEmail(String supplieremail) {
	    return new SupplierDAO().getSupplierByEmail(supplieremail);
	}

	public boolean updatePasswordByEmail(String supplieremail, String newPassword) {
	    return new SupplierDAO().updateSupplierPassword(supplieremail, newPassword);
	}

	public boolean validateCurrentPassword(String supplieremail, String currentPassword) {
	    return dao.checkSupplierPassword(supplieremail, currentPassword);
	}

	public boolean updatePassword(String supplieremail, String newPassword) {
	    return dao.updateSupplierPassword(supplieremail, newPassword);
	}
	public boolean deleteAccount(int id) {
	        return dao.deleteUser(id);
	    }

}
