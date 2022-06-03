package com.triet.service;

import com.triet.model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService extends IGeneralService<Customer> {
    @Override
    List<Customer> findAll();

    @Override
    Customer findById(long id) throws SQLException;

    @Override
    boolean save(Customer customer) throws SQLException;

    @Override
    boolean update(Customer customer) throws SQLException;

    @Override
    boolean remove(long id) throws SQLException;
}

