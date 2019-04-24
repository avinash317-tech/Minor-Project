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

<title>login</title>
<style>
          body, html {
  height: 100%;
}

.bg { 
  /* The image used */
  background-image: url("img/4.jpg");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
</style>
<title>Insert title here</title>

</head>
<body class="bg">
<%@include file="DBconnection.jsp" %>
<%if(session.getAttribute("userid")!=null){
	session.invalidate();
	response.sendRedirect("index9.html");
}
%>
<nav>
        <div>
         <button style="float:left;width:5%;margin:0 auto"><a href="index9.html" style="height:5px">&#9776;</a></button>
           
           </div>
       </nav>
<br><br><br><br>
<form style="border:1px solid #ccc; width:50%;margin:0 auto;" method="post">
  <div class="container" id="signup">
  <center><h1 style="color:red";><b>Log-In</b></h1></center>
     <div class="clearfix">
     <label>
     <input type="radio" checked="checked" value="emp" name="emp" id="emp" style="color:blue;">Login as Employee
     </label>
     
     <label>
     <input type="radio"  name="emp" value="customer" id="cust" style="align:left; color:blue"> Login as Customer
     </label>
     
      <a href="index9.html" style="float:right; color:black"><b>SIGN-UP</b></a>
    </div>
     <hr>
     
    <label for="email"><b>UserId</b></label>
    <input type="text" placeholder="Enter UserId" name="userid" required><br><br>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required><br><br>


    <label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px;color:red"> Remember me
    </label>

    
    <div class="clearfix">
      <button type="button"  class="cancelbtn">Cancel</button>
      <button type="submit" name="submit" class="signupbtn">log-in</button>
    </div>
  </div>
</form>
 <%
try{
if(request.getParameter("submit")!=null){
String log=request.getParameter("emp");
if(log.equalsIgnoreCase("emp")){
	String user=request.getParameter("userid");
	String pwd=request.getParameter("psw"); 
String sql = "Select empid,psw from emp where empid=? and psw=?";
PreparedStatement smt = con.prepareStatement(sql);
smt.setString(1,user);
smt.setString(2, pwd);
ResultSet rs = smt.executeQuery();
if(rs.next())
{
	String user1=rs.getString("empid");
	String pwd1=rs.getString("psw");
	if(user.equals(user1)&& pwd.equals(pwd1)){
		session.setAttribute("userid", user1);

    sql="Select post from emp where empid='"+user1+"'";
    smt=con.prepareStatement(sql);
    rs=smt.executeQuery();
    if(rs.next()){
    if(rs.getString("post").equalsIgnoreCase("Delivary-staff")){
    	response.sendRedirect("Delivery.jsp");
    }
    else
	response.sendRedirect("Emplyee.jsp");
    }
}
}
}

else if(log.equalsIgnoreCase("customer")){
String sql = "Select userid,psw from customer where userid=? and psw=?";
PreparedStatement smt = con.prepareStatement(sql);
String user=request.getParameter("userid");
String pwd=request.getParameter("psw");
smt.setString(1, user);
smt.setString(2, pwd);
ResultSet rs = smt.executeQuery();
if(rs.next()){
	String user1=rs.getString("userid");
	String pwd1=rs.getString("psw");
	if(user.equals(user1)&& pwd.equals(pwd1)){
	session.setAttribute("userid",user);

	 	 response.sendRedirect("Home.jsp");
		
	 
}

}
else 
	out.println("<script>alert('choose correct Option for login');</Script>");
con.close();
}
}

}catch(Exception e){out.println("<script>alert('error!'"+e.getMessage()+");</Script>");}
%>  
</body>
</html>