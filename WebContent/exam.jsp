
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
   				href = "css/exam.css" />
	<title>
			DAGH-Sign Up Log In
	</title>
	
	<script type="text/javascript" src="js/examfun.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
	<%
	/* out.print(request.getParameter("subject")); */
		ArrayList<Pojo_class> allQuestions = QuizDao.getAllRecords(request.getParameter("subject"));
		//out.print(allQuestions.size());
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
				<b>TOTAL QUESTIONS: <text id="qlen"><%=length %></text></b>
	</div>

	<div id="timer">
				<b>Time	:	<span id="minute">5</span>:<span id="txtHint">60</span></b>
	</div>

	<div id="userdata">
				<b><div id="username">USERNAME : <%=session.getAttribute("name") %></div></b>
	</div>

</header>

<body>
		
		<div id="questionbuttons">
				<br>
				<%
						for(int i=1;i<=length;i++)
						{
				%>
						<button id="<%=i-1 %>" onClick="bclick(<%=i-1 %>)" class="button"><%=i %></button>
				<%
							if(i%4==0)
							{
				%>
								<br>
				<%
							}
						} 
				%>

		</div>

		<div id="questionarea">

				<p id="q"></p>
				
				<div id="options">
					<br>
					<br>
				<text id="o1"></text>

				<input type="radio" name="type" value="FinalExam" id="r1">
					<br>
					<br>
				<text id="o2"></text>

				<input type="radio" name="type" value="FinalExam" id="r2">
					<br/>
					<br/>
				<text id="o3"></text>

				<input type="radio" name="type" value="FinalExam" id="r3"/>
				<br>
				<br>
				<text id="o4"></text>
				<input type="radio" name="type" value="FinalExam" id="r4">
				<br>
				<br>
		</div>
		
		<div id="image">
		</div>

	</div>
	<!-- <div id ="timer"><h1>the time is <span id="minute">5</span>:<span id="txtHint">60</span></h1></div> -->
	<div id="buttons">
		<button id="1"onClick="saveprevious()" class="buttons">Save and previous</button>
		<button id="2" onClick="previous()"class="buttons">Previous</button>
		<button id="3" onClick="mark()"class="buttons">Marked for review</button>
		<button id="4" onClick="next()"class="buttons">Next</button>
		<button id="5"onClick="savenext()"class="buttons">Save and Next</button>
	</div>

	<div id="color_codes">
		<text class="attempted">Attempted</text>
		<text class="unattempted">Unattempted</text>
		<text class="review">Marked for review</text>
	</div>
	<div>
		<button id="submit" onClick="submit()">Submit</button>
	</div>
	
	<!-- The Modal -->
		<div id="myModal" class="modal">
		
		 	<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
			    	<span class="close">&times;</span>
			    	<h2></h2>
			 	</div>
			  	<div class="modal-body">
			    	<p>Do you Really Want to Finally Submit ?</p>
			 	</div>
			  	<div class="modal-footer">
			    	<button id="ok" class="mbutton" onclick="ok2()">OK</button>
			    	<button id="cancle" class="mbutton" onclick="close2()">CANCLE</button>
			    </div>
			 </div>
		</div>
		<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("submit");

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
			//alert("submit");
			//window.location="http://localhost:9090/Exam/result_calculate.jsp?res="+answer;
			if(window.XMLHttpRequest){  
				xhttp=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				xhttp=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			//alert(answer);
			xhttp.open("GET", "http://localhost:8080/exam/result_calculate.jsp?subject="+document.getElementById('subname').textContent+"&res="+answer, false);
			xhttp.send();
			document.getElementById("resultPage").innerHTML=String(xhttp.responseText);
			//alert("submit");
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    //modal.style.display = "block";
		  }
		}
		</script>		
		<script type="text/javascript">
			bclick(0);
		</script>

	<text id="err"></text>
	<html id="resultPage"></html>
</body>
</html>