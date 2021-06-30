<%-- 
    Document   : RecordsUpdate
    Created on : May 28, 2021, 8:55:32 PM
    Author     : kalpani
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String did = request.getParameter("did");
String rid = request.getParameter("r_id");
    System.out.println(rid);

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
        <title>YOUR RECORDS</title>


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
        <h1><center>Your Record Information</center></h1></br>
        <p><ul>  

            <li><a href="index.html">HOME</a></li></ul></p></br>
        <table class="timecard" border="5">
            <tr bgcolor="lightblue">
                <td>Rec_ID</td>
                <td>ID</td>
                <td>Day</td>
                <td>Time</td>
                <td>P_Count</td>
                <td>Update</td>
                <td>Delete</td>


            </tr>
            <%    try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "select * from RECORDS where id='" + did + "'";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr bgcolor="#EADDCA">
                <td><%=resultSet.getString("rec_id")%></td>
                <td><%=resultSet.getString("id")%></td>
                <td><%=resultSet.getString("day")%></td>
                <td><%=resultSet.getString("time")%></td>
                <td><%=resultSet.getString("p_count")%></td>
                <td><a href="RecordsUpdateForm.jsp?id=<%=resultSet.getString("id")%>">UPDATE YOUR RECORD</a></td>
                <td><a href="RecordsDeleteForm.jsp?day=<%=resultSet.getString("day")%>">DELETE YOUR RECORD</a></td>
            </tr>





<%
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>

</table>
</body>
</html>