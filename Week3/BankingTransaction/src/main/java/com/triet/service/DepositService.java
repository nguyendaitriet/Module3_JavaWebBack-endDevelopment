package com.triet.service;

import com.triet.model.Deposit;
import com.triet.utils.MySQLConnUtils;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class DepositService implements IDepositService {

    public static String message;

    public boolean deposit(BigDecimal amount, long id) throws SQLException {
        Connection connection = MySQLConnUtils.getSqlConnection();
        CallableStatement statement = connection.prepareCall("{CALL sp_deposit_transaction(?, ?, ?)}");
        statement.setBigDecimal(1, amount);
        statement.setLong(2, id);
        System.out.println(statement);
        boolean deposited = statement.execute();
        message = statement.getString(3);
        return deposited;
    }

    @Override
    public List<Deposit> findAll() {
        return null;
    }

    @Override
    public Deposit findById(long id) throws SQLException {
        return null;
    }

    @Override
    public boolean save(Deposit deposit) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Deposit deposit) {
        return false;
    }

    @Override
    public boolean remove(long id) throws SQLException {
        return false;
    }
}
