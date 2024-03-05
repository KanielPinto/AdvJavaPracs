<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String num = request.getParameter("userinput");
	int n = Integer.parseInt(num);
	int m = 0;
	int sum = 0;
	while (n > 0) {
		m = n % 10;
		sum = sum + m;
		n = n / 10;
	}
	%>
	<h1>
		The sum is :
		<%=sum%></h1>
</body>
</html>