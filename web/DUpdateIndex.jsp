
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String did = request.getParameter("uname");
    String rec_id = request.getParameter("rec_id");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String specialty = request.getParameter("specialty");
    String day = request.getParameter("day");
    String time = request.getParameter("time");
    String p_count = request.getParameter("p_count");
    
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
        <title>DOCTOR PROFILE</title>


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
        <h1><center>Doctor Profile</center></h1></br>
        <table class="timecard" border="5" width=800px>
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Password</td>
                <td>Phone</td>
                <td>Specialty</td>


            </tr>
            <%    try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "select * from DOCTORS where id='" + did + "'";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr bgcolor="#EADDCA">
                <td><%=resultSet.getString("id")%></td>
                <td><%=resultSet.getString("name")%></td>
                <td><%=resultSet.getString("password")%></td>
                <td><%=resultSet.getString("phone")%></td>
                <td><%=resultSet.getString("specialty")%></td>

            </tr></table></br>
        <p>
        <ul>

            <li><a href="DAddRecords.jsp?did=<%=resultSet.getString("id")%> ">ADD YOUR RECORD</a></li>
            <LI>   <a href="RecordsUpdate.jsp?did=<%=resultSet.getString("id")%>">UPDATE YOUR RECORD</a></li>
            <li><a href="RecordsUpdate.jsp?did=<%=resultSet.getString("id")%>">DELETE YOUR RECORD</a></li1>
            <LI>   <a href="CheckDoc1.jsp?did=<%=resultSet.getString("id")%>">SEE YOUR SCHEDULES</a></li>
            <LI>   <a href="DUpdate.jsp?did=<%=resultSet.getString("id")%>">CHANGE YOUR INFORMATION</a></li>
            <li><a href="index.html">HOME</a></li></UL></p>





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