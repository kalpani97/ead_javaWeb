/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chaminda
 */
public class PatReg1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PatReg1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PatReg1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        
        String nic = request.getParameter("nic");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/eChan","app","app");
           
            
            String query = "SELECT nic FROM patients";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            
            boolean loopResult = false;
            
            while (resultSet.next()) {

                if (nic.equals(resultSet.getString("nic")) ) {
                    loopResult = true;
                    break;
                    
                     } else {
                    loopResult = false;

                }
            }

            if (loopResult) {
                response.setContentType("text/HTML");
                RequestDispatcher rs = request.getRequestDispatcher("PReg.html");
                out.print("A patient already exists with the same NIC , Check again!");
                rs.forward(request,response);

            }else{

            String sql = "INSERT INTO patients(nic,name,password,phone) VALUES (?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, nic);
            st.setString(2, name);
            st.setString(3, password);
            st.setString(4, phone);

            int i = st.executeUpdate();

            if (i != 0) {
                out.println("signup successful");
                RequestDispatcher rs = request.getRequestDispatcher("PLog.jsp");
                rs.forward(request, response);
            } else {
                out.println("error in signup");
                RequestDispatcher rs = request.getRequestDispatcher("PReg.html");
                rs.include(request, response);
            }
            }
            
        } catch (ClassNotFoundException e) {
                out.print(e);
        } catch (SQLException ex) {
            Logger.getLogger(PatReg1.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
