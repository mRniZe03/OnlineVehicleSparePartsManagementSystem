package service.user;

import model.RegisteredUserModel;
import java.util.List;

public interface UserService {

	boolean register(RegisteredUserModel user);
    List<RegisteredUserModel> login(String username, String password);
    boolean emailExists(String email);
    boolean resetPassword(String email, String newPassword);
    boolean updateProfile(RegisteredUserModel user);
    boolean deleteAccount(int id);
}
