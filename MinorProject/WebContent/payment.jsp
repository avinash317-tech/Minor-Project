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

<title>Conform Order</title>
</head>
<body class="bg">
<form>
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
	<tr><td colspan="1"><a href="Menu.jsp" class="button"  >Add Iteams</a>  </td>
	<td colspan="2"><input type="submit" name="submit" value="Payment Now" class="button" /></td>
	<td colspan="3"><a href="Menu.jsp?flag=yes" class="button" onclick="return conform();" >Cancel</a>  </td></tr>
	 <%			
}
%>
</table>
</form>
<%
if(request.getParameter("submit")!=null){
%>
<form action="orderPlace.jsp" method="post">
<table border='1'>
<tr><td>Cash On Dilvery</td><td><input type="radio" name="payment" value="cash-on-dilvery" checked /></td></tr>
<tr><td> Debit Card </td><td><input type="radio" name="payment" value="debit" /></td></tr>
<tr><td>Net Banking</td><td> <input type="radio" name="payment" value="net banking" /></td></tr>
<tr><td colspan="1"><input type="submit" name="submit" class="button" value="Submit"></td></tr>
</ul>
	
</table>
</form>
<%	
}
%>
<script type="text/javascript">

function conform() {
	if(!confirm("do you want to cancle"))
		return false;
	
	
}
</script>
</body>
</html>