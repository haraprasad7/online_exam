<%@page import="exam.db.Provider"%>
<%@page import="exam.model.QuizDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
 <%
    response.addHeader("cache-control","no-cache,no-store,must-revalidate");
    response.addHeader("pragma","no-cache");
    %>
<% 

/* 	out.print(request.getParameter("name"));
out.print(request.getParameter("password"));
out.print(QuizDao.username); */
	int status=QuizDao.checkUser(request.getParameter("name"),request.getParameter("password"),request.getParameter("check"));
	if(status==-1)
	{
%>
	<jsp:include page="login.htm"></jsp:include>
	<script type="text/javascript">
		alert("Please enter the right credential");
	</script>
<%
	}
	else 
	{
		/* String username=QuizDao.username; */
		Cookie ck=new Cookie("name",request.getParameter("name"));
		response.addCookie(ck);
		if(Integer.parseInt(request.getParameter("check"))==0)
		{
			session=request.getSession();
			session.setAttribute("name", request.getParameter("name"));
			%>
			<jsp:include page="selectsubject.jsp"></jsp:include>
			<% 
		}
		else
		{
			session=request.getSession();
			session.setAttribute("name", request.getParameter("name"));
			%>
			<jsp:include page="admin.jsp"></jsp:include>
			<%
		
		}

%>
	<!--  redirection to the select exam page oadmin page based on checked value--> 
	<%
	}
	%>
      </ul>
   
   </body>
</html>