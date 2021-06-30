<%-- 
    Document   : RecordsUpdateForm
    Created on : May 28, 2021, 9:17:16 PM
    Author     : kalpani
--%>


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
    String connectionUrl = "jdbc:derby://localhost:1527/eChan";
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
<%
    try {
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement = connection.createStatement();
        String sql = "select * FROM records WHERE id ='" + id + "'";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>RECORDS UPDATE FORM</title>

        <style>
            body {
                background-image: url("img/doc18.jpg");
                background-color: #cccccc;
            }
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src=https://code.jquery.com/jquery-1.12.4.js></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/doc2.png">
                <h1>Update Doctor Records</h1>
                <form method="post" action="RecordUpdateProcess.jsp">
                    <table style="with: 50%">
                        <input type="hidden" name="rec_id" value="<%=resultSet.getString("rec_id")%>">
                        <input type="hidden" name="id" value="<%=resultSet.getString("id")%>">
                        <input type="hidden" name="name" value="<%=resultSet.getString("name")%>">
                        <input type="hidden" name="specialty" value="<%=resultSet.getString("specialty")%>">
                        <input type="hidden" name="day" value="<%=resultSet.getString("day")%>">

                        <br>
                        

                        <tr><td>Time</td><td>
                                <select name="time"
                                        <option value="6.00AM-8.00AM">6.00AM-8.00AM</option>
                                    <option value="6.00AM-8.00AM">6.00AM-8.00AM</option>
                                    <option value="8.00AM - 10.00AM">8.00AM - 10.00AM</option>
                                    <option value="10.00AM-12PM">10.00AM-12PM</option>
                                    <option value="1.00PM-3.00PM">1.00PM-3.00PM</option>
                                    <option value="3.00PM-5.00PM">3.00PM-5.00PM</option>

                                </select></td></tr>

                        <tr><td>Patient Count</td><td>
                                <input type="text" name="p_count"></td></tr></table>

                    <p><input type="submit" value="UPDATE"></P>
                    <p>   <a href="DUpdateIndex.jsp?uname=<%=resultSet.getString("id")%>">Your Profile</a></p>
                </form>
            </div>    
        </div>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>