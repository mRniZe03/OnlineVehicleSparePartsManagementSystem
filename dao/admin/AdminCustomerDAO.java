package dao.admin;

import model.AdminCustomerModel;
import java.util.List;

public interface AdminCustomerDAO {
    List<AdminCustomerModel> getAllCustomers();
}

