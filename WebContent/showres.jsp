<%if(session.getAttribute("name")==null){
response.sendRedirect("errorpage.jsp");}%>
<%@page import="exam.model.QuizDao"%>
<%@page import="exam.db.Pojo_class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.db.Provider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
	 String val=null;
	 val=request.getParameter("val");
	 String sql="select * from results";
 
 
    Connection con=Provider.getMysqlConnection();
    if(val!=null)
    	sql="select * from results where name like '"+val+"%'";
  
	PreparedStatement pst  = con.prepareStatement(sql);
	
	ResultSet rs = pst.executeQuery();
	%>
	<table>
	<tr>
	<th>SL NO</th>
	<th>USERNAME</th>
	<th>SUBJECT</th>
	<th>SCORE</th>
	</tr>
	<%
	while(rs.next())
	{
		%>
		<tr>
		<td><%= rs.getInt(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getInt(4) %></td>
		</tr>
		
	<% 
	}
	%>
	</table>
 

 