<%-- <%if(session.getAttribute("name")==null){
response.sendRedirect("errorpage.jsp");}%> --%> 
<%@page import="exam.model.QuizDao"%>
<%
    response.addHeader("cache-control","no-cache,no-store,mustrevalidate");
    response.addHeader("pragma","no-cache");
    %> 
    <%!String subject; %>
<%
	 subject=request.getParameter("subject");
 //to be later fetched from parmaetr
/* int status=89;
if(request.getParameter("examtype").equals("1"))
{
	status=QuizDao.createUser(name,request.getParameter("subject"));
}
else
	
{
	out.print("byy by");
}
out.print(status);*/ 
%>

<html>
<head>
<script>
#color_codes{
	position:absolute;

right:1%;
bottom:12%;
}</script>
<script>
function checkbox()
{
	//document.write(document.getElementById('sub').textContent);
	if(document.getElementById('chk').checked)
		window.location="exam.jsp?subject="+document.getElementById('sub').textContent;
 }
</script>
<script>
	function noback{
		window.history.forward();
	}
</script>
<style>
ul{
	/* margin-left:35%; */
	margin-top:10%;
	text-align:left;
	font-weight: bold;
	font-size: larger;
	transform:translate(36%);
	list-style: none;
} 
ul li:before {
  content: "\2713\0020";
  color: chartreuse;
  size:20px;
  font-size: larger;
}
#div{
	text-align:center;
}
.btn{
	padding:10px;
	margin-top:80px;
	background-color:rgba(155,0,155,0.2);
}
body{
	background-color:rgba(0,0,255,0.1);
	font-weight: bold;
	font-size: larger;
	overflow: auto;
}
#h1{
	margin-top:50px;
}
p{
	margin-top:50px;
	font-size: larger;
}

</style>
</head>
<body onload="noback()">
<text hidden="hidden" id="sub"><%=subject %></text>
<div id="div">
<u><h1 id="h1">Instructions</h1></u>
<ul>
<li>Do not try to copy and paste questions on new tab</li>
<li>Contact admin for any issue</li>
<li>do not press the back button or reload button</li>
<li>Check the color codes for saved marked, unsaved answers</li>
</ul>
<div id="color_codes">
		<text class="attempted">Attempted</text>
		<text class="unattempted">Unattempted</text>
		<text class="review">Marked for review</text>
	</div>

<input  type="checkbox" id="chk"> I have read all the Instruction carefully.
<br>
<button  onclick="checkbox()" class="btn">Start Exam</button>

<br>
<br>
<p>All The Best For The Exam.&#128519</p>
</div>
</body>
</html>


