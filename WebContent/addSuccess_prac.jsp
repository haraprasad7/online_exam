<%@page import="exam.model.QuizDao"%>
<%@page import="exam.db.Pojo_class"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pc" class="exam.db.Pojo_class"></jsp:useBean>
<jsp:setProperty property="*" name="pc"/>

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
	int status =QuizDao.addNewQuestion(pc);
	if(status>0)
	{
%>
	<jsp:include page="administrator_prac.html"></jsp:include>
	
	<script type="text/javascript">
		alert("QUESTION ADDED SUCCESSFULLY");
	</script>
	<!-- <font color="green" size="20">QUESTION ADDED SUCCESSDULLY...</font> -->
<%
	}
	else
	{
%>
	<font color="red" size="20">QUESTION COULD NOT BE ADDED....</font>
	<%
	}
	%>

</body>
</html>