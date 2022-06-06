package com.triet.pharmacyonline.sevices;

import com.triet.pharmacyonline.models.Drug;

import java.util.List;

public interface IMedicineService {

    List<Drug> getDrugs();

    Drug getDrugById(long id);

    void add(Drug newDrug);

    void update(Drug newDrug);

    void remove(Drug drug);

    boolean isIdExisted(long id);

    List<Drug> getSearchDrugList(String searchContent, List<Drug> userDrugsList);

}
