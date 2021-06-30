<%-- 
    Document   : DRecordProcess2
    Created on : Jun 1, 2021, 10:59:13 AM
    Author     : kalpani
--%>

<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!String driverName = "org.apache.derby.jdbc.EmbeddedDriver";%>
<%!String url = "jdbc:derby://localhost:1527/eChan";%>
<%!String user = "app";%>
<%!String psw = "app";%>

<%
    String did = request.getParameter("did");
    String rec_id = request.getParameter("rec_id");

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
            Statement st = con.createStatement();

            String query = "SELECT count(*) from records where day='" +  day +"' and id='" +  id +"' ";

            ResultSet rs = st.executeQuery(query);
            rs.next();
            String Countrow=rs.getString(1);

            if (Countrow.equals("0")){
                String sql="insert into records (id,name,specialty,day,time,p_count) values (?,?,?,?,?,?)";
                ps=con.prepareStatement(sql);
               
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, specialty);
                ps.setString(4, day);
                ps.setString(5, time);
                ps.setString(6, p_count);
                
                int i=ps.executeUpdate();
                if(i>0){
                    PrintWriter Out;
                    Out=response.getWriter();
                    out.println("<center><h1>Record added Sucessfully!!</h1></center>");
                    
                }else{
                    out.println("There is a problem in adding Record");
                    
                }
            }else{
                out.println("<center><h1>A record is already exist for the same day</h1></center>");
                
                        
                        }
            
            
            
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>