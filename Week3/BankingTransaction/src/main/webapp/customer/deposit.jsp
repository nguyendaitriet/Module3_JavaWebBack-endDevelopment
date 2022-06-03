<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Deposit</title>
    <%@ include file="/layout/head.jsp"%>
</head>
<body>
<div class="container">
    <div class="table-title">
        <div class="row">
            <div class="col-sm-5">
                <h1>Deposit</h1>
            </div>
            <div class="col-sm-7">
                <a href="./" class="btn btn-outline-light">
                    <i class="fa-solid fa-bars"></i>
                    <span>List of customers</span>
                </a>
            </div>
        </div>
    </div>
    <div>
        <form method="post" autocomplete="off">
            <div class="row mt-3">
                <div class="col-md-6 mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="name" readonly
                           value="${currentCustomer.getFullName()}"
                    >
                </div>
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" readonly
                           value="${currentCustomer.getEmail()}"
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="balance" class="form-label">Balance</label>
                    <input type="number" class="form-control" id="balance" name="balance" readonly
                           value="${currentCustomer.getBalance()}"
                    >
                </div>
                <div class="col-md-6 mb-3">
                    <label for="amount" class="form-label">Transaction Amount (VND)</label>
                    <input type="number" class="form-control" id="amount" name="amount" value="0">
                </div>
            </div>
            <button type="submit" class="btn btn-outline-secondary">
                <i class="fas fa-plus-circle"></i>
                Deposit
            </button>
        </form>
    </div>
</div>
<c:choose>
    <c:when test="${deposited}">
        <div class="fixed-bottom alert alert-success alert-dismissible pa-bottom">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>${message}</strong>
        </div>
    </c:when>
    <c:when test="${deposited == false}">
        <div class="fixed-bottom alert alert-danger alert-dismissible pa-bottom">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>${message}</strong>
        </div>
    </c:when>
</c:choose>
<%@ include file="/layout/script.jsp"%>
</body>
</html>