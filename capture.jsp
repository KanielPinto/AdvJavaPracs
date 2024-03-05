<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Enumeration<String> e = request.getParameterNames();
	while (e.hasMoreElements()) {
		String var = e.nextElement();
		String value = request.getParameter(var);
		out.print("<p>" + value + "</p>");
	}
	%>
</body>
</html>