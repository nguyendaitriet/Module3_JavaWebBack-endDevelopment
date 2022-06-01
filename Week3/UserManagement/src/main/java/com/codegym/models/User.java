package com.codegym.models;

public class User {
    protected int id;
    protected String name;
    protected String email;
    protected int country;

    public User() {}

    public User(String name, String email, int country) {
        super();
        this.name = name;
        this.email = email;
        this.country = country;
    }

    public User(int id, String name, String email, int country) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.country = country;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public int getCountry() {
        return country;
    }
    public void setCountry(int country) {
        this.country = country;
    }
}