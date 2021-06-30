<%-- 
    Document   : search
    Created on : Jun 1, 2021, 6:37:20 PM
    Author     : kalpani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String did = request.getParameter("id");
    String day = request.getParameter("day");
    String id = request.getParameter("id");
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
    ResultSet resultSet1 = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>CHECK DOC</title>


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
    <center><h1><center>Schedules for the searched date</center></h1></br></center>
    <p><ul>  

        <li><a href="index.html">HOME</a></li></ul></p></br>
<table class="timecard" border="5" width="800">
    <tr bgcolor="lightblue">
        <td>Rec_ID</td>
        <td>Date</td>
        <td>NIC</td>


    <tr bgcolor="#EADDCA">
        <%    try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "select * from records where day='" + day + "'  and id='" + id + "' ";
                resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
                    String sql1 = "select * from schedules where id= '" + resultSet.getInt("rec_id") + "'";
                    resultSet1 = statement.executeQuery(sql1);
                    while (resultSet1.next()) {
        %>


    <tr bgcolor="#DEB887">
        <td><%=resultSet1.getString("id")%></td>
        <td><%=resultSet1.getString("day")%></td>
        <td><%=resultSet1.getString("nic")%></td>
    </tr>

    <%
                }
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>