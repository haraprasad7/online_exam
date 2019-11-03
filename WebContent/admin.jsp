<%if(session.getAttribute("name")!=null){ %>
<%@page import="exam.model.QuizDao"%>
<%@page import="exam.db.Pojo_class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.db.Provider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel = "stylesheet"
   				type = "text/css"
   				href = "css/adminstyle.css" />
				
<meta charset="ISO-8859-1">

<script type="text/javascript" src="js/admin.js"></script>
<style type="text/css">
	body{
		overflow: auto;
	}
	
</style>
<title>Administrator</title>
</head>
<body>
<header>

<img src="resources/logo.jpg" alt="logo" height="60px" width="60px">
<marquee><h2>Welcome <%=session.getAttribute("name") %> !!</h2></marquee>
</header>

<div class="row">
  <div class="column">
 	<h4>Final Examination</h4>
	<hr>
  <a href="administrator.jsp"><button class="button"><span>ADD QUESTION</span></button></a>
  <a href="viewques.jsp"><button class="button"><span class="s1">VIEW QUESTION</span></button></a>
  <hr>
  <h4>Practice Examination</h4>
  <hr>
  <a href="administrator_prac.html"><button class="button"><span>ADD QUESTION</span></button></a>
  <a href="viewques_prac.jsp"><button class="button"><span class="s1">VIEW QUESTION</</span></button></a>
  
  <hr>
  
  </div>
  
  <div class="column"> 
  
  <div id="update">
  <h4>Registration desk</h4>
  <hr>
  <div id="updateCol">
  <div id="regStu">Register a candidate</div>
  <input id="usersname" type="text" placeholder="enter user nmae"name="usersname">
  <br>
  <input id="userspassword" type="password" placeholder="Enter Password" name="userspassword">
  <br>
  <button id="users" class="button" onclick="update(this.id)"><span>ADD CANDIDATE</span></button>
  <div id="messageusers"></div>
  </div> 
  
  <div id="updateCol2">
  <div id="regAdmin">Register an Admin</div>
  <input id="adminsname" type="text" placeholder="Enter User Name" name="adminsname">
  <br>
  <input id="adminspassword" type="password" placeholder="Password" name="adminspassword">
  <br>
  <button id="admins" class="button" onclick="update(this.id)"><span>ADD ADMIN</span></button>
  <div id="messageadmins"></div>
  </div>
  </div>
  
  
   <div id="results">
   <h4>Results</h4>
   <hr>
   <ul>
   
  <li><input type="text" id="user" placeholder="Search By Username" onkeyup="viewResultbyUser()"></li>
  <li id="sli"><button class="button" onclick="viewResult()"><span>View Results</span></button></li>
  </ul>
  </div>
  
  <div id="showresults"></div>
 <div id="showresultsRIGHT"></div>
 
 
 
  </div>
</div>
  
 <form action="login.htm">
		<input type="submit" value="Sign Out" width="200px">
	</form>
	
	
	
</body>

</html>
<%}
else
	response.sendRedirect("errorpage.jsp");%>
