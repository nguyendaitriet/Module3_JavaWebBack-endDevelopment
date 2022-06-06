<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <title>User List</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    </head>
    <body>
        <div class="container">
        <div class="row header">
                <div class="col-sm-5">
                    <h1>
                        Users List
                    </h1>
                </div>
                <div class="col-sm-7">
                    <a href="/users?action=add" class="btn btn-outline-warning">
                        <i class="fa-solid fa-user-plus"></i>
                        <span>Add New User</span>
                    </a>
                </div>
            </div>

            <div class="row">
                <table class="table table-hover" id="tbCustomers">
                    <thead class="thead-green">
                    <tr>
                        <th>#</th>
                        <th>Full Name</th>
                        <th>Email Address</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Operation</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0"></c:set>
                        <c:forEach items='${requestScope["users"]}' var="user">
                            <tr>
                                <td>${i=i+1}</td>
                                <td>${user.getFullName()}</td>
                                <td>${user.getEmail()}</td>
                                <td>${user.getPhoneNumber()}</td>
                                <td>${user.getAddress()}</td>
                                <td>
                                    <a title="Edit" href="/users?action=update&id=${user.getId()}" data-toggle="tooltip" class="btn btn-outline-primary">
                                        <i class="fas fa-user-edit"></i>
                                    </a>
                                    <a title="Remove" href="/users?action=remove&id=${user.getId()}" data-toggle="tooltip" class="btn btn-outline-danger">
                                        <i class="fas fa-user-times"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script defer src="${pageContext.request.contextPath}/resources/fontawesome/js/fontawesome.js"></script>
        <script defer src="${pageContext.request.contextPath}/resources/fontawesome/js/solid.js"></script>
    </body>
</html>
