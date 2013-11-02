/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class select {
    
    private static int count;
    private static  String name;
    
    public static int select_mould_count(){
        try {
            ResultSet rs=database.db_connect.data("select count(machine_id) from machine_status where status='on'");
       
            
            while(rs.next()){
            
            count=rs.getInt("count(machine_id)");
            
          

            }
    
        } catch (SQLException ex) {
            Logger.getLogger(select.class.getName()).log(Level.SEVERE, null, ex);
        }
   
    return count;
    
    }

   
    /**
     *
     */
   


}