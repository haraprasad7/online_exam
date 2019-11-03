<%@page import="exam.model.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		overflow: auto;
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int status=QuizDao.deleteques(request.getParameter("qno"),request.getParameter("sub"));
if(status>0)
{
	response.sendRedirect("ques_prac.jsp?sub="+request.getParameter("sub")+"");
}
else
{
	%>
	<h1>cannot delete retry latter</h1>
	<% 
/* 	response.sendRedirect("ques.jsp?sub="+request.getParameter("sub")+""); */
}
%>
</body>
</html>