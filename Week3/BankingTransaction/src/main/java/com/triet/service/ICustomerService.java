package com.triet.service;

import com.triet.model.Customer;

import java.util.List;

public interface ICustomerService extends IGeneralService<Customer> {
    @Override
    List<Customer> findAll();

    @Override
    Customer findById(long id);

    @Override
    void save(Customer customer);

    @Override
    void update(long id, Customer customer);

    @Override
    boolean remove(long id);
}

