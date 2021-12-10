<%-- 
    Document   : login
    Created on : Dec 7, 2021, 11:45:21 PM
    Author     : ductm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%String alert = (String) request.getAttribute("alert");%>
    </head>
    <body>
        <form action="login" method="POST">
            <table>
                <%if (alert != null) {%>
                <%=alert%>
                <%}%>
                <tr>
                    <td>Username</td><td><input type="text" name="username" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td><td><input type="password" name="password" value="" /></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="Log In" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
