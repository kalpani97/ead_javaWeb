
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String did = request.getParameter("did");
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
        String sql = "select * FROM DOCTORS WHERE id ='" + did + "'";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>CHANGE DOCTOR INFORMATION</title>

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
                <img class="avatar" src="img/doc2.png">
                <h1>Change Doctor Information</h1>
                <form method="post" action="DUpdateProcess.jsp">
                    <table style="with: 50%">
                        <input type="hidden" name="id" value="<%=resultSet.getString("id")%>">

                        <br>
                        <tr><td>Name</td><td>
                                <input type="text" name="name" value="<%=resultSet.getString("name")%>"></td></tr>

                        <tr><td>Password</td><td>
                                <input type="text" name="password" value="<%=resultSet.getString("password")%>"></td></tr>

                        <tr><td>Phone</td><td>
                                <input type="text" name="phone" value="<%=resultSet.getString("phone")%>"></td></tr>

                    <tr><td>Specialty</td><td>
                            <select name="specialty"
                                    <option value="<%=resultSet.getString("specialty")%>"><%=resultSet.getString("specialty")%></option>
                                <option value="ENT">ENT</option>
                                <option value="GENERAL">GENARAL</option>
                                <option value="PEDS">PEDS</option>
                                <option value="CARDIO">CARDIO</option>
                                <option value="NEURO">NEURO</option>
                                <option value="ORTHO">ORTHO</option>
                            </select>
</td></tr></table>

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