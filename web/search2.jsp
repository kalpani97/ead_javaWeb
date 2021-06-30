<%-- 
    Document   : search2
    Created on : Jun 2, 2021, 2:28:08 PM
    Author     : kalpani
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String did = request.getParameter("did");
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
        <h1><center>Schedules</center></h1></br>

        <p><ul>  

            <li><a href="index.html">HOME</a></li></ul></p></br>
    <table class="timecard" border="5" width=800px;>
        <tr bgcolor="lightblue">
            <td>Rec_ID</td>
            <td>Doctor Name</td>
            <td>Specialty</td>
            <td>Date</td>
            <td>Time</td>
            <td>No of Patients</td>
            <td>Action</td>

        </tr>
        <%    try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "select * from records where specialty='" + specialty + "' ";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <tr bgcolor="#EADDCA">
            <td><%=resultSet.getString("rec_id")%></td>
            <td><%=resultSet.getString("name")%></td>
            <td><%=resultSet.getString("specialty")%></td>
            <td><%=resultSet.getString("day")%></td>
            <td><%=resultSet.getString("time")%></td>
            <td><%=resultSet.getString("p_count")%></td>
            <td><a href="GetAppointmentProcess.jsp?did=<%=resultSet.getString("id")%>&r_id=<%=resultSet.getString("rec_id")%> ">BOOK</a></td>

        </tr>


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