<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>List of customers</title>
    <%@ include file="/layout/head.jsp"%>
</head>

<body>
    <div class="container">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h1>List of customers</h1>
                </div>
                <div class="col-sm-7">
                    <a href="/customers?action=add" class="btn btn-outline-light">
                        <i class="fa-solid fa-plus"></i>
                        <span>Add New Customer</span>
                    </a>
                    <a href="/transfers" class="btn btn-outline-light">
                        <i class="fa fa-history" aria-hidden="true"></i>
                        <span>Transfer money Information</span>
                    </a>
                </div>
            </div>
        </div>

        <div>
            <table class="table table-hover table-borderless">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>phone</th>
                    <th>Address</th>
                    <th>Balance</th>
                    <th colspan="5" class="text-center">Action</th>
                </tr>
                </thead>
                <tbody id="tbCustomer">
                    <c:forEach var="customer" items="${customersList}">
                        <tr>
                            <td>${customer.getId()}</td>
                            <td>${customer.getFullName()}</td>
                            <td>${customer.getEmail()}</td>
                            <td>${customer.getPhone()}</td>
                            <td>${customer.getAddress()}</td>
                            <td>${customer.getBalance()}</td>
                            <td>
                                <a title="Edit" href="/customers?action=edit&id=${customer.getId()}" class="btn btn-outline-primary">
                                    <i class="fas fa-user-edit"></i>
                                </a>
                                <a title="Deposit" href="/deposit?id=${customer.getId()}" class="btn btn-outline-secondary">
                                    <i class="fas fa-plus-circle"></i>
                                </a>
                                <a title="Withdraw" href="/withdraw?id=${customer.getId()}" class="btn btn-outline-success">
                                    <i class="fas fa-minus-circle"></i>
                                </a>
                                <a title="Transfer" href="./services/transfer.html" class="btn btn-outline-warning">
                                    <i class="fas fa-people-arrows"></i>
                                </a>
                                <a title="Remove" href="/customers?action=remove&id=${customer.getId()}" class="btn btn-outline-danger">
                                    <i class="fas fa-ban"></i>                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="/layout/script.jsp"%>
</body>

</html>
