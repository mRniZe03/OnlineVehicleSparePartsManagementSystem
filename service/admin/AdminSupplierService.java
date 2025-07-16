package service.admin;

import java.util.List;

import model.AdminSupplierModel;


public interface AdminSupplierService {
    boolean addSupplier(AdminSupplierModel supplier);
    List<AdminSupplierModel> getAllSuppliers();
    boolean updateSupplier(AdminSupplierModel supplier);
    boolean deleteSupplier(int supplierid);


}
