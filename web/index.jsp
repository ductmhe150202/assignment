<%-- 
    Document   : index
    Created on : Dec 8, 2021, 11:14:27 PM
    Author     : ductm
--%>

<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%Account account = (Account) request.getSession().getAttribute("account");%>
    </head>
    <body>
        <h1>Hello <%=account.getName()%>!</h1>
        <a href="logout">Log out</a>
    </body>
</html>
