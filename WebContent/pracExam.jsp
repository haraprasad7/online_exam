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
    	response.addHeader("cache-control","no-cache,no-store,must-revalidate");
    	response.addHeader("pragma","no-cache");
    	int length=0;
    %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		overflow: auto;
	}
</style>
 	<link rel = "stylesheet"
   				type = "text/css"
   				href = "css/pracExam.css" />
	<title>
			DAGH-Sign Up Log In
	</title>
	
	<script type="text/javascript" src="js/pracExam.js"></script>
</head>
	<%
	/* out.print(request.getParameter("subject")); */
		ArrayList<Pojo_class> allQuestions = QuizDao.getAllRecords(request.getParameter("subject"));
		/* out.print(allQuestions.size()); */
		length=allQuestions.size();
		for(Pojo_class e : allQuestions)
		{
		
	%>
			<p name="qus" hidden="true"><%=e.getSlno()%>:-:<%=e.getQus()%>:-:<%=e.getOpt1() %>:-:<%=e.getOpt2() %>:-:<%=e.getOpt3() %>:-:<%=e.getOpt4() %>:-:<%=e.getAns() %></p>
	
			<script type="text/javascript">
				addQuestion();
			</script>
	<% 
		}
	%>


<header>
	
	<div id="logo">
				<img src="resources/logo.jpg" alt="logo" height="100px" width="100px">
	</div>

	<div id="Subject_name">
				<b>SUBJECT NAME : <text id="subname"><%=request.getParameter("subject") %></text></b>
	</div>

	<div id="totalquestions">
				<b>TOTAL QUESTIONS : <text id="qlen"><%=length %></text></b>
	</div>

	<div id="userdata">
				<div id="username"><b>USERNAME : <%=session.getAttribute("name") %></b></div>
	</div>

</header>



<body>
	<script type="text/javascript">
		getLength(<%=length %>);
	</script>
	<div id="questionarea">

		<p id="q"></p>
		<div id="options">
			<br>
			<br>
			<text id="o1"></text>

			<input type="radio" name="type" value="1" id="r1" onclick="checkAnswer(this.value)"/>
			<br><br>
			<text id="o2"></text>

			<input type="radio" name="type" value="2" id="r2" onclick="checkAnswer(this.value)"/>
			<br><br>
			<text id="o3"></text>

			<input type="radio" name="type" value="3" id="r3" onclick="checkAnswer(this.value)"/>
			<br><br>
			<text id="o4"></text>
			<input type="radio" name="type" value="4" id="r4" onclick="checkAnswer(this.value)">
		</div>
		<div id="showans">
			<h3 id="anshead"></h3>
			<h4 id="answer"></h4>
		</div>
		
	</div>
	<div id="image1">
			<img alt="" src="resources/duck.gif">
	</div>
	<div id="image2">
			<img alt="" src="resources/oie_2917103gqMfuWHu.gif">
	</div>
	
		<button class="buttons b1" id="1" onClick="previous()">Previous</button>
		<br>
		<button class="buttons b2" id="2" onClick="next()">Next</button>
	
	<button id="endprac">End Practice</button>

<!-- The Modal -->
		<div id="myModal" class="modal">
		
		 	<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
			    	<span class="close">&times;</span>
			    	<h2></h2>
			 	</div>
			  	<div class="modal-body">
			    	<p>Do you Really Want to End the Practice?</p>
			 	</div>
			  	<div class="modal-footer">
			    	<button id="ok" class="mbutton" onclick="ok2()">YES</button>
			    	<button id="cancel" class="mbutton" onclick="close2()">NO</button>
			    </div>
			 </div>
		</div>
<script type="text/javascript">
	bclick(0);
</script>
<script type="text/javascript">
	
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("endprac");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	modal.style.display = "block";
	  
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	function close2(){
		
		modal.style.display = "none";
	}
	function ok2(){
		//alert("submit");
		modal.style.display = "none";
		if(window.XMLHttpRequest){  
			xhttp=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			xhttp=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		//alert(answer);
		xhttp.open("GET", "http://localhost:8080/exam/selectsubject.jsp", false);
		xhttp.send();
		/* document.getElementById("subjectselect").innerHTML=String(xhttp.responseText) */;
		window.location="http://localhost:8080/exam/selectsubject.jsp";
		//alert("submit");
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    //modal.style.display = "block";
	  }
	}
</script>
	<text id="err"></text>
</body>
</html>
