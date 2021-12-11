<%-- 
    Document   : att
    Created on : Dec 11, 2021, 2:38:38 AM
    Author     : ductm
--%>

<%@page import="Model.Classs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
          ArrayList<Student> students = (ArrayList<Student>) request.getSession().getAttribute("students");
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
                <td>Present</td>
            </tr>
            <%for(Student s : students) {%>
            <tr>
                <td><%=s.getStudentID()%><input type="hidden" name="sid" value="<%=s.getStudentID()%>" /></td>
                <td><%=s.getStudentName()%><input type="hidden" name="sname<%=s.getStudentID()%>" value="<%=s.getStudentName()%>" /></td>
                <td><input type="checkbox" name="present<%=s.getStudentID()%>" value="present" /></td>
            </tr>
            <%}%>
        </table>
        <input type="submit" value="Save" />
        </form>
    </body>
</html>
