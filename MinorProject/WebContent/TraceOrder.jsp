<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
      <link rel=stylesheet type="text/css" href= "vendors/css/normalize.v3.0.1.min.css%20%C2%B7%20GitHub.html">
      <link rel=stylesheet type="text/css" href="vendors/css/grid/038%20Grid.css">
      <link rel=stylesheet type="text/css" href="vendors/css/ionicons.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,300italic" rel="stylesheet" type="text/css">
      
<title>Trace-Order</title>
</head>
<body>
<%if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
} %>
<form style="border:1px solid #ccc; width:50%;align-content:center;margin:0 auto;" method="post">
<div class="div">

 <label for="trace"><b>Order-Number</b></label>
    <input type="text" placeholder="Order Number" name="orderNo" required>
    <button type="submit" name="submit">Trace</button>
</div>
</form>
</body>
</html>