<%if(session.getAttribute("name")==null){
response.sendRedirect("errorpage.jsp");}%>
<%@page import="exam.model.QuizDao"%>
<%@page import="exam.db.Pojo_class"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:useBean id="e" class="exam.db.Pojo_class"></jsp:useBean>
    <jsp:setProperty property="*" name="e"/>
    
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
		
		int status = QuizDao.update(e);
		if(status > 0)
			response.sendRedirect("ques.jsp?sub="+request.getParameter("sub")+"");
		
	%>
</body>
</html>