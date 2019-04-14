<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
if(request.getParameter("orderid")!=null){
	 %>
	 <script type="text/javascript">alert("your user id is : "+ <%= request.getParameter("orderid")  %>);</script>

	 <% 
}

if(request.getParameter("flag")!=null){
	
	session.removeAttribute("cart");
	
}
%>
<title>Food Menu</title>
<link rel=stylesheet type="text/css" href= "vendors/css/normalize.v3.0.1.min.css%20%C2%B7%20GitHub.html">
<link rel=stylesheet type="text/css" href="vendors/css/grid/038%20Grid.css">
<link rel=stylesheet type="text/css" href="vendors/css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,300italic" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	
	function  addToCart(product,fid,rate,qt,fpic){
		var ajax = new XMLHttpRequest();
	ajax.open("GET","AddToCart.jsp?product="+product +"&rate=" +rate+"&fid="+fid+"&qt="+qt+"&fpic="+fpic,true);
	ajax.send();
	ajax.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			
		}
		
	}; 
}	
</script>
</head>
<body>
<%@include file="DBconnection.jsp" %>
<%
if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
}
String sql="select fname, fid, fprice, fpic from food";
PreparedStatement smt=con.prepareStatement(sql);
ResultSet rs=smt.executeQuery();
out.println("<table BORDER='2' width='100%'>");
while(rs.next()){
	%>
	<form>
	<%
	%>
	<input type="hidden" id='fpic' value="<%= rs.getString("fpic") %>" />
	<%
	out.println("<tr hight='200px'><td rowspan='2' hight='200px' width='400px'><img src='img/"+rs.getString("fpic")+"' hight='200px' width='200px'/></td>") ;
	out.println("<td>"+rs.getString("fname")+"</td><td><center><b>Qty</b><input type='number' id='qt'value='1'  name='qty' max='10' min='1'  style='height: 50px; width : 150px; background-color : lightgreen; color : red;  border-style : solid; border-color : white;'/></td></tr><tr><td>"+rs.getInt("fprice")+"'</center></td>");
	out.println("<td><center><input type='button' name='addCart' id='addCart1' onclick='addToCart(\""+ rs.getString("fname") +"\",\""+rs.getString("fid") +"\",\""+rs.getString("fprice")+"\",qt.value,fpic.value);' value='Add To Cart' style='height: 50px; width : 150px; background-color : lightblue; color : red;  border-style : solid; border-color : white;/>Add To Cart'</center></tr>");
	%>
	</form>
	<%	
	}

//out.println("<div class='clearfix'><tr><td><button type='submit' name='submit'style='float:center;' >Order Now</button></td></tr></div>");
%>
<style>
.button{
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center; 
  text-decoration: none;
  display: inline-block; 	
  float: right;
  position: fixed;
}
</style>
<a href="payment.jsp" class="button" >Order now</a>
<% 
out.println("</table>");
%>
</body>
</html>