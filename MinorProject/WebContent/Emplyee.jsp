<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <link rel=stylesheet type="text/css" href= "vendors/css/normalize.v3.0.1.min.css%20%C2%B7%20GitHub.html">
      <link rel=stylesheet type="text/css" href="vendors/css/grid/038%20Grid.css">
      <link rel=stylesheet type="text/css" href="vendors/css/ionicons.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,300italic" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                                        <title>Omnifood</title>
  <%@include file="DBconnection.jsp" %>
  <%
  String sql="Select count(*) from foodorder where dilistatus='pending'";
	PreparedStatement smt=con.prepareStatement(sql);
	ResultSet rs=smt.executeQuery();
	if(rs.next())
	%>    
	<style type="text/css">
	.dot {
  height: 20px;
  width: 20px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  color : red;
}
	</style>
</head>

<body>
<%if(session.getAttribute("userid")==null){
	session.invalidate();
	response.sendRedirect("login.jsp");
} %>

   <header>
       <nav>
      
        <div >
            <div style="height:500px">
             <button style="float:left;width:5%;">&#9776;</button>
                <img src="img/logo-white.png" alt="omnifood logo" class="logo">
           <ul class="main-nav" style="margin-top:5px";>
                 <%String userid=(String)session.getAttribute("userid");%> 
               <li><a href="foodMenu.jsp">Add Food</a></li> 
               <li><a href="ViewOrder.jsp">View Order</a><span class="dot" style="text-align: center;" ><sup><%= rs.getInt(1) %></sup></span><li>
               <li><a href="logout.jsp">LogOut</a></li>  
               <li> <%out.println(""+userid+"");%> &#x1F31D</li>        
                  
                  </ul>
            </div>
           
           </div>
       </nav>
    <div class="hero-text-box">
       <h1>Goodbye junk food.<br>Hello super healthy meals</h1>
        <a class="btn btn-full" href="ViewOrder.jsp">Ready For Order</a>
        <a class="btn btn-ghost" href="Menu.jsp" style="color:#fff";>show me Menu</a>
                  
       </div>
    
   </header> 
    
   <Section class="section-features">
    <div class="row">
    <h2>Get Food Fast&mdash;not fast food</h2>
     <p class="long-copy">
       
Hello, weâ€™re Omnifood, your new premium food delivery service.Â We know youâ€™re always busy. No time for cooking. So let us take care of that, weâ€™re really good at it, we promise!
       
     </p>  
       
       </div>
       
       <div class="row">
       <div class="col span-1-of-4">
           <i class="ion-calendar"></i>
       <h3>Up to 365 days/year</h3>
         <p>Never cook again! We really mean that. Our subscription plans include up to 365 days/year coverage. You can also choose to order more flexibly if that's your style.</p>
           </div>
         <div class="col span-1-of-4">
           <i class="ion-clock"></i>  
       <h3>Ready in 20 minutes</h3>   
       <p>You're only twenty minutes away from your delicious and super healthy meals delivered right to your home. We work with the best chefs in each town to ensure that you're 100% happy.</p>   
       </div>
           
         <div class="col span-1-of-4">  
             <i class="ion-checkmark-round"></i>
       <h3>100% organic</h3>   
       <p>no worries.We provide 100% organic food and that is our 100% gaurantee.</p>   
       </div>
              
           
           <div class="col span-1-of-4"> 
               <i class="ion-compose"></i>
       <h3>Order anything</h3>   
       <p>we dont limit your creativity.which means you can order anything and anytime you want to order.</p>   
       </div>
                     
       </div>
       
    </Section>

   <section class="section-meal">
    
    <ul class="meals-showcase">
       
      <li>
        <figure class="meal-photo">
          
          <img src="img/1.jpg" alt="pp">
          
      </figure>
        
    </li> 
     
         <li>
        <figure class="meal-photo">
          
          <img src="img/2.jpg" alt="pizza">
          
      </figure>
        
    </li> 
     
         <li>
        <figure class="meal-photo">
          
          <img src="img/3.jpg" alt="chicken">
          
      </figure>
        
    </li> 
     
         <li>
        <figure class="meal-photo">
          
          <img src="img/4.jpg" alt="soup">
          
      </figure>
        
    </li> 
     
        
        <li>
        <figure class="meal-photo">
          
          <img src="img/5.jpg" alt="chicken">
          
      </figure>
        
    </li> 
     
          <li>
        <figure class="meal-photo">
          
          <img src="img/6.jpg" alt="wrap">
          
      </figure>
        
    </li> 
          <li>
        <figure class="meal-photo">
          
          <img src="img/7.jpg" alt="burger">
          
      </figure>
        
    </li> 
          <li>
        <figure class="meal-photo">
          
          <img src="img/8.jpg" alt="oats">
          
      </figure>
        
    </li> 
        
       </ul>  
    
    </section>    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>