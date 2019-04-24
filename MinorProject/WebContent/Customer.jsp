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
<style>
            body{
                background:url("img/4.jpg");
                background-size: cover;
                background-position:center;
                background-repeat: no-repeat;
                position:relative;
               
               }
       </style>
</head>
<body>
<%@include file="DBconnection.jsp" %>

<nav>
        <div>
         <button style="float:left;width:5%;margin:0 auto"><a href="index9.html" style="height:5px">&#9776;</a></button>
        <div style=" float : right;">
           <ul class="main-nav">
               <li><a href="login.jsp">Login</a></li> 
              </ul> 
            </div>
           
           </div>
       </nav>

    <form style="border:1px solid #ccc; width:50%;align-content:center;margin:0 auto;" method="post" >
  <div class="container" id="signup">
  <center><h1 style="color:red";><b>Sign-Up</b></h1></center>
    <p>Please fill in this form to create an account.</p>
    <hr>
    
    <label for="Name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" pattern="[A-Z\sa-z]+" required>
    
    <label for="Userid"><b>User-Id</b><span style="color:red" id="s1"></span></label>
    <input type="text" placeholder="Enter User-Id" name="UserId" pattern="[A-Za-z0-9]+" onblur="load1(this.value)" required>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" pattern="^[A-Za-z][A-Za-z0-9_\.]*[@][A-Za-z\.]+" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw"  pattern="[A-Za-z0-9_\S\.@#%&!]{5,10}" name="psw" id="psw" onkeyup="passwordStrengthChecker();"required/>

    <label for="psw-repeat"><b>Conform Password</b></label>
    <input type="password" placeholder="Conform Password" name="psw-repeat" id="pswrepeat" onkeyup="checke();" required/>
    
    <label for="mobileNo"><b>Mobile-No</b></label>
    <input type="text" placeholder="Enter Mobile-No" pattern="[6-9]{1}[0-9]{9}" name="mobileno" required>
    
    <label for="Address"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="cusaddress" required>

    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="button" class="cancelbtn" onclick="return conform();">Cancel</button>
      <button type="submit" name="submit" class="signupbtn" onclick="return conform1();">Sign Up</button>
    </div>
  </div>
</form>
<script>

function conform() {
	if(confirm("do you want to cancle"))
		window.open("index9.html","_Self");
}
function conform1() {
	 	if(confirm("do you want to submit"))
	 		return true;
	 }


function load1(value) {
	 var x=value;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
     if (this.readyState == 4 && this.status == 200) {
        document.getElementById("s1").innerHTML = this.responseText;
       }
  };
  xhttp.open("GET", "data1.jsp?name="+x,true);
  xhttp.send();
}

 function checke(){
	 var gpassword = document.getElementById("psw").value;
	 var repassword =document.getElementById("pswrepeat").value;
	 if(gpassword!=repassword){
		 document.getElementById("pswrepeat").style.color="red";
		// psw.focus;
	 }
	 else{
		 document.getElementById("pswrepeat").style.color="green";
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
String sql = "Insert into customer (name,userid,email,psw,mobileno,cusaddress) values(?,?,?,?,?,?)";
PreparedStatement smt = con.prepareStatement(sql);
smt.setString(1, request.getParameter("name"));
smt.setString(2,request.getParameter("UserId"));
smt.setString(3, request.getParameter("email"));
smt.setString(4, request.getParameter("psw"));
smt.setString(5,request.getParameter("mobileno"));
smt.setString(6,request.getParameter("cusaddress"));
int n= smt.executeUpdate();
%>
<script type="text/javascript">alert("Registration Sucessfull");</script>
<%
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