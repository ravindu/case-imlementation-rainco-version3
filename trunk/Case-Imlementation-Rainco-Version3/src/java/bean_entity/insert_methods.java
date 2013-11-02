/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlet_entity.my_temp_1;


/**
 *
 * @author HP
 */
public class insert_methods {
    
    private static int sum_hour=0;
    private  static int sum_summary=0;
    private  static  int total_order=0;
    private static int total_quantity=0;
    
   
    
    

    public static void insert_production(float time,String employee, String mould, String machine, String dye, float quantity) {
       
        float items=0;
        int total_items=0;
        
        try {
            
            
            ResultSet rs=database.db_connect.data("select items_per_kg from mould where mould_code='"+mould+"'");
            
            while(rs.next()){
            items= rs.getFloat("items_per_kg");
            
            } 
            
            total_items=(int)(items*quantity);
            
            int insert=database.db_connect.getData("insert into moulding_hourly_production (time,employee_id,machine_id,mould_code,dye_code,quantity)value('"+time+"', '"+employee+"','"+machine+"','"+mould+"','"+dye+"',"+quantity+")");
       
           
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
    }

    public static void insert_performance(String machine, String mould, String employee_id) {
        try {       
            
            //delete wena ekath en oni
          int performance=database.db_connect.getData("insert into on_status_machines(machine_id,mould_code,employee_id)values('"+machine+"','"+mould+"','"+employee_id+"')");
      
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            
        
        
        
        
        
    }

    public static void insert_time(String machine, String now_time) {
        try {
          //  int update=database.db_connect.getData("update start_time set time='"+now_time+"' where machine_id='"+machine+"'");
            
            int insert=database.db_connect.getData("insert into start_time(machine_id,time) values('"+machine+"','"+now_time+"')");
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    public static int calculate_total(String mould) {
        try {
            
            
            
                         ResultSet rs6=database.db_connect.data("select sum(quantity) from moulding_hourly_production where mould_code='"+mould+"' ");
                         
                         while(rs6.next()){
                         
                             sum_hour=rs6.getInt("sum(quantity)");
                         
                           
                         }
                         
                         
                         
                         ResultSet rs7=database.db_connect.data("select sum(quantity) from moulding_daily_production_summary where mould_code='"+mould+"'");
                         
                         
                         while(rs7.next()){
                         
                             sum_summary=rs7.getInt("sum(quantity)");
                           //  out.println(sum_summary);
                         }
            
                         total_quantity=sum_hour+sum_summary;
                         
                         
                        
                         
            
           
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
      return total_quantity;
               
        
        
    }

    public static float target(String machine, String mould, String employee) {
        float rate=(float) 0.00;
       
        float target=0;
        float to_be_produced=0;
        float completed_time=0;
        
        try {
            
              
            
            
            ResultSet rs=database.db_connect.data("select sum(quantity), sum(time) from moulding_hourly_production where machine_id='"+machine+"' and mould_code='"+mould+"' and employee_id='"+employee+"'");
            
          
            
            while(rs.next()){
            
            float produced_quantity=rs.getFloat("sum(quantity)");
            completed_time=rs.getFloat("sum(time)");
            
           // rate=produced_quantity/completed_time;
             
            }
           
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
       return completed_time; 
      
    }

    
    
 public static float produced(String machine, String mould, String employee) {
        float rate=(float) 0.00;
       
        float target=0;
        float to_be_produced=0;
        float completed_time=0;
        float produced_quantity=0;
        try {
            
              
            
            
            ResultSet rs=database.db_connect.data("select sum(quantity), sum(time) from moulding_hourly_production where machine_id='"+machine+"' and mould_code='"+mould+"' and employee_id='"+employee+"'");
            
          
            
            while(rs.next()){
            
            produced_quantity=rs.getFloat("sum(quantity)");
            completed_time=rs.getFloat("sum(time)");
            
           // rate=produced_quantity/completed_time;
             
            }
           
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
       return produced_quantity; 
      
    }   

   

    public static float items(String mould,float quantity) {
       
        float items=0;
        float total_items=0;
        try {
            ResultSet rs=database.db_connect.data("select items_per_kg from mould where mould_code='"+mould+"'");
             
             while(rs.next()){
             items= rs.getFloat("items_per_kg");
             
             } 
             
            total_items=(int)(items*quantity);
       
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
       return total_items; 
        
        
    }

    public static void daily_summary(Float difference, String emp, String machine, String mould, String dye, float tot) {
             int count=0;
            float total=0;
            float total_quantity=0;
        
        
        try {
            
//            
           ResultSet rs=database.db_connect.data("select count(*),quantity from moulding_daily_production_summary where mould_code ='"+mould+"' and dye_code='"+dye+"'");
//       
           while(rs.next()){
            
               count=rs.getInt("count(*)");
               total=rs.getFloat("quantity");
            
               
               
            }
        
//          
              if(count>0){
                total_quantity=tot+total;
//                
                 int update=database.db_connect.getData("update moulding_daily_production_summary set quantity='"+total_quantity+"' where mould_code='"+mould+"'and dye_code='"+dye+"'");
//            
//            
            }
              
            else {
            
            int insert=database.db_connect.getData("insert into moulding_daily_production_summary(mould_code,dye_code,quantity) values('"+mould+"','"+dye+"',"+tot+")");
            
            }
          
//            
          
//        
//        
           
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
    
    }

    public static void daily_employee_summary(Float difference, String emp, String machine, String mould, String dye, float tot) {
        int count=0;
        float hours=0;
        float quantity=0;
        float total=0;
        float tot_hours=0;
        
        try {
            
            
            ResultSet rs=database.db_connect.data("select count(*),quantity, number_of_hours from moulding_daily_employee_summary where employee_id='"+emp+"' and mould_code='"+mould+"'");
            
            while(rs.next()){
            
            count=rs.getInt("count(*)");
            quantity=rs.getFloat("quantity");
            hours=rs.getFloat("number_of_hours");
            
            
            }
        
            if(count>0){
          
            total=quantity+tot;
            tot_hours=hours+difference;
                
             int update=database.db_connect.getData("update moulding_daily_employee_summary set quantity='"+total+"',number_of_hours='"+tot_hours+"' where mould_code='"+mould+"'and employee_id='"+emp+"'");
            
            }
            
            else{
        
            int insert=database.db_connect.getData("insert into moulding_daily_employee_summary(employee_id,mould_code,quantity,number_of_hours)values('"+emp+"','"+mould+"',"+tot+","+difference+")");
                    
        
        }
            
            
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public static String employee_name(String employee_id) {
        String employee="";
        
        try {
           
           ResultSet rs=database.db_connect.data("select employee_name from employee where employee_id='"+employee_id+"'");
            
           while(rs.next()){
           
              employee=rs.getString("employee_name");
           
           
           }   
      
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
           return employee;
    }

    public static int percentage(int qty, String mould_code) {
        int quantity=0;
        
        try {
            ResultSet rs=database.db_connect.data("select sum(quantity) from total_order where mould_code='"+mould_code+"'");
            
            while(rs.next()){
            
                quantity=rs.getInt("sum(quantity)");
            
            }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return quantity;
        
    }

    public static void add_request(String umbrella, String branch, int quantity) {
        try {
            
            ResultSet rs=database.db_connect.data("select branch_id from branch where branch_name='"+branch+"'");
            
            while(rs.next()){
            
            int branch_id=rs.getInt("branch_id");
                
            int add=database.db_connect.getData("insert into additional_request(order_date,umbrella_code,branch_id,quantity) values(current_date,'"+umbrella+"','"+branch_id+"',"+quantity+")");
        } 
        } 
        catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }

    public static int get_buffer_quantity(String umbrella) {
     int quantity=0;
        
        try {
            ResultSet rs=database.db_connect.data("select remaining_quantity from buffer_level where buffer_id='"+umbrella+"'");
            
            while(rs.next()){
            
                quantity=rs.getInt("remaining_quantity");
                
            
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
      return quantity;
        
    }

    public static String branch_email(int branch_id) {
      
        String branch="";
        try {
            ResultSet rs=database.db_connect.data("select email from branch where branch_id="+branch_id+"");
            
            while(rs.next()){
            
                branch=rs.getString("email");
            
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       return branch; 
        
    }

    public static void set_buffer(String mould, String dye, float tot) {
    
        
        int sum=0;
        int total=0;
        
        try {
           ResultSet rs=database.db_connect.data("select buffer.quantity from buffer where buffer.buffer_id='"+mould+"' and dye_code='"+dye+"'");
        
            
           while(rs.next()){
           
           
               total=rs.getInt("buffer.quantity");
               sum=(int) (total+tot);
           
               
               int insert=database.db_connect.getData("update buffer set buffer.quantity = "+sum+" where buffer_id='"+mould+"' and dye_code='"+dye+"'");
           }
        
        
        
        
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
    }

    public static int count(String machine) {
       int count=0;
        try {
            
            
            ResultSet rs=database.db_connect.data("select count(machine_id) from on_status_machines where machine_id='"+machine+"'");
      
            while (rs.next()){
            
                count=rs.getInt("count(machine_id)");
            
            }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
     return count;   
        
    }

  

  
    public  String show_branch(int branch_id) {
      
       String branch="";

        try {
         
             
            ResultSet rs=database.db_connect.data("select branch_name from branch where branch_id="+branch_id+"");
            
            while(rs.next()){
            branch=rs.getString("branch_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return branch;
        
      
    }

    
    
    
    
    public String id(String employee) {
         String employee_name="";
        try {
            ResultSet rs=database.db_connect.data("select employee_name from employee where employee_id='"+employee+"'");
            
            
            while(rs.next()){
            
            employee_name=rs.getString("employee_name");
            
            } 
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
        return employee_name;
       
        
    }
    
    
    
    
    public  float to_be(String machine, String mould, String employee) {
      
          float target=0;
          float should_produce=0;
          float additional=0;
          float next_hours=0;
          float time=8;
          float completed_time=0;
          float x=0;
            float produced_quantity = 0;
            float final_answer=0;
          
          
        try {       
    
          
            
            ResultSet rs=database.db_connect.data("select sum(quantity),sum(time) from moulding_hourly_production where machine_id='"+machine+"' and mould_code='"+mould+"' and employee_id='"+employee+"'");
            
          
            
            while(rs.next()){
            
             produced_quantity=rs.getFloat("sum(quantity)");
            completed_time=rs.getFloat("sum(time)");
            
            }
            ResultSet rs1=database.db_connect.data("select target from mould_for_machine where machine_id='"+machine+"' and mould_code='"+mould+"'");
            
            
            while(rs1.next()){
            
            target=rs1.getFloat("target");
            
            should_produce=target*completed_time;
//            
          additional=should_produce-produced_quantity;
//            
          if(additional<0){
          
                  additional=0;
              }
          
            }    
             x= (time-completed_time);
//            
            next_hours=(additional+target*x)/x;
            
           
           
            
             
          
           
            
       
            
            
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
       return next_hours;
        // return produced_quantity;  
    
        
    }

  

   
    public  float should_produce(String machine, String mould, String employee) {
      
          float target=0;
          float should_produce=0;
          float additional=0;
          float next_hours=0;
          float time=8;
          float completed_time=0;
          float x=0;
            float produced_quantity = 0;
            float final_answer=0;
          
          
        try {       
    
          
            
            ResultSet rs=database.db_connect.data("select sum(quantity),sum(time) from moulding_hourly_production where machine_id='"+machine+"' and mould_code='"+mould+"' and employee_id='"+employee+"'");
            
          
            
            while(rs.next()){
            
            produced_quantity=rs.getFloat("sum(quantity)");
            completed_time=rs.getFloat("sum(time)");
             
            
            }
           
            ResultSet rs1=database.db_connect.data("select target from mould_for_machine where machine_id='"+machine+"' and mould_code='"+mould+"'");
            
            
            while(rs1.next()){
            
            target=rs1.getFloat("target");
            
            should_produce=target*completed_time;
//            
            }
           
            
       
            
            
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
       return should_produce;
        // return produced_quantity;  
    
        
    } 
    
    
    
    
    
    
    
    
    
    

    public insert_methods() {
        try {
            int temp=database.db_connect.getData("CREATE TEMPORARY TABLE temp select mould_for_umbrella.mould_code,umbrella_priority.umbrella_code from mould_for_umbrella,umbrella_priority where mould_for_umbrella.umbrella_code=umbrella_priority.umbrella_code");
            int order_tempory=database.db_connect.getData("CREATE TEMPORARY TABLE order_tempory (mould_code VARCHAR(50) )");
       
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        }  
     
    
    
    public static void insert(String mould){
        try {
            int order_temp =database.db_connect.getData("insert into order_tempory values('"+mould+"')");
        
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
    }
      
      
      
   public static void insert_into_order_priority(String mould){
   
    try {
            //To change body of generated methods, choose Tools | Templates.

      
        
        
        int order_priority=database.db_connect.getData("insert into order_priority (mould_code) values('"+mould+"')");
        } catch (SQLException ex) {
            Logger.getLogger(my_temp_1.class.getName()).log(Level.SEVERE, null, ex);
        }
       
   
    
    
    
    
    
    
    
    
   
   }

    public int calculate_rate(int qty, String mould_code) {
        float rate = 0;
        float quantity=0;
        int round=0;
        
        try {
            ResultSet rs=database.db_connect.data("select sum(quantity) from total_order where mould_code='"+mould_code+"'");
       
            
            while(rs.next()){
            
            quantity=rs.getFloat("sum(quantity)");
            
            rate=(qty/quantity)*600;
            round=Math.round(rate);
            
            
            }
            
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return round;
    }

    public String employee_id(String employee) {
        
        String id="";
        
        
        try {
            ResultSet rs=database.db_connect.data("select employee_id from employee where employee_name='"+employee+"'");
       
            while(rs.next()){
            
            id=rs.getString("employee_id");
            
            }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(insert_methods.class.getName()).log(Level.SEVERE, null, ex);
        }
        
      return id;  
    }

   
        
        
        
        
        
  
    
    
    
    
}
