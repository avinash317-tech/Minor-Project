<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBconnection.jsp"%>
<%
String name=request.getParameter("name");
//out.println("<script>alert("+name+")</script>");
//System.out.println(name);
Statement st=null;
ResultSet rs=null;
String query ="SELECT EMPID FROM EMP WHERE EMPID='"+name+"'";
st=con.createStatement();
rs=st.executeQuery(query);
if(name.equals(null)&& name.equals(""))
out.println("give valid name..");
if(rs.next()){
out.println("already id existed..");
}
else{
	out.println("valid id..");	
}
%>
</body>
</html>