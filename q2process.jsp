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
	String num = request.getParameter("usernumber");
	String formula = request.getParameter("formula");
	double result = 0;
	int n = Integer.parseInt(num);
	if (formula.equals("cube")) {
		result = (n * (n + 1) / 2) * (n * (n + 1) / 2);
	} else if (formula.equals("square")) {
		result = (n * (n + 1) * (2 * n + 1)) / 6;
	} else if (formula.equals("numbers")) {
		result = (n * (n + 1)) / 2;
	}
	int sum = 0;
	int m = 1;
	while (m > 0) {
		m = n % 10;
		sum = sum + m;
		m = n / 10;
		n = m;
	}
	%>
	<p>
		Selected formula is :
		<%=formula%></p>
	<b>Result : <%=result%></b>
</body>
</html>