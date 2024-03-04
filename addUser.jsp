<%@page import="java.sql.*"%>
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
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb", "root", "root");
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String role = request.getParameter("role");
		String name = request.getParameter("name");
		// Add user only if "Add User" button is clicked
		if (request.getParameter("addUserBtn") != null && uid != null && pwd != null && role != null && name != null) {
			ps = cn.prepareStatement("Insert into usertable values (?,?,?,?)");
			ps.setString(1, uid);
			ps.setString(2, pwd);
			ps.setString(3, role);
			ps.setString(4, name);
			ps.execute();
			out.print("Record added successfully<br>");
		}
		// Display users if "Display all" checkbox is checked
		String cb = request.getParameter("displayall");
		if (cb != null) {
			ps = cn.prepareStatement("select * from usertable");
			rs = ps.executeQuery();
			out.println("<table>");
			while (rs.next()) {
		out.println("<tr>");
		out.println("<td>" + rs.getString("uid") + "</td>");
		out.println("<td>" + rs.getString("role") + "</td>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("</tr>");
			}
			out.println("</table>");
		} else {
			// Display user if uid is provided
			if (uid != null && !uid.isEmpty()) {
		ps = cn.prepareStatement("select * from usertable where uid=?");
		ps.setString(1, uid);
		rs = ps.executeQuery();
		out.println("<table>");
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString("uid") + "</td>");
			out.println("<td>" + rs.getString("role") + "</td>");
			out.println("<td>" + rs.getString("name") + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>