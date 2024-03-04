<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PreparedStatement ps;
ResultSet rs;
try {
Class.forName("org.mariadb.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb", "root",
"maria");
String operation = request.getParameter("op");
if ("search".equals(operation)) {
// Search operation
String uid = request.getParameter("uid");
int u = Integer.parseInt(uid);
ps = cn.prepareStatement("select * from usertable where uid=?");
ps.setInt(1, u);
rs = ps.executeQuery();
boolean found = false;
String role = null;
String nm = null;
String pwd = null;
while (rs.next()) {
role = rs.getString("role");
pwd = rs.getString("password");
nm = rs.getString("name");
found = true;
break;
}
if (found) {
out.print(uid + "&" + nm + "&" + pwd + "&" + role);
session.setAttribute("username", nm);
} else {
out.print("Record not found");
}
} else if ("add".equals(operation)) {
// Add operation
String uid = request.getParameter("uid");
int u = Integer.parseInt(uid);
String pwd = request.getParameter("pwd");
String role = request.getParameter("role");
String name = request.getParameter("name");
ps = cn.prepareStatement("Insert into usertable values (?,?,?,?)");
ps.setInt(1, u);
ps.setString(2, pwd);
ps.setString(3, role);
ps.setString(4, name);
ps.execute();
out.print("Records added successfully");
} else if ("delete".equals(operation)) {
// Delete operation
String uid = request.getParameter("uid");
int u = Integer.parseInt(uid);
ps = cn.prepareStatement("delete from usertable where uid=?");
ps.setInt(1, u);
int deletedRows = ps.executeUpdate();
if (deletedRows > 0) {
out.print("Record with UID " + uid + " deleted successfully");
} else {
out.print("Record with UID " + uid + " not found");
}
} else if ("edit".equals(operation)) {
// Edit operation
String uid = request.getParameter("uid");
int u = Integer.parseInt(uid);
String pwd = request.getParameter("pwd");
String role = request.getParameter("role");
String name = request.getParameter("name");
ps = cn.prepareStatement("update usertable set password=?, role=?, name=? where uid=?");
ps.setString(1, pwd);
ps.setString(2, role);
ps.setString(3, name);
ps.setInt(4, u);
int updatedRows = ps.executeUpdate();
if (updatedRows > 0) {
out.print("Record with UID " + uid + " updated successfully");
} else {
out.print("Record with UID " + uid + " not found");
}
}
} catch (Exception e) {
e.printStackTrace();
} finally {
// Close resources if needed
}
%>