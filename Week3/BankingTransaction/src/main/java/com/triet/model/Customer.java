package com.triet.model;

import java.math.BigDecimal;
import java.util.Date;

public class Customer {
    private long id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private BigDecimal balance;

    private Date createdAt;
    private long createdBy;
    private Date updatedAt;
    private long updatedBy;
    private boolean deleted;

    public Customer() {
    }

    public Customer(long id, String fullName, String email, String phone, String address, BigDecimal balance, Date createdAt, long createdBy, Date upadatedAt, long updatedBy, boolean deleted) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.balance = balance;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.updatedAt = upadatedAt;
        this.updatedBy = updatedBy;
        this.deleted = deleted;
    }

    public Customer(long id, String name, String email, String phone, String address, BigDecimal balance) {
        this.id = id;
        this.fullName = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.balance = balance;
    }

    public Customer(String name, String email, String phone, String address) {
        this.fullName = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public Customer(long id, String name, String email, String phone, String address) {
        this.id = id;
        this.fullName = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public long getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(long updatedBy) {
        this.updatedBy = updatedBy;
    }

    public boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", balance=" + balance +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                ", deleted=" + deleted +
                '}';
    }
}
