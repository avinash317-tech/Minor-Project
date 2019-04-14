<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Food"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    
    
 
<!DOCTYPE html>
<%
if(session.getAttribute("cart")==null){
	response.sendRedirect("Menu.jsp");
	return;
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel=stylesheet type="text/css" href= "vendors/css/normalize.v3.0.1.min.css%20%C2%B7%20GitHub.html">
<link rel=stylesheet type="text/css" href="vendors/css/grid/038%20Grid.css">
<link rel=stylesheet type="text/css" href="vendors/css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,300italic" rel="stylesheet" type="text/css">
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

<title>Conform Order</title>
</head>
<body>
<table border='1'>
<tr><th>image</th><th>Food</th><th>Quntity</th><th>Price</th><th>Total</th><th>remove</th></tr>

<%
if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
}

ArrayList<Food> cart= (ArrayList) session.getAttribute("cart");
if(cart!=null){
	int sum=0;
	%>


	 
	<%
	for(int i=0;i<cart.size();i++){
		Food f1 = cart.get(i);
		sum=sum+f1.getFprice()*f1.getQty();
	
		%>
		<center>
<tr><td><img src='img/<%= f1.getFpic() %>' hight='200px' width='200px'/></td><td><%=f1.getFname()%></td><td><%=f1.getQty()%></td><td><%=f1.getFprice()%></td><td><%= f1.getFprice()*f1.getQty() %></td><td><a href="RemoveFromCart.jsp?index=<%=i%>">Remove</a></td></tr>
		<%
	}
	%><tr><td colspan="5" >Total Price</td><td><%= sum %></td></tr>  
	<tr><td colspan="3"><a href="Pay.jsp" class="button" >Payment Now</a></td>
	<td colspan="3"><a href="Menu.jsp?flag=yes" class="button" onclick="return conform();" >Cancel</a>  </td></tr>
	 <%			
}

%>

</table>  
<script type="text/javascript">

function conform() {
	if(!confirm("do you want to cancle"))
		return false;
	
	
}
</script>

</body>
</html>