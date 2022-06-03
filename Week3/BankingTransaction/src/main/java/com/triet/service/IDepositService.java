package com.triet.service;

import com.triet.model.Deposit;
import java.math.BigDecimal;
import java.sql.SQLException;

public interface IDepositService extends IGeneralService<Deposit> {
    boolean deposit(BigDecimal amount, long id) throws SQLException;

}
