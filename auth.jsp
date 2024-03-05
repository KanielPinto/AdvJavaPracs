<%@page import="java.sql.*"%>
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
PreparedStatement ps;
ResultSet rs;
try{
	Class.forName("org.mariadb.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb", "root", "root");
	String uid = (String) request.getParameter("uid");
	int u = Integer.parseInt(uid);
	String pwd = (String)request.getParameter("pwd");
	ps = cn.prepareStatement("SELECT * FROM USERS WHERE uid=? AND pwd=?");
	ps.setInt(1,u);
	ps.setString(2,pwd);
	rs=ps.executeQuery();
	boolean found = false;
	String role = null;
	String username= null;
	while(rs.next()){
		role=rs.getString("role");
		username=rs.getString("name");
		found=true;
		break;
	}
	if (found==false){
		out.print("User Not Found");
	}
	else{
		out.print("Name = "+username+", Role = "+role);
	}
	session.setAttribute("username", username);
} catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>