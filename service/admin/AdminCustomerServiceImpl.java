package service.admin;

import dao.admin.AdminCustomerDAO;
import dao.admin.AdminCustomerDAOImpl;
import model.AdminCustomerModel;
import java.util.List;

public class AdminCustomerServiceImpl implements AdminCustomerService {

    private AdminCustomerDAO dao = new AdminCustomerDAOImpl();

    @Override
    public List<AdminCustomerModel> getAllCustomers() {
        return dao.getAllCustomers();
    }
}
