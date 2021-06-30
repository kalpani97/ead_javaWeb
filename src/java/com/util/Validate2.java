/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Validate2 {
    
    public static boolean ValidateUser(String pnic,String ppassword)
    {   
        
        boolean bstate=false;
        try{
            //import (jdbc drive)
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            
            //creating connection string
            Connection con =DriverManager.getConnection("jdbc:derby://localhost:1527/eChan","app","app");
            
            //sql statement
            PreparedStatement ps = 
                    con.prepareStatement("select * from PATIENTS where nic=? and password= ?");
        
            ps.setString(1, pnic);
            ps.setString(2, ppassword);
            
            ResultSet rs = ps.executeQuery();
            bstate = rs.next();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bstate;
    }
    
}