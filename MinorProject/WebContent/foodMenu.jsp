<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel=stylesheet type="text/css" href= "vendors/css/normalize.v3.0.1.min.css%20%C2%B7%20GitHub.html">
<link rel=stylesheet type="text/css" href="vendors/css/grid/038%20Grid.css">
<link rel=stylesheet type="text/css" href="vendors/css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,300italic" rel="stylesheet" type="text/css">

<meta charset="ISO-8859-1">
<title>Food Menu</title>
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
<%@include file="DBconnection.jsp" %>
<nav>
        <div>
         <button style="float:left;width:5%;margin:0 auto"><a href="Emplyee.jsp"  style="height:5px">&#9776;</a></button>
           
           </div>
       </nav>
<%if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
} %>
<form style="border:1px solid #ccc; width:50%;align-content:center;margin:0 auto;">
  <div class="container" id="signup">
  <center><h1 style="color:red";>Food Iteam</h1></center>
    
    <label for="Name"><b>FoodName</b></label>
    <input type="text" placeholder="Enter Food-Name" name="fname" required>
    
    <label for="Foodid"><b>Food-Id</b></label>
    <input type="text" placeholder="Enter Food-Id" name="fid" required>

    <label for="Food Type"><b>Food Type</b></label>
    <input type="text" placeholder="Enter Food Type" name="ftype" required>

    <label for="Food Price"><b>Food Price</b></label>
    <input type="text" placeholder="Enter Food Price" name="fprice" required>

    <label for="Food Picture"><b>Food Picture</b></label>
    <input type="file" placeholder="Food Picture" name="fpic" required>
    

    <div class="clearfix">
      
      <button type="submit" name="submit" class="signupbtn">Submit</button>
    </div>
  </div>
</form>

<%
try{
if(request.getParameter("submit")!=null){
String sql = "Insert into food (fname,fid,ftype,fprice,fpic) values(?,?,?,?,?)";
PreparedStatement smt = con.prepareStatement(sql);
smt.setString(1, request.getParameter("fname"));
smt.setString(2,request.getParameter("fid"));
smt.setString(3, request.getParameter("ftype"));
smt.setInt(4, Integer.parseInt(request.getParameter("fprice")));
smt.setString(5,request.getParameter("fpic"));
int n= smt.executeUpdate();
if(n!=0){
	out.println("<script>alert('Data Saved');</script>");

//con.close();
}
}

}catch(Exception e){
	out.println("<script>alert('error!');</script>");
	System.out.println("error"+e.getMessage());
}
%>

</body>
</html>