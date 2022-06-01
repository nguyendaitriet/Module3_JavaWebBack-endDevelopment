package com.codegym.services;

import com.codegym.dto.UserDTO;
import com.codegym.models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    List<UserDTO> selectAllUsersDTO();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;
}

