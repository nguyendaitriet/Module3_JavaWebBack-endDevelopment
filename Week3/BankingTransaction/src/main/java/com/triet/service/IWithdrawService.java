package com.triet.service;

import com.triet.model.Transfer;

import java.math.BigDecimal;
import java.sql.SQLException;

public interface IWithdrawService extends IGeneralService<Transfer> {
    boolean withdraw(BigDecimal amount, long id) throws SQLException;

}
