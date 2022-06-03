<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Suspend</title>
    <%@ include file="/layout/head.jsp"%>
</head>
<body>
    <div class="container">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h1>Suspend customer</h1>
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
            <form method="post">
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
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" readonly
                            value="${currentCustomer.getPhone()}"
                        >
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address" readonly
                            value="${currentCustomer.getAddress()}"
                        >
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-danger">
                    <i class="fas fa-trash-alt"></i>
                    Suspend
                </button>
            </form>
        </div>
    </div>
    <c:choose>
        <c:when test="${customerRemoved}">
            <div class="fixed-bottom alert alert-success alert-dismissible">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Remove customer successfully!</strong>
            </div>
        </c:when>
        <c:when test="${customerRemoved == false}">
            <div class="fixed-bottom alert alert-danger alert-dismissible">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Failed to remove customer!</strong>
            </div>
        </c:when>
    </c:choose>
    <%@ include file="/layout/script.jsp"%>
</body>
</html>