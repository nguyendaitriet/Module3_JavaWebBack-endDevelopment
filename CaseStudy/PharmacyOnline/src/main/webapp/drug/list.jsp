<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>User List</title>
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    </head>
    <body>
        <div class="container">
            <div class="row header">
                <div class="col-sm-5">
                    <h1>
                        Drugs List
                    </h1>
                </div>
                <div class="col-sm-7">
                    <a href="/drugs?action=add" class="btn btn-outline-warning">
                        <i class="fas fa-plus-square"></i>
                        <span>Add New Drug</span>
                    </a>
                </div>
            </div>
            <div class="row">
                <table class="table table-hover" id="tbCustomers">
                    <thead class="thead-green">
                    <tr>
                        <th>#</th>
                        <th>Drug Name</th>
                        <th>Drug Content (mg)</th>
                        <th>Quantity</th>
                        <th>Price (VND)</th>
                        <th>Expiration Date</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0"></c:set>
                        <c:forEach items='${requestScope["drugs"]}' var="drug">
                            <tr>
                                <td>${i=i+1}</td>
                                <td>${drug.getDrugName()}</td>
                                <td class="text-end pr-30">${drug.getDrugContent()}</td>
                                <td class="text-end pr-30">${drug.getQuantity()}</td>
                                <td class="text-end pr-30">${drug.getPricePerPill()}</td>
                                <td class="text-center">${drug.getExpirationDate()}</td>
                                <td class="text-center">
                                    <a title="Edit" href="/drugs?action=update&id=${drug.getId()}" data-toggle="tooltip" class="btn btn-outline-primary">
                                        <i class="fas fa-pen-square"></i>
                                    </a>
                                    <a title="Remove" href="/drugs?action=remove&id=${drug.getId()}" data-toggle="tooltip" class="btn btn-outline-danger">
                                        <i class="fas fa-minus-square"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script defer src="${pageContext.request.contextPath}/resources/fontawesome/js/fontawesome.js"></script>
        <script defer src="${pageContext.request.contextPath}/resources/fontawesome/js/solid.js"></script>
    </body>
</html>
