/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import database.db_con;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rajitha
 */
public class set_umb_quantity {
    
   
    String production_number;

    //result of this part is get the total quantity for each mould for the production chart. fill the total order table.
    public set_umb_quantity(String p) {
        this.production_number = p;
    }
            
    public  void set_chart(){
     //   db_con.change("Create  table umbrella_quantity(umbrella_code varchar(250),quantity int(10))");
        
        
        try {
            ResultSet rs;
                    
                    rs = db_con.search("select sum(production_order.quantity),buffer_limit,sum(production_order.quantity)+buffer_limit,(sum(production_order.quantity)+buffer_limit)-buffer_level.remaining_quantity as remaining ,umbrella_code from buffer_level,production_order where order_number='"+production_number+"' and buffer_level.buffer_id=production_order.umbrella_code group by umbrella_code");
                    while (rs.next()){
                    String umbrella_code = rs.getString("umbrella_code");
                    int umb_quantity = rs.getInt("remaining");
                    umb_quantity_p(umbrella_code, umb_quantity);
                    }
                    
                    ResultSet rs1=db_con.search("select * from umbrella_quantity");
                    
                    
                    while(rs1.next()){
                    
                        String umb_code = rs1.getString("umbrella_code");
                       int quantity = rs1.getInt("quantity");
                       set_need_quantity(umb_code,quantity);
                    
                        
                     //   System.out.println(umb_code);
                        
                    }
            
                    
                    
                    System.out.println("************************************************************************");
        } catch (SQLException ex) {
            Logger.getLogger(set_umb_quantity.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            }

    private void umb_quantity_p(String umbrella_code, int umb_quantity) {
        
        //before new production chart is enetred this table should be cleared**************** 
        db_con.change("insert into umbrella_quantity values('"+umbrella_code+"',"+umb_quantity+")");
        
        
        
    }

    private void set_need_quantity(String umb_code, int quantity) {
        if(quantity>0){
        try {
            ResultSet rs2 = db_con.search("select mould_for_umbrella.mould_code, mould_for_umbrella.quantity from mould_for_umbrella where mould_for_umbrella.umbrella_code = '"+umb_code+"'");
                while (rs2.next()){
                String mould_code = rs2.getString("mould_code");
                int quantity_per_umb = rs2.getInt("quantity");
                int total_item = quantity*quantity_per_umb;
                System.out.print(mould_code);
                System.out.print("_ ");
                System.out.println(total_item);
                insert_db(mould_code,total_item);
                }
                set_remaining_to_zero(umb_code);//not zero but to new defined buffer level
        } catch (SQLException ex) {
            Logger.getLogger(set_umb_quantity.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        else{
            set_remaining(quantity,umb_code);// set remaining to remainin+buffer level.
        }
            
    }

    private void insert_db(String mould_code, int total_item) {
        try {
            ResultSet rs4 = db_con.search("select count(mould_code) from total_order where order_number='"+production_number+"' and mould_code='"+mould_code+"'");
                int val =0;
                while (rs4.next()){
                    val = rs4.getInt("count(mould_code)");
                }
                
                if(val == 0){
                    System.out.println("hi");
                    db_con.submit("insert into total_order (order_number, mould_code, quantity) values('"+production_number+"','"+mould_code+"','"+total_item+"')");
                }            
                else{
                   ResultSet rs5 = db_con.search("select quantity from total_order where mould_code = '"+mould_code+"' and order_number = '"+production_number+"'");
                   int c_amount = 0;
                   while (rs5.next()){
                     c_amount = rs5.getInt("quantity");
                }
                   int total_amount = c_amount+total_item;
                   db_con.change("update total_order set quantity="+total_amount+" where mould_code = '"+mould_code+"' and order_number = '"+production_number+"'");
                }
                
        } catch (SQLException ex) {
            Logger.getLogger(set_umb_quantity.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void set_remaining(int quantity, String umb_code) {
        try {
            ResultSet buff1 = db_con.search("select buffer_level.buffer_limit from buffer_level where buffer_id = '"+umb_code+"'");
            int buff_level = 0;
                   while (buff1.next()){
                     buff_level = buff1.getInt("buffer_limit");
                }
            
            int new_remaining = -quantity;
            int all_new_remain = new_remaining+buff_level;
            db_con.change("update buffer_level set buffer_level.remaining_quantity = "+all_new_remain+" where buffer_level.buffer_id = '"+umb_code+"'");
        } catch (SQLException ex) {
            Logger.getLogger(set_umb_quantity.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void set_remaining_to_zero(String umb_code) {
        try {
            ResultSet buff2 = db_con.search("select buffer_level.buffer_limit from buffer_level where buffer_id = '"+umb_code+"'");
                int buff_level = 0;
                       while (buff2.next()){
                         buff_level = buff2.getInt("buffer_limit");
                    }
            db_con.change("update buffer_level set buffer_level.remaining_quantity = "+buff_level+" where buffer_level.buffer_id = '"+umb_code+"'");

            //To change body of generated methods, choose Tools | Templates.
        } catch (SQLException ex) {
            Logger.getLogger(set_umb_quantity.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
           
           
    
}
