<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String num = request.getParameter("unum");
	String[] num_arr = num.split("");
	double result = Integer.parseInt(num_arr[0]) * Integer.parseInt(num_arr[0]);
	result -= Integer.parseInt(num_arr[1]);
	result += Integer.parseInt(num_arr[2]) * Integer.parseInt(num_arr[2]);
	%>
	<p>
		result is:
		<%=result%></p>
</body>
</html>