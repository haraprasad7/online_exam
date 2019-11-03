
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	body{
		overflow: auto;
	}

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ques_prac.jsp" >
	<select required name="sub"  autofocus="autofocus" >
		<option hidden="hidden" value="">CHOOSE SUBJECT</option>
		<option value="ccp">Cloud Computing</option>
		<option value="dmdwp">Data Mining and  Data WareHousing</option>
		<option value="osp">Operating System</option>
		<option value="ajp">Advance Java</option>
	</select>
	<input type="submit" value="show">
</form>
</body>
</html>