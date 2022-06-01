<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="userDTO" items="${listUserDTO}">
<%--            <c:forEach var="country" items="${listCountry}">--%>
<%--                <c:if test="${user.getCountry() == country.getId()}">--%>
<%--                <tr>--%>
<%--                    <td>${user.id}</td>--%>
<%--                    <td>${user.name}</td>--%>
<%--                    <td>${user.email}</td>--%>
<%--                    <td>${country.getName()}</td>--%>
<%--                    <td>--%>
<%--                        <a href="/users?action=edit&id=${user.id}">Edit</a>--%>
<%--                        <a href="/users?action=delete&id=${user.id}">Delete</a>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
            <tr>
                <td>${userDTO.getId()}</td>
                <td>${userDTO.getName()}</td>
                <td>${userDTO.getEmail()}</td>
                <td>${userDTO.getCountryName()}</td>
                <td>
                    <a href="/users?action=edit&id=${userDTO.id}">Edit</a>
                    <a href="/users?action=delete&id=${userDTO.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>