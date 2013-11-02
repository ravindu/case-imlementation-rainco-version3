/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import com.mysql.jdbc.ResultSet;
import database.db_con;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Rajitha
 */
public class display_r_m_q implements NewInterface{
    
    List<raw_m_final> li = new LinkedList<raw_m_final>();
    List<raw_m_final> li2 = new LinkedList<raw_m_final>();

            public List<raw_m_final> rm_cal(ResultSet rs2) {
        try {
//            String rm = "";
//            String cl = "";
//            double t = 0.0;
//            double r = 0.0;
            while(rs2.next()){
                String rm = rs2.getString("raw_material");
                String cl = rs2.getString("colour");
                double t = rs2.getDouble("total_quantity");
                double r = rs2.getDouble("runner_waste");
                
                
                if(!cl.equals("spray")){
                    if(li.size()>0){
                        //see u got the object
                        boolean found = find_similar(rm,cl,t,r);
                        //System.out.println(found);
                      
                        
                        if(found==false){
                            //System.out.println("added");
                            li.add(new raw_m_final(rm, cl, t, r));
                        }
                    }
                    else{
                        li.add(new raw_m_final(rm, cl, t, r));
                        //System.out.println("first 1 added");
                    }
                    
                }
                else{
                    li.add(new raw_m_final(rm, cl, t, r));
                }
                
                
                
                
            }
            //after raw material quantity is calculated for the raw materials which have colour and black they added to a separate list
            //for the raw materials which needed only one type(black or colur) or spray, they added using the li list
            for(int i=0;i<li.size();i++){
                String rm = li.get(i).getRm();
                double t = li.get(i).getTotal();
                double rw = li.get(i).getRunner_w();
                String cl = li.get(i).getCol();
                if(cl=="colour"){
                    li2.add(new raw_m_final(rm, "", t, 0.0));
                    double virtual_quantity =  get_from_virtual_hub((rm.split("_"))[0]);
                    //setting the virtual inner hub
                    double total_crush = rw + virtual_quantity;
                    update_virtual_inner_hub((rm.split("_"))[0],total_crush);
                }
                else{
                    double virtual_quantity =  get_from_virtual_hub((rm.split("_"))[0]);
                    double total_need = t - virtual_quantity;
                    if(total_need<0){
                        // no need to apply rm.
                        //need to update the virtual inner hub
                        
                        li2.add(new raw_m_final(rm, "", 0.0, 0.0));
                        update_virtual_inner_hub((rm.split("_"))[0],-total_need);
                    }
                    else{
                        //total need is positive for blak and spray
                        //virtual inner hub must be updated with rw
                        li2.add(new raw_m_final(rm, "", total_need, 0.0));
                        update_virtual_inner_hub((rm.split("_"))[0],rw);
                        
                    }
                }
            
            }
            
            //display_resut(li2);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(display_r_m_q.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li2;
    }

    private boolean find_similar(String rm, String cl, double t, double r) {
        
        boolean b = false;
        for(int i=0;i<li.size();i++){
            //System.out.println("beep");
                            if(li.get(i).getRm().equals(rm)){
                                b=true;
                                
                                
                                String rm_array[] = rm.split("_");
                                double virtual_quantity =  get_from_virtual_hub(rm_array[0]);
                                
                                
                                double productive_r_w = 0.0;
                                double r_q_for_black = 0.0;
                                double remaining_r_w = 0.0;
                                double total_for_colour = 0.0;
                                double total_pure = 0.0;
                                
                                if(cl == "colour"){
                                    productive_r_w = r;
                                    total_for_colour = t; 
                                    r_q_for_black = li.get(i).getTotal() - (productive_r_w + virtual_quantity);
                                    remaining_r_w = li.get(i).getRunner_w();
                                    
                                    
                                }
                                else{
                                    productive_r_w = li.get(i).getRunner_w();
                                    r_q_for_black = t - (productive_r_w + virtual_quantity);
                                    remaining_r_w = r;
                                    total_for_colour = li.get(i).getTotal();
                                    
                                    // get the runner waste of incomming and substract it from the i th object's total
                                    
                                    //if the value is negative no need of additional rm for i th object
                                    //the positive value of above and the runner waste of the i th object will be saved for next production
                                    
                                    //if the value is possitive i th oblect's runner waste will be saved for the next production.
                                }
                                if(r_q_for_black<0){
                                    //if the value is negative no need of additional rm
                                    total_pure = total_for_colour;
                                    li2.add(new raw_m_final(rm, "", total_pure, 0.0));
                                    //set the virtual inner hub new -(r_q_for_black) rm quantity
                                    update_virtual_inner_hub(rm_array[0],-r_q_for_black);
                                    
                                    
                                    
                                    
                                }
                                else{
                                    total_pure = r_q_for_black+total_for_colour;
                                    li2.add(new raw_m_final(rm, "", total_pure, 0.0));
                                    //System.out.println("RM-"+rm+"----required quantity-"+total_pure);
                                    //set the virtual inner hub new remaining rm quantity
                                    update_virtual_inner_hub(rm_array[0],remaining_r_w);
                                    
                                }
                                
                                
                                li.remove(i);
                                break;
//                                
                            }
                            
                        }
        return b;
        
        
    }

    private double get_from_virtual_hub(String s) {
        double q = 0.0;
        try {
            String st = s+"_crush";
            java.sql.ResultSet rs = db_con.search("select virtual_inner_hub.remaining_quantity from virtual_inner_hub where virtual_inner_hub.raw_material = '"+st+"'");
            
            while(rs.next()){
                q = rs.getDouble("remaining_quantity");
            }
            
            
        } catch (SQLException ex) {
            
        }
        return q;
        
    }

    private void update_virtual_inner_hub(String s, double d) {
        String st = s+"_crush";
        db_con.change("update virtual_inner_hub set virtual_inner_hub.remaining_quantity = "+d+" where virtual_inner_hub.raw_material = '"+st+"'");
    }

//    private void display_resut(List<raw_m_final> li2) {
//        for(int i=0;i<li2.size();i++){
//            System.out.print(li2.get(i).getRm());
//            System.out.print("---");
//            System.out.println(li2.get(i).getTotal());
//        
//        }
//        
//    }

    

    
    
    
}
