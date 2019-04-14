<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>


<%!
Connection con =null; 
%>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minorproject","root","nitesh");
//System.out.println("ok");
}
catch(Exception e){
//System.out.println("Error : "+ e.getMessage());
JOptionPane.showMessageDialog(null, e.getMessage());
}
%>