<%-- 
    Document   : index
    Created on : Dec 8, 2021, 11:14:27 PM
    Author     : ductm
--%>
        <%
            Account account = (Account) request.getSession().getAttribute("account");
            ArrayList<Classs> classes = (ArrayList<Classs>) request.getSession().getAttribute("classes");
            ArrayList<Slot> slots = (ArrayList<Slot>) request.getSession().getAttribute("slots");
            String alert = (String) request.getAttribute("alert");
        %>
<%@page import="Model.Slot"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Classs"%>
<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>-->
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
</html>-->
                            
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<head>
<title>Visitors an Admin Panel Category Bootstrap Responsive Website Template | Responsive_table :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

    <a href="index" class="logo">
        Ei
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->


<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="images/2.png">
                <span class="username"><%=account.getName()%></span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                <li><a href="logout"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
       
    </ul>
    <!--search & user info end-->
</div>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
         sidebar menu start
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a href="index">
                        <i class="fa fa-dashboard"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a href="search">
                        <i class="fa fa-bullhorn"></i>
                        <span>Search</span>
                    </a>
                </li>
                
            </ul>            </div>
         sidebar menu end
    </div>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="table-agile-info">
 <div class="panel panel-default">
    <div class="panel-heading">
     Attendance
    </div>
     
    <div>
        <form action="index" method="POST">
      <table class="table" ui-jq="footable" ui-options='{
        "paging": {
          "enabled": true
        },
        "filtering": {
          "enabled": true
        },
        "sorting": {
          "enabled": true
        }}'>
        <thead>
          <tr>
            <th>Class</th>
            <th>
            <select name="ClassID">
                            <option>-----Choose-----</option>
                            <%for (Classs c : classes) {%>
                            <option value="<%=c.getClassID()%>"><%=c.getClassName()%></option>
                            <%}%>
                        </select>
            </th>
            <th>Slot</th>
            <th><select name="SlotID">
                            <option>-----Choose-----</option>
                            <%for (Slot s : slots) {%>
                            <option value="<%=s.getSlotID()%>"><%=s.getSlotID()%></option>
                            <%}%>
                        </select></th>
          </tr>
        </thead>
      </table>
        <%if (alert != null) {%>
        <p style="color: red; margin: 10px"><%=alert%></p><%}%>
        <input class="button" type="submit" value="Take Attendance" />      
        </form>
    </div>
  </div>
</div>
</section>
 <!-- footer -->
		  <div class="footer">
			<div class="wthree-copyright">
			  <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
			</div>
		  </div>
  <!-- / footer -->
</section>

<!--main content end-->
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>
</body>
</html>

