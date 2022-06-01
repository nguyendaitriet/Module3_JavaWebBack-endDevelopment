<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<style type="text/css">
    .login {
        height: 180px;
        width: 230px;
        margin: 0;
        padding: 10px;
        border: 1px #CCC solid;
    }

    .login input {
        padding: 5px;
        margin: 5px
    }
</style>
<body>
    <h1>Result</h1>
        <%
            String username = request.getParameter("username");
            Date loginTime = (Date) request.getAttribute("loginTime");
        %>
    <h2>Hello <%=username%></h2>
    <h3>Login Time: <%=loginTime%></h3>
</form>
</body>
</html>