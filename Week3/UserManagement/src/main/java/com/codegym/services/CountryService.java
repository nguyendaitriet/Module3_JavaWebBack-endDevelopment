package com.codegym.services;

import com.codegym.models.Country;
import utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryService implements ICountryService{

    private static final String SELECT_ALL_COUNTRIES = "SELECT * FROM countries";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = MySQLConnection.connectToMySQL();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Country> selectAllCountries() {
        List<Country> countries = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COUNTRIES);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                countries.add(new Country(id, name));
            }
        } catch (SQLException e) {
            MySQLConnection.printSQLException(e);
        }
        return countries;
    }
}
