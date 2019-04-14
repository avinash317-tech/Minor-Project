<%@page import="java.sql.PreparedStatement"%>
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

<title>EmpRegister</title>
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
    <input type="password" placeholder="Enter Password" name="psw" id="psw" onkeyup="passwordStrengthChecker();" required>

    <label for="psw-repeat"><b>Conform Password</b></label>
    <input type="password" placeholder="Conform Password" name="psw-repeat" id="pswrepeat" onkeyup="checke();" required>
    
    <label for="mobileNo"><b>Mobile-No</b></label>
    <input type="text" placeholder="Enter Mobile-No" name="mobileno" required>
    
    <label for="Address"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="empaddress" required>
    
     <label>
     <input type="radio" checked="checked" value="Manager" name="post" id="man" style="color:blue;">Manager
     </label>
     
      <label>
     <input type="radio" checked="checked" name="post" value="Delivary-staff" id="emp" style="color:blue;">Delivery-Staff
     </label><br><br>

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
 <script>
 function checke(){
	 alert("hello");
	 var gpassword = document.getElementById("psw").value;
	 var repassword =document.getElementById("pswrepeat").value;
	 if(gpassword!=repassword){
		 document.getElementById("pswrepeat").style.color="red";
		// psw.focus;
	 }
 }
    function passwordStrengthChecker(){
    	var gpassword = document.getElementById("psw");
    	var newpassword = gpassword.value;
    	var specialCharacters="~!@#$%^&*_-+=|\/<>";
    	var passwordscore=0;
    	var strength="";
    	var bordercolor="";
    	for(x=0;x<newpassword.length;x++){
      	   if(specialCharacters.indexOf(newpassword.charAt(x))>-1){
    			passwordscore+=20;
       		}
    	}
    	
    	
    	if(newpassword.length>8){
    		passwordscore+=20;
    	}
    	if(/[a-z]/.test(newpassword)){
    		passwordscore+=20;
    	}
    	if(/[A-Z]/.test(newpassword)){
    		passwordscore+=20;
    	}
    	if(/[\d]/.test(newpassword)){
    		passwordscore+=20;
    	}
    	
    	if(passwordscore>=100){
    		strength="Strong";
    		bordercolor="green"
    	}
    	
    	else if(passwordscore>=80){
    		strength="Medium";
    		bordercolor="yellow"
    	}
    	
    	
    	else if(passwordscore>=100){
    		strength="weak";
    		bordercolor="red"
    	}
    	
    	else{
    		strength="weak";
    		bordercolor="red"
    	}
    	
	

    	document.getElementById("psw").style.color=bordercolor;
    }
    </script>
<%
try{
if(request.getParameter("psw").equals(request.getParameter("psw-repeat"))){
if(request.getParameter("submit")!=null){
String sql = "Insert into emp (empName,empid,email,psw,mobileno,post,empadress) values(?,?,?,?,?,?,?)";
PreparedStatement smt = con.prepareStatement(sql);
smt.setString(1, request.getParameter("name"));
smt.setString(2,request.getParameter("UserId"));
smt.setString(3, request.getParameter("email"));
smt.setString(4, request.getParameter("psw"));
smt.setString(5,request.getParameter("mobileno"));
smt.setString(6, request.getParameter("post"));
smt.setString(7,request.getParameter("empaddress"));
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
	out.println("<script>alert('wrong password');</Script>");
}
}catch(Exception e){
	out.println("<script>alert('error!'"+e.getMessage()+");</Script>");
}
%>
</body>
</html>