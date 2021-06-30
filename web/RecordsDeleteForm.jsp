<%-- 
    Document   : RecordsDeleteForm
    Created on : May 30, 2021, 12:32:14 PM
    Author     : kalpani
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String did = request.getParameter("did");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String specialty = request.getParameter("specialty");
    String day = request.getParameter("day");
    String time = request.getParameter("time");
    String p_count = request.getParameter("p_count");
try
{
Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/eChan", "app", "app");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM records WHERE day='" + day + "'");
out.println("<center><h1>Record Deleted Successfully!<h1></center>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>