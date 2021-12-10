<%-- 
    Document   : index
    Created on : Dec 8, 2021, 11:14:27 PM
    Author     : ductm
--%>

<%@page import="Model.Slot"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Classs"%>
<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Account account = (Account) request.getSession().getAttribute("account");
            ArrayList<Classs> classes = (ArrayList<Classs>) request.getSession().getAttribute("classes");
            ArrayList<Slot> slots = (ArrayList<Slot>) request.getSession().getAttribute("slots");
        %>
    </head>
    <body>
        <form action="index" method="POST">
            <table>
                <tr>
                    <td>Class: </td>
                    <td>
                        <select name="ClassID">
                            <%for (Classs c : classes) {%>
                            <option value="<%=c.getClassID()%>"><%=c.getClassName()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Slot: </td>
                    <td>
                        <select name="SlotID">
                            <%for (Slot s : slots) {%>
                            <option value="<%=s.getSlotID()%>"><%=s.getSlotID()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
            </table>
                <input type="submit" value="Take Attendance" />
        </form>
    </body>
</html>
