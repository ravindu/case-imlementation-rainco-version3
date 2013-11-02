/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;




public class number_of_hours {
    
    
   
    
 
    public static void main(String[] args) {
        try {
            ResultSet rs=database.db_connect.data("select time,machine_id from start_time");
          
            while(rs.next()){
            
                String time=rs.getString("time");
                
                number_of_hours hour=new number_of_hours();
                
               // System.out.println(hour.time(time));
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(number_of_hours.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    
    }
    
    
   public static String get(){
   String next=null;   
    
    Date d1 = null;
    Date d2 = null;
    String start_time;
    
    Calendar cal = Calendar.getInstance();
    cal.getTime();
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");         
    String now_time=sdf.format(cal.getTime()); 
        
    try {
            d1 = sdf.parse(now_time);
            
            
            
           ResultSet rs1;
        try {
            rs1 = database.db_connect.data("select time from start_time");
       
        
                
                while(rs1.next()){
                
                   start_time=rs1.getString("time");
                   d2=sdf.parse(start_time);
    
                } 
            
            
            long diff =d1.getTime()- d2.getTime();
            
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
			
            next=(diffHours+"."+diffMinutes);	
           
            
            
            
          } catch (SQLException ex) {
            Logger.getLogger(number_of_hours.class.getName()).log(Level.SEVERE, null, ex);
        }   
            
            
            
        } catch (ParseException ex) {
            Logger.getLogger(number_of_hours.class.getName()).log(Level.SEVERE, null, ex);
        }
   
    
    
    
    
    return next;
    }
    
    
    
    
    
    public String get_time(){
    
    String sum="";
   
    Date d1 = null;
    Date d2 = null;
    String start_time;
    
    Calendar cal = Calendar.getInstance();
    cal.getTime();
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");         
    String now_time=sdf.format(cal.getTime()); 
        try {
            d1 = sdf.parse(now_time);
        try {        
        
            ResultSet rs=database.db_connect.data("select time,machine_id from start_time");
       
        
            while(rs.next()){
       
                start_time=rs.getString("time");
                d2=sdf.parse(start_time);
        
                
                
                long diff =d1.getTime()- d2.getTime();
            
                long diffMinutes = diff / (60 * 1000) % 60;
                long diffHours = diff / (60 * 60 * 1000) % 24;
                
                sum=diffHours+"."+diffMinutes;
		
                //next.add(new number_of_hours(sum, rs.getString("machine_id")));
                
                 
        
            }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(number_of_hours.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        } catch (ParseException ex) {
            Logger.getLogger(number_of_hours.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return sum;
    
    
    }
    
    
    
    
    public String time(String time){
      
    String sum="";
   
    Date d1 = null;
    Date d2 = null;
    String start_time;
    String next=null;
    
    Calendar cal = Calendar.getInstance();
    cal.getTime();
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");         
    String now_time=sdf.format(cal.getTime()); 
        try {
           
            d1 = sdf.parse(now_time);
        
            d2=sdf.parse(time);
        
        
            
             long diff =d1.getTime()- d2.getTime();
            
             long diffMinutes = diff / (60 * 1000) % 60;
             long diffHours = diff / (60 * 60 * 1000) % 24;
			
            next=(diffHours+"."+diffMinutes);	
           
        
        } catch (ParseException ex) {
            Logger.getLogger(number_of_hours.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
    
    
      return next;
    }  

    
    
    
}




