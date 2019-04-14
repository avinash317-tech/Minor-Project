<%@page import="java.util.Locale.Category"%>
<%@page import="com.data.Food"%>
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
<%@include file="DBconnection.jsp" %>
<%
try{
ArrayList<Food> cart= (ArrayList) session.getAttribute("cart");
if(cart!=null){
	int n=0;
	ResultSet rs=null;
	String sql = "Insert into ooderdetails (userid,dd) values(?,?)";
	PreparedStatement smt = con.prepareStatement(sql);
	Food f1= cart.get(0);
	smt.setString(1,session.getAttribute("userid")+"");
	java.util.Date dba= new java.util.Date();
	long date= dba.getTime();
	java.sql.Date dd= new java.sql.Date(date);
	smt.setDate(2,dd);
	 n= smt.executeUpdate();
	 if(n!=0){
		
		sql="select max(orderid) from ooderdetails";
		smt = con.prepareStatement(sql);
		rs=smt.executeQuery();	
		}
	 if(rs.next()){
		 n=0;
	
		 for(int i=0; i<cart.size(); i++){
			 f1= cart.get(i);
			 sql = "Insert into bill (orderid,fname,qty, rate) values(?,?,?,?)";
			 smt = con.prepareStatement(sql);
			 smt.setInt(1,rs.getInt(1));
			 smt.setString(2, f1.getFname());
			 smt.setInt(3,f1.getQty());
			 smt.setInt(4, f1.getFprice());
			 n= smt.executeUpdate();				 
		}
		 if(n!=0){
			 String pmode=request.getParameter("payment");
			sql="Insert into foodorder (ordid,dilistatus,paymentstatus,paymentmode,userid) values(?,?,?,?,?)";
			smt=con.prepareStatement(sql);
			smt.setInt(1,rs.getInt(1));
			smt.setString(2,"pending");
			smt.setString(3,"pending");
			smt.setString(4,pmode);
			smt.setString(5,session.getAttribute("userid")+"");
			smt.executeUpdate();
			response.sendRedirect("Menu.jsp?orderid="+ rs.getInt(1));
		 }
	 }
}
}
catch(SQLException se){
	se.printStackTrace();
	System.out.println("date problem");
}
catch(Exception e){
	e.printStackTrace();
	System.out.println("another problem");
}finally{
	try{
		con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
}
%>
</body>
</html>