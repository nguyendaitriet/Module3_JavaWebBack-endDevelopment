package com.triet.pharmacyonline.controllers;

import com.triet.pharmacyonline.models.Drug;
import com.triet.pharmacyonline.sevices.IMedicineService;
import com.triet.pharmacyonline.sevices.MedicineService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DrugServlet", value = "/drugs")
public class DrugServlet extends HttpServlet {
    IMedicineService medicineService = new MedicineService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "update":

                break;
            case "delete":

                break;
            case "view":

                break;
            default:
                listUsers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewDrug(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                break;
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("drug/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) {
        List<Drug> drugs = medicineService.getDrugs();
        request.setAttribute("drugs", drugs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("drug/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void addNewDrug(HttpServletRequest request, HttpServletResponse response) {
        String drugName = request.getParameter("drugName");
        double drugContent = Double.parseDouble(request.getParameter("drugContent"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double pricePerPill = Double.parseDouble(request.getParameter("price"));
        String dosageForm = request.getParameter("dosageForm");
        String usage = request.getParameter("usage");
        String dosagePerDay = request.getParameter("dosagePerDay");
        int dosage5Days = Integer.parseInt(request.getParameter("5DaysDosage"));
        String productionDate = request.getParameter("productionDate");
        String expirationDate = request.getParameter("expirationDate");
        String note = request.getParameter("note");
        long id = generateId();

        Drug newDrug = new Drug(id, drugName, drugContent, quantity, dosageForm, usage, dosagePerDay, dosage5Days, pricePerPill, productionDate, expirationDate, note);
        medicineService.add(newDrug);

        RequestDispatcher dispatcher = request.getRequestDispatcher("drug/add.jsp");
        request.setAttribute("message", "123");
        try {
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public long generateId() {
        int min = 100000;
        int max = 999999;
        long id;
        do {
            id = (long) Math.floor(Math.random() * (max - min + 1) + min);
        } while (medicineService.isIdExisted(id));
        return id;
    }
}


