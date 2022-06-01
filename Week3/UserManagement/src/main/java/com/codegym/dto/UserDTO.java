package com.codegym.dto;

public class UserDTO {
    protected int id;
    protected String name;
    protected String email;
    protected String countryName;

    public UserDTO() {
    }

    public UserDTO(int id, String name, String email, String countryName) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.countryName = countryName;
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

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
