

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String pid = request.getParameter("uname");
    String did = request.getParameter("uname");
    String driver = "org.apache.derby.jdbc.EmbeddedDriver";
    String connectionUrl = "jdbc:derby://localhost:1527/";
    String database = "eChan";
    String userid = "app";
    String password = "app";

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

%>
<html>
        <head>
        <title>PATIENT PROFILE</title>


        <style>
            body {
                background-image: url("img/doc18.jpg");
                background-color: #cccccc;
            }
        </style>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
    <h1><center>Patient Profile</center></h1></br>
        <table class="timecard" border="5" width=800px>
            <tr>
                <td>NIC</td>
                <td>Name</td>
                <td>Password</td>
                <td>Phone</td>
                
            </tr>
            <%    try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "select * from PATIENTS where nic='" + pid + "'";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr bgcolor="#EADDCA">
                <td><%=resultSet.getString("nic")%></td>
                <td><%=resultSet.getString("name")%></td>
                <td><%=resultSet.getString("password")%></td>
                <td><%=resultSet.getString("phone")%></td>
                
            </tr></table></br><p>
 <ul><LI>   <a href="CheckDoc2.jsp?pid=<%=resultSet.getString("nic")%>">GET YOUR APPOINTMENT</a></li>
     <li> <a href="PUpdate.jsp?pid=<%=resultSet.getString("nic")%>">CHANGE YOUR INFORMATION</a></li>
            <li><a href="index.html">HOME</a></li> </li></UL></p>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>