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
	
<style>
.button {
	background-color: #f44336;
	color: white;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	float: right;
}

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
}
</style>
<title>Insert title here</title>

</head>
<body class="bg">
	<nav>
        <div>
         <button style="float:left;width:5%;margin:0 auto"><a href="Emplyee.jsp?flag=yes" onclick="return conform();" style="height:5px">&#9776;</a></button>
           
           </div>
       </nav>
	<%@include file="DBconnection.jsp"%>
	<%
		if (session.getAttribute("userid") == null) {
			session.invalidate();
			response.sendRedirect("login.jsp");
		}

		PreparedStatement smt = null;
		ResultSet rs = null;
		String post = "", sql = "";
		int i = 0;
		sql = "Select post from emp where empid='" + session.getAttribute("userid") + "'";
		smt = con.prepareStatement(sql);
		rs = smt.executeQuery();
		if (rs.next())
			post = rs.getString("post");
		if (post.equalsIgnoreCase("Manager")) {
			sql = "Select count(*) from foodorder where dilistatus='pending'";
			smt = con.prepareStatement(sql);
			rs = smt.executeQuery();
			if (rs.next())
				i = rs.getInt(1);
			if (i == 0)
				response.sendRedirect("Emplyee.jsp");
			else {
				sql = "Select * from foodorder where dilistatus='pending'";
				smt = con.prepareStatement(sql);
				rs = smt.executeQuery();
				out.println("<table BORDER='2' width='100%'>");
	%>
	<form method="post">
		<tr hight='200px'>
			<td><b>Order-Id</b></td>
			<td><b>User-Id</b></td>
			<td><b>Dilivery-Status</b></td>
			<td><b>Payment-Status</b></td>
			<td><b>Payment-Mode</b></td>
			<td><b>Futher-Action</b></td>
		</tr>
		<%
			while (rs.next()) {
						out.println("<tr hight='200px'><td>" + rs.getString("ordid") + "</td>");
						out.println("<td>" + rs.getString("userid") + "</td>");
						out.println("<td>" + rs.getString("dilistatus") + "</td>");
						out.println("<td>" + rs.getString("paymentstatus") + "</td>");
						out.println("<td>" + rs.getString("paymentmode") + "</td>");
						out.println("<td><a href='ViewDetails.jsp?userid=" + rs.getString("userid") + " &orderid="
								+ rs.getString("ordid") + "' class='button' >View-Details</a>  </td></tr>");
					}
				}
			} else {
				sql = "Select count(*) from foodorder where dilistatus='dispatched'";
				smt = con.prepareStatement(sql);
				rs = smt.executeQuery();
				if (rs.next())
					i = rs.getInt(1);
				if (i == 0)
					response.sendRedirect("Delivery.jsp");
				else {
					sql = "Select * from foodorder where dilistatus='dispatched'";
					smt = con.prepareStatement(sql);
					rs = smt.executeQuery();
					out.println("<table BORDER='2' width='100%'>");
		%>
		<form method="post">
			<tr hight='200px'>
				<td><b>Order-Id</b></td>
				<td><b>User-Id</b></td>
				<td><b>Dilivery-Status</b></td>
				<td><b>Payment-Status</b></td>
				<td><b>Payment-Mode</b></td>
				<td><b>Futher-Action</b></td>
			</tr>
			<%
				while (rs.next()) {
							out.println("<tr hight='200px'><td>" + rs.getString("ordid") + "</td>");
							out.println("<td>" + rs.getString("userid") + "</td>");
							out.println("<td>" + rs.getString("dilistatus") + "</td>");
							out.println("<td>" + rs.getString("paymentstatus") + "</td>");
							out.println("<td>" + rs.getString("paymentmode") + "</td>");
							out.println("<td><a href='Delivered.jsp?userid=" + rs.getString("userid") + " &orderid="
									+ rs.getString("ordid") + "' class='button' >View-Details</a>  </td></tr>");
						}
					}
				}
			%>
		</form>
</body>
</html>