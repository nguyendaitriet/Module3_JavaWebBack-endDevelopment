<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create</title>
    <%@ include file="/layout/head.jsp"%>
</head>
<body>
    <div class="container">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h1>Create customer</h1>
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
                        <input type="text" class="form-control" id="fullName" name="name">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="number" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>
                </div>

                <button type="submit" class="btn btn-outline-primary">Create</button>
            </form>
        </div>
    </div>
    <%@ include file="/layout/script.jsp"%>
</body>
</html>