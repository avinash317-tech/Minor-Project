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

<title>Customer Register</title>
</head>
<body>
<%@include file="DBconnection.jsp" %>
    <form style="border:1px solid #ccc; width:50%;align-content:center;margin:0 auto;" method="post" >
  <div class="container" id="signup">
  <center><h1 style="color:red";>Sign-Up</h1></center>
    <p>Please fill in this form to create an account.</p>
    <hr>
    
    <label for="Name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>
    
    <label for="Userid"><b>User-Id</b></label>
    <input type="text" placeholder="Enter User-Id" name="UserId" required>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label for="psw-repeat"><b>Conform Password</b></label>
    <input type="password" placeholder="Conform Password" name="psw-repeat" required>
    
    <label for="mobileNo"><b>Mobile-No</b></label>
    <input type="text" placeholder="Enter Mobile-No" name="mobileno" required>
    
    <label for="Address"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="cusaddress" required>

    <label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>

    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" name="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>
<%
try{
if(request.getParameter("psw").equals(request.getParameter("psw-repeat"))){
if(request.getParameter("submit")!=null){
String sql = "Insert into customer (name,userid,email,psw,mobileno,cusaddress) values(?,?,?,?,?,?)";
PreparedStatement smt = con.prepareStatement(sql);
smt.setString(1, request.getParameter("name"));
smt.setString(2,request.getParameter("UserId"));
smt.setString(3, request.getParameter("email"));
smt.setString(4, request.getParameter("psw"));
smt.setString(5,request.getParameter("mobileno"));
smt.setString(6,request.getParameter("cusaddress"));
int n= smt.executeUpdate();
if(n!=0){
	 response.sendRedirect("login.jsp");
	//response.setHeader("location", "Data1.jsp");
}
else
	out.println("<script>alert('error!');</Script>");

con.close();
}
}
else{
	out.println("<script>alert('password not match');</Script>");
}
}catch(Exception e){out.println("<script>alert('error!'"+e.getMessage()+");</Script>");}
%>
</body>
</html>