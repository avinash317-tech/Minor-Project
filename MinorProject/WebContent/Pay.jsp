<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
<%
if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
} %>
<form action="orderPlace.jsp" method="post" >
<table>
<tr><td>Cash On Dilvery</td><td><input type="radio" name="payment" value="cash-on-dilvery" checked /></td></tr>
<tr><td> Debit Card </td><td><input type="radio" name="payment" value="debit" /></td></tr>
<tr><td>Net Banking</td><td> <input type="radio" name="payment" value="net banking" /></td></tr>
<tr><td colspan="1"><input type="submit" name="submit" value="submit"></td></tr>
</ul>
	
</table>
</form>
</body>
</html>