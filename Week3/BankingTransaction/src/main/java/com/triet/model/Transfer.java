package com.triet.model;

import java.math.BigDecimal;
import java.util.Date;

public class Transfer {
    private long id;
    private long customerId;
    private BigDecimal transactionAmount;
    private Date createdAt;
    private long createdBy;
    private Date updatedAt;
    private long updatedBy;
    private boolean deleted;
}
