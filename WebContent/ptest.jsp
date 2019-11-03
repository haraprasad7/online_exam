<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="exam.db.Provider,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- <title>Insert title here</title> -->
</head>
<body>
<%!ResultSet rs;%>
	<%
		Connection con=Provider.getMysqlConnection();
		String sql="select * from cc";
		PreparedStatement pst=con.prepareStatement(sql);
		rs=pst.executeQuery();
		while(rs.next())
		{
		%>
		<p><%=rs.getString(1) %>
		<ul>
			<li><%=rs.getString(2) %></li>
			<li><%=rs.getString(3) %></li>
			<li><%=rs.getString(4) %></li>
			<li><%=rs.getString(5) %></li>
			<li><%=rs.getString(6) %></li>
			<li><%=rs.getString(7) %></li>
		</ul>
		</p>
		<%} %>
</body>
</html>