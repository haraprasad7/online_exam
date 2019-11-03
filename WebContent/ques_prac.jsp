<%if(session.getAttribute("name")==null){
response.sendRedirect("errorpage.jsp");}%>
<%@page import="exam.db.Pojo_class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.model.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="exam.db.Provider,java.sql.*" %>
<jsp:useBean id="pc" class="exam.db.Pojo_class"></jsp:useBean>
<jsp:setProperty property="*" name="pc"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
  text-align:center;
  padding:10px;
  background-color:rgba(0,0,255,0.1);
  
}
th {
  background-color: #4CAF50;
  color: white;
}

tr:hover {background-color:rgba(255,255,0,0.5);}
#question{
	text-align:left;
}
#tbl{
	
}

	body{
		overflow: auto;
	}
</style>

<%-- <script>
	function change(id)
	{
	console.log(id);
	var uri="ch.jsp?sub="+<%=request.getParameter("sub")%>+"&no="+id;
	console.log(uri);
	window.location=uri;
	}
	
	function del(var id)
	{
		console.log(id);
		var uri="del.jsp?sub="+<%=request.getParameter("sub")%>+"&no="+id;
		console.log(uri);
		window.location=uri;
	}
	
	
	</script> --%>
	
</head>
<body>
<%
	ArrayList<Pojo_class> que = new ArrayList<Pojo_class>();
	que=QuizDao.getAllRecords(request.getParameter("sub"));
	%> 
	<table style="width:100%">
	<jsp:include page="viewques_prac.jsp"></jsp:include>
	<tr>
	<th>SRL NO.</th>
	<th>QUESTION</th>
	<th>OPTION 1</th>
	<th>OPTION 2</th>
	<th>OPTION 3</th>
	<th>OPTION 4</th>
	<th>ANSWER</th>
	<th>CHANGE</th>
	<th>DELETE</th>
	</tr>
	<%
	for(Pojo_class p : que)
	{
		int a=0;
		a++;
%>
	
	<tr>
	<td><%=p.getSlno() %></td>
	<td><%=p.getQus() %></td>
	<td><%=p.getOpt1() %></td>
	<td><%=p.getOpt2() %></td>
	<td><%=p.getOpt3() %></td>
	<td><%=p.getOpt4() %></td>
	<td><%=p.getAns() %></td>
<%-- 	<td><button id="<%=a %>" onclick="change(this.id)">CHANGE</button></td>
	<td><button id="<%=a %>" onclick="del(this.id)">DELETE</button></td> --%>
	<td> <a href="updateques.jsp?qno=<%=p.getSlno()%>&sub=<%=request.getParameter("sub")%>">Modify </a> </td>
	<td> <a href="deleteques.jsp?qno=<%=p.getSlno()%>&sub=<%=request.getParameter("sub")%>">Delete </a> </td>
	</tr>
	
<%
	}
	%>
	</table>
	

</body>
</html>