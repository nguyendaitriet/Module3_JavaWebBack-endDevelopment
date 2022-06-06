package com.triet.pharmacyonline.controllers;

import com.triet.pharmacyonline.models.User;
import com.triet.pharmacyonline.sevices.IUserService;
import com.triet.pharmacyonline.sevices.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
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

    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = userService.getUsers();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
