<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.data.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  
 <%
 if(request.getParameter("index")!=null){
	 int index = Integer.parseInt(request.getParameter("index"));
	 ArrayList<Food> cart1= (ArrayList) session.getAttribute("cart");
	 if(cart1!=null){
	 cart1.remove(index);
	 session.setAttribute("cart", cart1);
	 response.sendRedirect("payment.jsp");
	 }
 }
 %>  
</body>
</html>