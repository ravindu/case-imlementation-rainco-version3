/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import com.mysql.jdbc.ResultSet;
import database.db_con;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlet_entity.raw_mat_cal;

/**
 *
 * @author Rajitha
 */
public class NewMain1_raj {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
             //get the umbrella quantity
//            set_umb_quantity um = new set_umb_quantity();
//            um.set_chart();
//            
//            java.sql.ResultSet rs = db_con.search("select umbrella_quantity.umbrella_code,umbrella_quantity.quantity,umbrella.colour from umbrella_quantity,umbrella where umbrella_quantity.umbrella_code=umbrella.umbrella_code");
//            while (rs.next()){
//            String umbrella_code = rs.getString("umbrella_code");
//            String colour = rs.getString("colour");
//            int umb_quantity = rs.getInt("quantity");
//            if(umb_quantity>0){
//            new umb_color_wise(umbrella_code, colour, umb_quantity);
//            }
//            }
            
            //setect sum of quantities - raw material type and colour type
            ResultSet rs2 = (ResultSet) db_con.search("select raw_material,colour,total_quantity,runner_waste from raw_material_needed");
            //List<raw_m_final> result_list = new display_r_m_q().rm_cal(rs2);
            NewInterface ni = new display_r_m_q();
            List<raw_m_final> result_lis = ni.rm_cal(rs2);
            
            new NewMain1_raj().display_resut(result_lis);
            
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    private void display_resut(List<raw_m_final> li2) {
        for(int i=0;i<li2.size();i++){
            System.out.print(li2.get(i).getRm());
            System.out.print("---");
            System.out.println(li2.get(i).getTotal());
        
        }
        
    }
    
               
            
}
