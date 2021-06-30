
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String did = request.getParameter("did");
    String rid = request.getParameter("r_id");
    System.out.println(rid);
    String pid = request.getParameter("pid");
    String day = request.getParameter("day");
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
        String sql = "select id , day,p_count FROM records WHERE id ='" + did + "'";
        String sql2 = "select nic FROM patients WHERE nic ='" + pid + "'";
        resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>APPOINTMENT</title>

        <style>
            body {
                background-image: url("img/doc18.jpg");
                background-color: #cccccc;
            }
        </style>


        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/doc17.jpg">
                <h1>Get Your Appointment</h1>
                <form method="post" action="GetAppointment.jsp">
                    <table style="with: 50%">
                        <input type="hidden" name="id" value="<%=resultSet.getString("id")%>">
                        <input type="hidden" name="day" value="<%=resultSet.getString("day")%>">
                        <input type="hidden" name="rid" value="<%= rid %>">
                        <br>
                        <tr><td>NIC</td><td>
                                <input type="text" name="nic" required></td></tr>

                    </table>

                    <p><input type="submit" value="BOOK"></P>
                    <p>   <a href="index.html">Home</a></p>
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