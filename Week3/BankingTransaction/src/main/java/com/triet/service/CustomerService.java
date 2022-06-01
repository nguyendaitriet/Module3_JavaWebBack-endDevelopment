package com.triet.service;

import com.triet.model.Customer;
import com.triet.utils.MySQLConnUtils;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {

    private static final String SELECT_ALL_CUSTOMERS =
            "SELECT " +
                    "c.id, " +
                    "c.full_name, " +
                    "c.email, " +
                    "c.phone, " +
                    "c.address, " +
                    "c.balance " +
                    "FROM customers AS c " +
                    "WHERE c.deleted = 0;";

    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try {
            Connection connection = MySQLConnUtils.getSqlConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                long id = rs.getLong("id");
                String fullName = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                BigDecimal balance = rs.getBigDecimal("balance");
                customers.add(new Customer(id, fullName, email, phone, address, balance));
            }
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return customers;
    }

    @Override
    public Customer findById(long id) {
        return null;
    }

    @Override
    public void save(Customer customer) {
        try {
        Connection connection = MySQLConnUtils.getSqlConnection();
        CallableStatement statement = connection.prepareCall("{CALL sp_add_new_customer(?, ?, ?, ?);}");
        statement.setString(1,customer.getFullName());
        statement.setString(2,customer.getEmail());
        statement.setString(3,customer.getPhone());
        statement.setString(4,customer.getAddress());
        statement.executeQuery();
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
    }

    @Override
    public void update(long id, Customer customer) {

    }

    @Override
    public boolean remove(long id) {
        return false;
    }
}

