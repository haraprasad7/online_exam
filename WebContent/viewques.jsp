<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		overflow: auto;
	}
	</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ques.jsp" >
	<select required name="sub"  autofocus="autofocus" >
		<option hidden="hidden" value="">CHOOSE SUBJECT</option>
		<option value="cc">Cloud Computing</option>
		<option value="dmdw">Data Mining and  Data WareHousing</option>
		<option value="os">Operating System</option>
		<option value="aj">Advance Java</option>
	</select>
	<input type="submit" value="show">
</form>
</body>
</html>