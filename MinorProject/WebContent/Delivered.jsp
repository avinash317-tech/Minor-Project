<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBconnection.jsp" %>
<%if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
}
int sum=0;
String userid=request.getParameter("userid");
String orderid=request.getParameter("orderid");
PreparedStatement smt=null;
String date=null;
ResultSet rs=null;
String sql="Select rate from bill where orderid='"+orderid+"'";
smt =con.prepareStatement(sql);
rs=smt.executeQuery();
while(rs.next()){
sum=sum +Integer.parseInt(rs.getString("rate"));
	}
String ql="Select dd from ooderdetails where orderid='"+orderid+"'";
smt=con.prepareStatement(ql);
ResultSet rp=smt.executeQuery();
while(rp.next()){
	date=rp.getString("dd");
}
 sql="Select name,mobileno,cusaddress from customer where userid='"+userid+"'";
smt =con.prepareStatement(sql);
 rs=smt.executeQuery();
out.println("<table BORDER='2' width='100%'>");
%>
<tr><td><b>Order-No:-</b><%=orderid %></td>
<td><b>Amount:-</b><%=sum %></td>
<td><b>Date:-</b><%=date %></td></tr>
<%
while(rs.next()){
	out.println("<tr hight='200px'><td><b>Name:-</b>"+rs.getString("name")+"</td>") ;
	out.println("<td><b>Mobile-No:-</b>"+rs.getString("mobileno")+"</td>");
	out.println("<td><b>Customer-Address:-</b>"+rs.getString("cusaddress")+"</td></tr>");
	}
sql="Select post from emp where empid='"+session.getAttribute("userid")+"'";
smt=con.prepareStatement(sql);
rs=smt.executeQuery();
if(rs.next()){
if(rs.getString("post").equalsIgnoreCase("Manager")){
sql="Select fname,qty,rate from bill where orderid='"+orderid+"'";
smt =con.prepareStatement(sql);
rs=smt.executeQuery();
%>
<tr><td colspan="3" style="text-align:center"><b>Ordered-Iteams</b></td></tr>
<tr><td><b>Food-Name</b></td><td><b>Food-Qty</b></td><td><b>Food-Price</b></td></tr>
<%
while(rs.next()){
	
	out.println("<tr><td>"+rs.getString("fname")+"</td>") ;
	out.println("<td>"+rs.getString("qty")+"</td>");
	out.println("<td>"+rs.getString("rate")+"</td></tr>");
	}
}
}
%>
</table>
</body>
</html>


