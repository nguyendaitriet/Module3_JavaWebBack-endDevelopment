package com.triet.service;

import com.triet.model.Transfer;
import com.triet.utils.MySQLConnUtils;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class WithdrawService implements IWithdrawService{

    public static String message;

    @Override
    public boolean withdraw(BigDecimal amount, long id) throws SQLException {
        Connection connection = MySQLConnUtils.getSqlConnection();
        CallableStatement statement = connection.prepareCall("{CALL sp_withdraw_transaction(?, ?, ?)}");
        statement.setBigDecimal(1, amount);
        statement.setLong(2, id);
        boolean withdrew = statement.executeUpdate() > 0;
        message = statement.getString(3);
        return withdrew;
    }

    @Override
    public List<Transfer> findAll() {
        return null;
    }

    @Override
    public Transfer findById(long id) throws SQLException {
        return null;
    }

    @Override
    public boolean save(Transfer transfer) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Transfer transfer) {
        return false;
    }

    @Override
    public boolean remove(long id) throws SQLException {
        return false;
    }


}
