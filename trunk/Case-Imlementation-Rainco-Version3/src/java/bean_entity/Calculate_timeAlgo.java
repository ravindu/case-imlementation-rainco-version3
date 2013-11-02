/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import database.db_con;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ravindu
 */
public class Calculate_timeAlgo {
    
    private int MouldQTY;
    private double TOTAL_KG,TOTAL_HRS;
    NotComplete_algoBean NCB;
    
    public List GetMouldCode()
    {
        List<NotComplete_algoBean> QTY = null; 
        
        try {
            QTY=new ArrayList<NotComplete_algoBean>();
            ResultSet rs= db_con.search("select distinct machine_id,mould_code from utilization_output");
            while(rs.next())
            { 
                 String Mould=rs.getString("mould_code");
                 String Machine=rs.getString("machine_id");
                 //System.out.println(Machine+"       "+Mould);
                 int ReturnQTY=GetMouldQTY(Mould);
                 //System.out.println("quantity "+ReturnQTY);
                 double total_kgs=GetTotalKGs(Mould, ReturnQTY);
                 double total_hours=GetTotalHours(Machine, Mould, total_kgs);
                 
                 
                 //System.out.println("Machine id "+Machine+" Mould id"+Mould+" total KG"+total_kgs+"total hours : "+String.valueOf(total_hours));
                 NCB=new NotComplete_algoBean(Machine, Mould, ReturnQTY,total_kgs,total_hours);
                 QTY.add(NCB);
            }
        } 
        catch (Exception ex) 
        {
            
        }
        
        return QTY;
    
    
    }
    
    /*
     * Main method of finding total quantity for production using mould code and return quantity
    */
    public int GetMouldQTY(String mould)
    {
        MouldQTY=0;
        try 
        {
           ResultSet rss=(ResultSet)db_con.search("SELECT * FROM total_order where mould_code='"+mould+"'");
           while(rss.next())
           {
               MouldQTY=Integer.parseInt(rss.getString("quantity"));
               
           }
        } 
        
        catch (Exception ex) 
        {
        }
        
        return MouldQTY;
    }
    
    
    /*
     * Main method of finding total kilograms for production using mould code and total quantity
    */
      public double GetTotalKGs(String mouldcode,int qty)
      {
           TOTAL_KG=0;   
          try 
          {
           
           ResultSet rss1=(ResultSet)db_con.search("SELECT * FROM mould where mould_code='"+mouldcode+"'");
           while(rss1.next())
           {
               double items_per_kg=Double.valueOf(rss1.getString("items_per_kg"));
               //System.out.println(items_per_kg);
               TOTAL_KG=((double)qty/items_per_kg);
               //System.out.println("total KGS"+TOTAL_KG);
               
           }
          } 
          
        catch (Exception ex) 
        {
        }
          
          
          return TOTAL_KG;
      
      }
      
      /*
     * This returns total hours for produce quantities
    */
      public double GetTotalHours(String machine,String mould,double kgs)
      {
           TOTAL_HRS=0;   
          try 
          {
           
           ResultSet rss2=(ResultSet)db_con.search("SELECT * FROM mould_for_machine where mould_code='"+mould+"' and machine_id='"+machine+"'");
           while(rss2.next())
           {
               double target=Double.parseDouble(rss2.getString("target"));
               //System.out.println("machine "+machine+"  target "+target);
               if(target==0)
               {
                   target=100;
               }
               TOTAL_HRS=kgs/target;
               //System.out.println("total hours"+TOTAL_HRS);
           }
          } 
          
        catch (Exception ex) 
        {
        }
          
          
          return TOTAL_HRS;
      
      }
}
