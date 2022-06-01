package com.codegym.services;

import com.codegym.models.Country;

import java.util.List;

public interface ICountryService {
    List<Country> selectAllCountries();

}
