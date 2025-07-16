package service.admin;

import dao.admin.AdminDAO;
import model.AdminModel;

public class AdminServiceImpl {
    private AdminDAO dao = new AdminDAO();

    public AdminModel login(String username, String password) {
        return dao.validateLogin(username, password);
    }

public AdminModel getAdminByEmail(String email) {
    return new AdminDAO().getAdminByEmail(email);
}

public boolean updatePasswordByEmail(String email, String newPassword) {
    return new AdminDAO().updateAdminPassword(email, newPassword);
}

public boolean validateCurrentPassword(String email, String currentPassword) {
    return dao.checkAdminPassword(email, currentPassword);
}

public boolean updatePassword(String email, String newPassword) {
    return dao.updateAdminPassword(email, newPassword);
}

public boolean updateProfile(AdminModel admin) {
    return dao.updateAdminProfile(admin);
}

public boolean validateCurrentPasswordById(int id, String password) {
    return dao.checkAdminPasswordById(id, password);
}

}


