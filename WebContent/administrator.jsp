
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

	body{
		overflow: auto;
}
#tbl{
	padding:5px;
}
</style>
</head>
<body>
<form action="addSuccess.jsp">
<!-- ENTER THE SUBJECT:<input type="text" name="sub"> -->
<select required name="sub"  autofocus="autofocus" >
	<option hidden="hidden" value="">CHOOSE SUBJECT</option>
	<option value="cc">Cloud Computing</option>
	<option value="dmdw">Data Mining and  Data WareHousing</option>
	<option value="os">Operating System</option>
	<option value="aj">Advance Java</option>
	<option value="aca">Advance Computer Architecture</option>
</select>
<div id="div">
<hr>
ENTER THE QUESTION :<input type="text" name="qus" size="100" required="required" id="tbl"/>
<hr>
ENTER OPTION 1 :<input type="text" name="opt1" required="required"id="tbl"/>
<hr>
ENTER OPTION 2 :<input type="text" name="opt2" required="required"id="tbl"/>
<hr>
ENTER OPTION 3 :<input type="text" name="opt3" required="required"id="tbl"/>
<hr>
ENTER OPTION 4 :<input type="text" name="opt4" required="required"id="tbl"/>
<hr>
</div>
<select required name="ans">
	<option hidden="hidden" value="">CHOOSE OPTION</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
</select>
<hr><input type="submit" value="ADD QUESTION">
<hr><input type="button" value="Logout">
</form>
</body>
</html>