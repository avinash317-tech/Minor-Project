<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.button{
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center; 
  text-decoration: none;
  display: inline-block; 	
  float: right;
  
}
</style>
<title>Insert title here</title>
</head>
<body>
<%@include file="DBconnection.jsp" %>
<%if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
}
PreparedStatement smt=null;
String post="";
String sql="Select post from emp where empid='"+session.getAttribute("userid")+"'";
smt=con.prepareStatement(sql);
ResultSet rs=smt.executeQuery();
if(rs.next())
	post=rs.getString("post");
if(post.equalsIgnoreCase("Manager")){
 sql="Select * from foodorder where dilistatus='pending'";
 smt=con.prepareStatement(sql);
rs=smt.executeQuery();
out.println("<table BORDER='2' width='100%'>");
%>
<form method="post">
<tr hight='200px'><td><b>Order-Id</b></td>
<td><b>User-Id</b></td>
<td><b>Dilivery-Status</b></td>
<td><b>Payment-Status</b></td>
<td><b>Payment-Mode</b></td>
<td><b>Futher-Action</b></td></tr>
<%
while(rs.next()){
	out.println("<tr hight='200px'><td>"+rs.getString("ordid")+"</td>") ;
	out.println("<td>"+rs.getString("userid")+"</td>");
	out.println("<td>"+rs.getString("dilistatus")+"</td>");
	out.println("<td>"+rs.getString("paymentstatus")+"</td>");
	out.println("<td>"+rs.getString("paymentmode")+"</td>");
	 out.println("<td><a href='ViewDetails.jsp?userid="+rs.getString("userid")+" &orderid="+rs.getString("ordid")+"' class='button' >View-Details</a>  </td></tr>");
	}
}
else{
	sql="Select * from foodorder where dilistatus='Dispatched'";
	 smt=con.prepareStatement(sql);
	rs=smt.executeQuery();
	out.println("<table BORDER='2' width='100%'>");
	%>
	<form method="post">
	<tr hight='200px'><td><b>Order-Id</b></td>
	<td><b>User-Id</b></td>
	<td><b>Dilivery-Status</b></td>
	<td><b>Payment-Status</b></td>
	<td><b>Payment-Mode</b></td>
	<td><b>Futher-Action</b></td></tr>
	<%
	 while(rs.next()){
		out.println("<tr hight='200px'><td>"+rs.getString("ordid")+"</td>") ;
		out.println("<td>"+rs.getString("userid")+"</td>");
		out.println("<td>"+rs.getString("dilistatus")+"</td>");
		out.println("<td>"+rs.getString("paymentstatus")+"</td>");
		out.println("<td>"+rs.getString("paymentmode")+"</td>");
		out.println("<td><a href='Delivered.jsp?userid="+rs.getString("userid")+" &orderid="+rs.getString("ordid")+"' class='button' >View-Details</a>  </td></tr>");
	 }
}%>
	</form>
</body>
</html>