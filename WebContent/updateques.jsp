<%if(session.getAttribute("name")==null){
response.sendRedirect("errorpage.jsp");}%>
<%@page import="exam.model.QuizDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.db.Pojo_class"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pc" class="exam.db.Pojo_class"></jsp:useBean>
<jsp:setProperty property="*" name="pc"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

	body{
		overflow: auto;
	}

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
</style>

</head>
<body>
	<table>
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
		ArrayList<Pojo_class> que = new ArrayList<Pojo_class>();
		que=QuizDao.getAllRecords(request.getParameter("sub"));
		for(Pojo_class p : que)
		{
			if(Integer.parseInt(request.getParameter("qno")) == p.getSlno()) 
			{
	%>
				<tr>
					<form action="update.jsp">
					<td> <input type="text" value=<%=p.getSlno() %> readonly="readonly" name="slno"></input> </td>
					<td> <input type="text" value=<%=p.getQus() %> name="qus" ></input>  </td>
					<td> <input type="text" value=<%=p.getOpt1() %> name="opt1" ></input>  </td>
					<td> <input type="text" value=<%=p.getOpt2() %> name="opt2"></input>  </td>
					<td> <input type="text" value=<%=p.getOpt3() %> name="opt3" ></input>  </td>
					<td> <input type="text" value=<%=p.getOpt4() %> name="opt4"></input>  </td>
					<td> <input type="text" value=<%=p.getAns() %> name="ans"></input>  </td>
					<td> <input type="submit" value="update"> </td>
					<td> <a href="deleteques.jsp?qno=<%=p.getSlno()%>&sub=<%=request.getParameter("sub")%>">Delete </a> </td>
					<td><input type="hidden" value=<%=request.getParameter("sub") %> name="sub"></td>
					</form>
				</tr>
	<%	
			}
			else
			{
				%>
				<tr>
					<td><%=p.getSlno() %></td>
					<td><%=p.getQus() %></td>
					<td><%=p.getOpt1() %></td>
					<td><%=p.getOpt2() %></td>
					<td><%=p.getOpt3() %></td>
					<td><%=p.getOpt4() %></td>
					<td><%=p.getAns() %></td>
					<td> <a href="updateques.jsp?qno=<%=p.getSlno()%>&sub=<%=request.getParameter("sub")%>">Modify </a> </td>
					<td> <a href="deleteques.jsp?qno=<%=p.getSlno()%>&sub=<%=request.getParameter("sub")%>">Delete </a> </td>
				</tr>
		<%	
			}
		}
	%>
	</table>
</body>
</html>