<%@page import="java.sql.ResultSet"%>
<%@page import="exam.model.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
h1{
	text-align:center;
}
h3{
	text-transform: capitalize;
	text-align:center;
}
h2{
	text-align:center;
	/* margin-left:10px; */
}
body{
	background-color:rgba(0,0,255,0.1);
	font-weight: bold;
	font-size: larger;
	margin-left:30px;
	overflow: auto;
}
#wr{
	color:White;
	background-color:RED;
	margin-left:30px;
	width:164px;
	/* padding-left:10px;
	padding-right:10px; */
}
#cr{
	width:164px;
	color:White;
	background-color:GREEN;
	margin-left:30px;
}
#unatm{
width:164px;
	color:White;
	background-color:magenta;
	margin-left:30px;
}
#atm{
	width:164px;
	color:White;
	background-color:lime;
	margin-left:30px;
	}
#mb{
	background-color:coral;
	width:164px;
}
#div{
	display: inline-flex;
	padding-top:50px;
	/* transform:translate(36%); */
	transform: translate(25%, 50%);
}
#subselect{
position: absolute;
bottom: 7%;
right: 10%;
}
</style>
</head>
<body>
	<%
	//response.sendRedirect("https://www.google.com");
	
	int i=0,c=0,un=0;
	String h;
	String s=request.getParameter("res");
	String[] answers=s.split(",");
	int anslen=answers.length;
	
/* 	out.print(anslen);
	out.print(request.getParameter("subject")); */
	
	int ans[]=new int[anslen];
	
	
	for(String w:answers){
		ans[i++]=Integer.parseInt(w);
		}
	int[] ansget=QuizDao.getAnswer(anslen,request.getParameter("subject"));
	 /* for(int a=1;a<11;a++){
		out.print(ansget[a]+" ");
		}  */
	 for(int k=0;k<anslen;k++)
		{
			if(ans[k]==ansget[k])
				c++;
			if(ans[k]==0)
				un++;
		}
		QuizDao.storeAnswer((String)session.getAttribute("name"),request.getParameter("subject"),c*2);
		%>
		<h1>THANK YOU <%=session.getAttribute("name") %></h1>
		<div id="div">
		<div id="mb">
			<h3>Mark obtained :</h3>
			<h2><%=c*2%></h2>
		</div>
		<div id="atm">
			<h3>Attempted:</h3><h2><%=anslen-un %></h2>
		</div>
		<div id="unatm">
			<h3>Unattempted</h3>
			<h2><%=un %></h2>
		</div>
		<div id="cr">
		<h3>correct</h3>
		<h2><%=c %></h2>
		</div>
		<div id="wr">
			<h3>wrong</h3>
			<h2><%=anslen-c-un %></h2>
		</div>
		</div>
		
		<a href="selectsubject.jsp" id="subselect">Select Another Subject</a>
</body>
</html>