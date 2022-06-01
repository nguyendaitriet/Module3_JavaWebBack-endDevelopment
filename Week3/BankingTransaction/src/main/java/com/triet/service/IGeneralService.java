package com.triet.service;

import java.util.List;

public interface IGeneralService<T> {
    List<T> findAll();

    T findById(long id);

    void save(T t);

    void update(long id, T t);

    boolean remove(long id);
}
