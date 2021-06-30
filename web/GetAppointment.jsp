<%-- 
    Document   : GetAppointment
    Created on : May 30, 2021, 12:44:25 PM
    Author     : kalpani
--%>
<%@page import="com.util.Validate3"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Booking</title>
    </head>
    <body>
        <%

            try {

                int updateCount;

                String url = "jdbc:derby://localhost:1527/eChan";

                String uname = "app";
                String pass = "app";

                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                Connection con = DriverManager.getConnection(url, uname, pass);

                String did = request.getParameter("did");
                String pid = request.getParameter("pid");
                String rid = request.getParameter("rid");

                String id = request.getParameter("id");
                String nic = request.getParameter("nic");
                String day = request.getParameter("day");

                String querynew = "SELECT * from records where rec_id=" + rid;
                Statement statementnew = con.createStatement();
                ResultSet resultSetnew = statementnew.executeQuery(querynew);

                
                if (resultSetnew.next()) {

                    updateCount = resultSetnew.getInt("p_count");
                    //System.out.println(updateCount);

                    if (updateCount > 0) {
                        querynew = "UPDATE records SET p_count=? WHERE rec_id=?";
                        PreparedStatement stnew = con.prepareStatement(querynew);
                        stnew.setInt(1, updateCount - 1);
                        stnew.setString(2, rid);
                        stnew.executeUpdate();

                        String query3n = "INSERT INTO schedules VALUES (?,?,?)";
                        PreparedStatement stn = con.prepareStatement(query3n);

                        stn.setString(1, rid);
                        stn.setString(2, day);
                        stn.setString(3, nic);
                        stn.executeUpdate();
                        out.println("<center><h3>booked successfully!</h3></center>");

                    } else {
                        out.print("<center><h3>booking full!</h3></center>");
                    }

                    

                }

            } catch (Exception e) {
                out.print(e);
                e.printStackTrace();

            }


        %>