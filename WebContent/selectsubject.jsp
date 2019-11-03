<%-- <%if(session.getAttribute("name")==null){
response.sendRedirect("errorpage.jsp");}%> --%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		overflow: auto;
	}
	#signout{
	position: absolute;
	bottom: 5%;
	left: 48%;
	background-color: coral;
	
	}
</style>
	<script>
	function loadexam(id)
	{
	var subject;
	if(document.getElementById('final').checked)
	{
	console.log(id);
	var uri="instructions.jsp?subject="+id;
	console.log(uri);
	}
	else
	{
	var uri="pracExam.jsp?subject="+id+"p";
	
	}
	window.location=uri;
	
	
	}
	</script>
	<link rel="stylesheet" type="text/css" href="css/radio.css">
	<title></title>
</head>
<body>
	<div id="choice">
	<h2>EXAM MODE </h2>
	<label class="container">Final
	  <input  type="radio" checked="checked" id="final" name="radio">
	  <span class="checkmark"></span>
	</label>
	<label class="container">Practice
	  <input type="radio" id="prac" name="radio">
	  <span class="checkmark"></span>
	</label>
	</div>

	<div id="subject">
	<h2>SELECT A SUBJECT</h2>
	<button id="cc" class="button" onclick="loadexam(this.id)">Cloud Computing</button>
	<button id="dmdw" class="button" onclick="loadexam(this.id)">Data Mining and Data Warehouse</button>
	<button id="aj" class="button" onclick="loadexam(this.id)">Advanced Java</button>
	<button id="os"class="button" onclick="loadexam(this.id)">Opearting System</button>
	<button id="aca"class="button" onclick="loadexam(this.id)">Advanced  Computer Architecture</button>
	<br>
	<br>

	</div>
	
	<form action="login.htm">
		<input type="submit" value="Sign Out" id="signout">
	</form>

</body>
</html>