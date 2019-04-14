<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.data.*" %>
<%
if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
}
Food f1= new Food();
f1.setFid(request.getParameter("fid"));
f1.setFname(request.getParameter("product"));
f1.setFprice(Integer.parseInt(request.getParameter("rate")));
f1.setQty(Integer.parseInt(request.getParameter("qt")));
f1.setFpic(request.getParameter("fpic"));
ArrayList<Food> cart= (ArrayList) session.getAttribute("cart");
if(cart==null){
	cart=new ArrayList();
}
boolean flag=true;
for(int i=0;i<cart.size();i++){
	if(cart.get(i).getFid().equals(request.getParameter("fid"))){
		flag=false;
	cart.get(i).setQty(cart.get(i).getQty()+Integer.parseInt(request.getParameter("qt")));
	break;
	}	
}
if(flag)
cart.add(f1);
session.setAttribute("cart", cart);
%>



</body>
</html>