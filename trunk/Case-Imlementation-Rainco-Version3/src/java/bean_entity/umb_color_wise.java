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
public class umb_color_wise {
    private String umb_code;
    private String color;
    private  int quantity;

    public umb_color_wise(String umb_code, String color, int quantity) {
        this.umb_code = umb_code;
        this.color = color;
        this.quantity = quantity;
        get_mould();
    }

    private void get_mould() {
        try {
            ResultSet rs = db_con.search("select mould_for_umbrella.mould_code, mould_for_umbrella.quantity from mould_for_umbrella where mould_for_umbrella.umbrella_code = '"+umb_code+"'");
            while (rs.next()){
            String mould_code = rs.getString("mould_code");
            int quantity_per_umb = rs.getInt("quantity");
            int total_item = quantity * quantity_per_umb;
            row_m_cal(mould_code,total_item);
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(umb_color_wise.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void row_m_cal(String mould_code, int total_item) {
        try {
           ResultSet rs1= db_con.search("select runner_waste,items_per_kg from  mould where mould_code='"+mould_code+"'");
           ResultSet rs2=db_con.search("select raw_material_code from raw_material_for_mould where mould_code='"+mould_code+"'");
           
           double total_quantity_needed = 0.0;
           double runner_waste = 0.0;
           while(rs1.next()){
           
               double runner=rs1.getDouble("runner_waste");
               double items=rs1.getDouble("items_per_kg");
           
               total_quantity_needed=total_item/(items*(1-runner));
               
               runner_waste=total_quantity_needed-(total_item/items);
               
               
           
           } 
           String r_m_code ="";
           while(rs2.next()){
               
               r_m_code = rs2.getString("raw_material_code");
           }
           
           String rm_split[]=r_m_code.split("_");
           // System.out.println(rm_split[0]);
           
           
           
           
            String RM_code=rm_split[0]+"_pure";
           
            set_row_material_q(mould_code, RM_code, total_quantity_needed, runner_waste);
           
           
           //if black
           //if spray
 
        } catch (SQLException ex) {
            Logger.getLogger(umb_color_wise.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void set_row_material_q(String mould_code, String RM_code, double total_quantity_needed, double runner_waste) {
        try {
            ResultSet rs = db_con.search("select count(raw_material) from raw_material_needed where raw_material='"+RM_code+"' and colour='"+color+"'");
                int val =0;
                while (rs.next()){
                    val = rs.getInt("count(raw_material)");
                }
                
                if(val == 0){
                    System.out.println("hi************");
                    System.out.println(total_quantity_needed+"  "+runner_waste);
                    db_con.submit("insert into raw_material_needed(colour,total_quantity,runner_waste,raw_material)values ('"+color+"',"+total_quantity_needed+","+runner_waste+",'"+RM_code+"')");
                }            
                else{
                   ResultSet rs1 = db_con.search("select total_quantity,runner_waste from raw_material_needed where raw_material='"+RM_code+"' and colour='"+color+"'");
                   double item_quantity = 0.0;
                   double item_runner_waste = 0.0;
                   
                   
                   while (rs1.next()){
                     item_quantity = rs1.getDouble("total_quantity");
                     item_runner_waste = rs1.getDouble("runner_waste");
                }
                   double total_amount = item_quantity + total_quantity_needed;
                   double total_r_w = item_runner_waste + runner_waste;
                   db_con.change("update raw_material_needed set total_quantity="+total_amount+" ,runner_waste="+total_r_w+" where raw_material='"+RM_code+"' and colour='"+color+"'");
                }
        } catch (SQLException ex) {
            Logger.getLogger(umb_color_wise.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}
