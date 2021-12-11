<%-- 
    Document   : listatt
    Created on : Dec 11, 2021, 10:18:06 PM
    Author     : ductm
--%>

<%@page import="Model.Attendance"%>
<%@page import="Model.Classs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Student"%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>JSP Page</title>
        <%
          ArrayList<Attendance> atts = (ArrayList<Attendance>) request.getAttribute("atts");
          Classs c = (Classs) request.getSession().getAttribute("classs");
          int SlotID = (Integer) request.getSession().getAttribute("SlotID");
        %>
    </head>
    <body>
        <form action="att" method="POST">
            Class: <%=c.getClassName()%> 
            Slot : <%=SlotID%>
        <table border="1px">
            <tr>
                <td>Student ID</td>
                <td>Student Name</td>
                <td>Attendance Date</td>
                <td>Present</td>
            </tr>
            <%for(Attendance att : atts) {%>
            <tr>
                <td><%=att.getStudent().getStudentID()%></td>
                <td><%=att.getStudent().getStudentName()%></td>
                <td><%=att.getAttDate()%></td>
                <td><input type="checkbox" name="present<%=att.getStudent().getStudentID()%>" value="present" <%=att.isPresent()? "checked":""%> /></td>
            </tr>
            <%}%>
        </table>
        <input type="submit" value="Save" />
        </form>
    </body>
</html>