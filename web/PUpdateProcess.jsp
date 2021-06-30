

<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%! String driverName = "org.apache.derby.jdbc.EmbeddedDriver";%>
<%!String url = "jdbc:derby://localhost:1527/eChan";%>
<%!String user = "app";%>
<%!String psw = "app";%>
<%
String pid = request.getParameter("pid");
String nic = request.getParameter("nic");
String name=request.getParameter("name");
String password=request.getParameter("password");
String phone=request.getParameter("phone");

if(nic != null)
{
Connection con = null;
PreparedStatement ps = null;
/*int nic = Integer.parseInt(pid);*/
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update PATIENTS set nic=?,name=?,password=?,phone=? WHERE nic='" + nic + "'";
ps = con.prepareStatement(sql);
ps.setString(1,nic);
ps.setString(2, name);
ps.setString(3, password);
ps.setString(4, phone);

int i = ps.executeUpdate();
if(i > 0)
{
     PrintWriter Out;
         Out = response.getWriter();

         Out.println("<h1><center>Your Information changed Successfully, GO back to get your appointment</center></h1>");
}
else
{
 out.println("There is a problem in changing your Information.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>