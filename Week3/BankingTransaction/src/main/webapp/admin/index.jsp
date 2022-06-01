<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <title>Customers List</title>
    <%@ include file="/layout2/header.jsp" %>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="row">
                <div class="col-sm-5">
                    <h1>
                        Customers List
                    </h1>
                </div>
                <div class="col-sm-7">
                    <a href="/services/addCustomer.html" class="btn btn-outline-warning">
                        <i class="fas fa-user-plus"></i>
                        <span>Add New Customer</span>
                    </a>
                    <a href="/services/transferInfo.html" class="btn btn-outline-warning">
                        <i class="fas fa-file-invoice-dollar"></i>
                        <span>Transfer Information</span>
                    </a>
                </div>
            </div>
        </div>

        <div>
            <table class="table table-hover table-borderless" id="tbCustomers">
                <thead class="thead-green">
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Balance</th>
                    <th colspan="5" class="text-center">Action</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customersList}">
                        <tr>
                            <td>${customer.getId()}</td>
                            <td>${customer.getFullName()}</td>
                            <td>${customer.getEmail()}</td>
                            <td>${customer.getPhone()}</td>
                            <td>${customer.getAddress()}</td>
                            <td>${customer.getBalance()}</td>
                            <td>
                                <a title="Edit" href="./services/updateInfo.html" class="btn btn-outline-primary">
                                    <i class="fas fa-user-edit"></i>
                                </a>
                                <a title="Deposit" href="./services/deposit.html" class="btn btn-outline-secondary">
                                    <i class="fas fa-plus-circle"></i>
                                </a>
                                <a title="Withdraw" href="./services/withdraw.html" class="btn btn-outline-success">
                                    <i class="fas fa-minus-circle"></i>
                                </a>
                                <a title="Transfer" href="./services/transfer.html" class="btn btn-outline-warning">
                                    <i class="fas fa-people-arrows"></i>
                                </a>
                                <a title="Remove" href="./services/remove.html" class="btn btn-outline-danger">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="/layout2/script.jsp" %>
</body>

</html>