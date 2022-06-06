<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Drug</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../resources/css/style.css"/>
</head>
<body>
    <div class="container">
        <div class="row header">
            <div class="col-sm-5">
                <h1>
                    Add New Drug
                </h1>
            </div>
            <div class="col-sm-7">
                <a href="/drugs" class="btn btn-outline-warning">
                    <i class="fas fa-plus-square"></i>
                    <span>Drugs List</span>
                </a>
            </div>
        </div>
        <form method="post" autocomplete="off">
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="drugName">Drug Name</label>
                <input type="text" class="form-control" id="drugName" name="drugName" required>
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="drugContent">Drug Content (mg)</label>
                <input type="number" class="form-control" id="drugContent" name="drugContent" required>
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="quantity">Quantity (pill)</label>
                <input type="number" class="form-control" id="quantity" value="0" name="quantity" required>
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="dosageForm">Usage Form</label>
                <select class="form-select" id="dosageForm" name="dosageForm">
                    <option value="tablet" selected>Tablet</option>
                    <option value="capsule">Capsule</option>
                </select>
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="usage">Usage</label>
                <input type="text" class="form-control" id="usage" name="usage">
                <div class="form-text">Example: headache.</div>
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="dosagePerDay">Dosage per day</label>
                <input type="text" class="form-control" id="dosagePerDay" name="dosagePerDay">
                <div class="form-text">Example: 1 Morning, 1 Night.</div>
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="5DaysDosage">Total dosage in 5 days</label>
                <input type="number" class="form-control" id="5DaysDosage" name="5DaysDosage">
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="price">Price per pill (VND)</label>
                <input type="number" class="form-control" id="price" name="price">
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="productionDate">Production Date</label>
                <input type="date" class="form-control" id="productionDate" name="productionDate">
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="expirationDate">Expiration Date</label>
                <input type="date" class="form-control" id="expirationDate" name="expirationDate">
            </div>
            <div class="mb-3 float-left par col-lg-4 col-sm-12 col-md-6">
                <label for="note">Note</label>
                <input type="text" class="form-control"  id="note" name="note">
                <div class="form-text">Example: Supplements.</div>
            </div>
            <div class="clr">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <c:if test='${requestScope["message"] != null}'>
                <div class="alert alert-success clr">
                    <strong>Add new drug successfully!</strong>
                </div>
            </c:if>
        </form>
    </div>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
