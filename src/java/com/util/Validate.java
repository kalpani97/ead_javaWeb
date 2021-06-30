
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Validate {
    
     public static boolean ValidateUser(String did,String dpassword)
    {   
        
        boolean bstate=false;
        try{
            //import (jdbc drive)
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            
            //creating connection string
            Connection con =DriverManager.getConnection("jdbc:derby://localhost:1527/eChan","app","app");
            
            //sql statement
            PreparedStatement ps = 
                    con.prepareStatement("select * from DOCTORS where id=? and password= ?");
        
            ps.setString(1, did);
            ps.setString(2, dpassword);
            
            ResultSet rs = ps.executeQuery();
            bstate = rs.next();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bstate;
    }
    
}
