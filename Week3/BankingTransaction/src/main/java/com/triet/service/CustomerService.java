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
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                customers.add(getCustomer(rs));
            }
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return customers;
    }

    public Customer getCustomer(ResultSet rs) throws SQLException {
        long id = rs.getLong("id");
        String fullName = rs.getString("full_name");
        String email = rs.getString("email");
        String phone = rs.getString("phone");
        String address = rs.getString("address");
        BigDecimal balance = rs.getBigDecimal("balance");
        return new Customer(id, fullName, email, phone, address, balance);
    }

    @Override
    public Customer findById(long id) throws SQLException {
        Customer currentCustomer = null;
        Connection connection = MySQLConnUtils.getSqlConnection();
        CallableStatement statement = connection.prepareCall("{CALL sp_get_customer_by_id(?)}");
        statement.setLong(1, id);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            currentCustomer = getCustomer(rs);
        }
        return currentCustomer;
    }

    @Override
    public boolean save(Customer customer) throws SQLException {
            Connection connection = MySQLConnUtils.getSqlConnection();
            CallableStatement statement = connection.prepareCall("{CALL sp_add_new_customer(?, ?, ?, ?)}");
            statement.setString(1, customer.getFullName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getPhone());
            statement.setString(4, customer.getAddress());
            return statement.executeUpdate() > 0;
    }

    @Override
    public boolean update(Customer customer) throws SQLException {
        Connection connection = MySQLConnUtils.getSqlConnection();
        CallableStatement statement = connection.prepareCall("{CALL sp_update_customer(?, ?, ?, ?, ?)}");
        statement.setLong(1, customer.getId());
        statement.setString(2, customer.getFullName());
        statement.setString(3, customer.getEmail());
        statement.setString(4, customer.getPhone());
        statement.setString(5, customer.getAddress());
        return statement.executeUpdate() > 0;
    }

    @Override
    public boolean remove(long id) throws SQLException {
        Connection connection = MySQLConnUtils.getSqlConnection();
        CallableStatement statement = connection.prepareCall("{CALL sp_remove_customer(?)}");
        statement.setLong(1, id);
        return statement.executeUpdate() > 0;
    }
}

