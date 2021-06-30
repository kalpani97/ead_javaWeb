<%-- 
    Document   : RecordUpdateProcess
    Created on : May 28, 2021, 9:25:31 PM
    Author     : kalpani
--%>


<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%! String driverName = "org.apache.derby.jdbc.EmbeddedDriver";%>
<%!String url = "jdbc:derby://localhost:1527/eChan";%>
<%!String user = "app";%>
<%!String psw = "app";%>
<%
    String did = request.getParameter("did");
    String r = request.getParameter("rec_id");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String specialty = request.getParameter("specialty");
    String day = request.getParameter("day");
    String time = request.getParameter("time");
    String p_count = request.getParameter("p_count");
    if (id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        /*int id = Integer.parseInt(did);*/
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update RECORDS set id=?,name=?,specialty=?,day=?,time=?,p_count=? WHERE day='" + day + "'";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, specialty);
            ps.setString(4, day);
            ps.setString(5, time);
            ps.setString(6, p_count);
            

            int i = ps.executeUpdate();
            if (i > 0) {
                PrintWriter Out;
                Out = response.getWriter();

                Out.println("<h1><center>Record Updated Successfully</center></h1>");
            } else {
                out.println("<h1><center>There is a problem in updating your Record.</center></h1>");
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>