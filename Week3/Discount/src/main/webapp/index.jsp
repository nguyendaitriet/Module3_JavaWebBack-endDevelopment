<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<h2>Vietnamese Dictionary</h2>
<form method="post" action="${pageContext.request.contextPath}/discount-amount">
    <label>Product Description</label>
    <input type="text" name="txtSearch"/>
    <label>List Price</label>
    <input type="number" name="price"/>
    <label>Discount Percent</label>
    <input type="number" name="discount"/>
    <input type = "submit" id = "submit" value = "Submit"/>
</form>
</body>
</html>