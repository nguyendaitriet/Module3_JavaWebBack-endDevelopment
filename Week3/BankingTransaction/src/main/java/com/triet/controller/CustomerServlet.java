package com.triet.controller;

import com.triet.model.Customer;
import com.triet.service.CustomerService;
import com.triet.service.ICustomerService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService;

    @Override
    public void init() throws ServletException {
        customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    showAddCustomerForm(request, response);
                    break;
                case "edit":
                    showEditCustomerForm(request, response);
                    break;
                case "remove":
                    showRemoveCustomer(request, response);
                    break;
                default:
                    listCustomer(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    insertCustomer(request, response);
                    break;
                case "edit":
                    updateCustomer(request, response);
                    break;
                case "remove":
                    removeCustomer(request,response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = customerService.findAll();
        request.setAttribute("customersList", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer newCustomer = new Customer(name, email, phone, address);
        boolean customerSaved = customerService.save(newCustomer);
        request.setAttribute("saveCustomer",customerSaved);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/add.jsp");
        dispatcher.forward(request, response);
    }

    private void showAddCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/add.jsp");
        dispatcher.forward(request, response);
    }

    private void showRemoveCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        Customer currentCustomer = customerService.findById(id);
        request.setAttribute("currentCustomer",currentCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/remove.jsp");
        dispatcher.forward(request, response);
    }

    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        boolean customerRemoved = customerService.remove(id);
        request.setAttribute("customerRemoved",customerRemoved);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/remove.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditCustomerForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        Customer currentCustomer = customerService.findById(id);
        request.setAttribute("currentCustomer",currentCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Customer currentCustomer = new Customer(id, name, email, phone, address);
        boolean customerUpdated = customerService.update(currentCustomer);

        request.setAttribute("currentCustomer", currentCustomer);
        request.setAttribute("customerUpdated",customerUpdated);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        dispatcher.forward(request, response);
    }
}

