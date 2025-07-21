package service.user;

import dao.user.UserDAO;
import model.RegisteredUserModel;
import service.user.UserService;
import util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {

	private final UserDAO userDAO = new UserDAO();

    @Override
    public boolean register(RegisteredUserModel user) {
        return userDAO.registerUser(user);
    }

    @Override
    public List<RegisteredUserModel> login(String username, String password) {
        List<RegisteredUserModel> list = new ArrayList<>();
        RegisteredUserModel user = userDAO.validateLogin(username, password);
        if (user != null) {
            list.add(user);
        }
        return list;
    }

    @Override
    public boolean emailExists(String email) {
        return userDAO.emailExists(email);
    }

    @Override
    public boolean resetPassword(String email, String newPassword) {
        return userDAO.resetPassword(email, newPassword);
    }

    @Override
    public boolean updateProfile(RegisteredUserModel user) {
        return userDAO.updateProfile(user);
    }

    @Override
    public boolean deleteAccount(int id) {
        return userDAO.deleteUser(id);
    }
}
