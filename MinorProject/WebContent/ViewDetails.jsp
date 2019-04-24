<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.button{
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center; 
  text-decoration: none; 	
  float: right;
}

          body, html {
  height: 100%;
}

.bg { 
  /* The image used */
   background-image: linear-gradient(pink, yellow);

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
    body{
        background-size: cover;
        background-position:center;
        background-repeat: no-repeat;
        position:relative;
       background-image: linear-gradient(pink, yellow);
       }

</style>
</head>
<body class="bg">
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

String ql="Select dd from ooderdetails where orderid='"+orderid+"'";
smt=con.prepareStatement(ql);
ResultSet rp=smt.executeQuery();
if(rp.next()){
	date=rp.getString("dd");
}
String sql="Select name,mobileno,cusaddress from customer where userid='"+userid+"'";
smt =con.prepareStatement(sql);
 rs=smt.executeQuery();
 %>
 <form method="post">
 
 <%
out.println("<table BORDER='2' width='100%'>");
%>
<tr><td><b>Order-No:-</b><%=orderid %></td>
<td colspan="2" style="text-align: right"><b>Date:-</b><%=date %></td></tr>
<%
while(rs.next()){
	out.println("<tr hight='200px'><td><b>Name:-</b>"+rs.getString("name")+"</td>") ;
	out.println("<td><b>Mobile-No:-</b>"+rs.getString("mobileno")+"</td>");
	out.println("<td><b>Customer-Address:-</b>"+rs.getString("cusaddress")+"</td></tr>");
	}

String sql1="Select fname,qty,rate from bill where orderid='"+orderid+"'";

smt =con.prepareStatement(sql1);
rs=smt.executeQuery();
%>
<tr><td colspan="3" style="text-align:center"><b>Ordered-Iteams</b></td></tr>
<tr><td><b>Food-Name</b></td><td><b>Food-Qty</b></td><td><b>Food-Price</b></td></tr>
<%
while(rs.next()){
	
	out.println("<tr><td>"+rs.getString("fname")+"</td>") ;
	out.println("<td>"+rs.getString("qty")+"</td>");
	out.println("<td>"+rs.getString("rate")+"</td></tr>");
	sum=sum+Integer.parseInt(rs.getString("rate"));
	}

%>
<input type="hidden" name="orderid" value="<%=orderid%>"/>
<tr><td colspan="2" style="align:center;"><input type="submit" name="submit" value="dispatched" class="button" /></a></td><td style="text-align:right"><b>Amount:-</b><%=sum %></td></tr>
</table>
</form>
<%
try{
if(request.getParameter("submit")!=null){
 orderid=request.getParameter("orderid");
 sql="update foodorder set dilistatus ='dispatched' where ordid="+ Integer.parseInt(orderid);
 smt=con.prepareStatement(sql);
int x=smt.executeUpdate();
if(x>0){	
}
response.sendRedirect("ViewOrder.jsp");
}
else{
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>


