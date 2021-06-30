

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Validate3 {
    
    public static boolean ValidateUser(String nic,String name)
    {   
        
        boolean bstate=false;
        try{
            //import (jdbc drive)
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            
            //creating connection string
            Connection con =DriverManager.getConnection("jdbc:derby://localhost:1527/eChan","app","app");
            
            //sql statement
            PreparedStatement ps = 
                    con.prepareStatement("select * from PATIENTS where nic=? and name= ?");
        
            ps.setString(1, nic);
            ps.setString(2, name);
            
            ResultSet rs = ps.executeQuery();
            bstate = rs.next();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bstate;
    }
    
}
