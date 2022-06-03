package com.triet.controller;

import com.triet.model.Customer;
import com.triet.service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet(name = "WithdrawServlet", value = "/withdraw")
public class WithdrawServlet extends HttpServlet {
    private ICustomerService customerService;
    private IWithdrawService withdrawService ;

    @Override
    public void init() throws ServletException {
        customerService = new CustomerService();
        withdrawService = new WithdrawService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        try {
            Customer currentCustomer = customerService.findById(id);
            request.setAttribute("currentCustomer", currentCustomer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/withdraw.jsp");
            dispatcher.forward(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        long amount = Long.parseLong(request.getParameter("amount"));
        BigDecimal transactionAmount = BigDecimal.valueOf(amount);
        try {
            boolean withdrew = withdrawService.withdraw(transactionAmount,id);
            request.setAttribute("withdrew",withdrew);

            String message = WithdrawService.message;
            request.setAttribute("message",message);

            Customer currentCustomer = customerService.findById(id);
            request.setAttribute("currentCustomer", currentCustomer);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/withdraw.jsp");
            dispatcher.forward(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
