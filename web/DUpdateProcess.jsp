<%-- 
    Document   : DUpdateProcess
    Created on : May 27, 2021, 3:35:03 PM
    Author     : kalpani
--%>

<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%! String driverName = "org.apache.derby.jdbc.EmbeddedDriver";%>
<%!String url = "jdbc:derby://localhost:1527/eChan";%>
<%!String user = "app";%>
<%!String psw = "app";%>
<%
String did = request.getParameter("did");
String id = request.getParameter("id");
String name=request.getParameter("name");
String password=request.getParameter("password");
String phone=request.getParameter("phone");
String specialty=request.getParameter("specialty");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
/*int id = Integer.parseInt(did);*/
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update DOCTORS set id=?,name=?,password=?,phone=? ,specialty=? WHERE id='" + id + "'";
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, name);
ps.setString(3, password);
ps.setString(4, phone);
ps.setString(5, specialty);

int i = ps.executeUpdate();
if(i > 0)
{
     PrintWriter Out;
         Out = response.getWriter();

         Out.println("<h1><center>Your Information changed Successfully, GO back to add or update Records</center></h1>");
}
else
{
 out.println("There is a problem in changing your information.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>