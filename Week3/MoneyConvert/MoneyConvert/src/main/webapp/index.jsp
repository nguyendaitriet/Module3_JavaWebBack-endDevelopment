<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/convert">
    <div class="container">
        <h2>Currency Converter</h2>
        <div class="col-md-5">
            <label>Rate: </label><br/>
            <input type="text" name="rate" placeholder="RATE" value="22000" class="form-control"/><br/>
            <label>USD: </label><br/>
            <input type="text" name="usd" placeholder="USD" value="0" class="form-control"/><br/>
            <input type = "submit" id = "submit" value = "Converter"/>
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>