package com.triet.model;

import java.math.BigDecimal;
import java.util.Date;

public class Withdraw {
    private long id;
    private long senderId;
    private long recipientId;
    private BigDecimal transactionAmount;
    private BigDecimal transferAmount;
    private BigDecimal fees;
    private BigDecimal feesAmount;
    private Date createdAt;
    private long createdBy;
    private Date updatedAt;
    private long updatedBy;
    private boolean deleted;
}
