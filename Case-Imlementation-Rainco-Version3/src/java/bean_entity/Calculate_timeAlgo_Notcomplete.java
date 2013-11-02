/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import database.db_con;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sajee
 * Calculate remain time for running moulds
 */
public class Calculate_timeAlgo_Notcomplete {
    
    private double CurrentMouldQTY=0,DailyMouldQTY=0,TotalMouldQTY=0;
    private double TOTAL_KG=0,TOTAL_HRS=0;
    Completing_algoBean GMQNC;
   
    /*
     * add all the relevent details to Completing_algoBean class.
     * mould details,machine details,total KG,total HRs
    */
    public List Getdetails_NotComplete()
    {
        List<Completing_algoBean> GetNotComplete=null;
        try 
        {
            
            GetNotComplete=new ArrayList<Completing_algoBean>();
            ResultSet rs=(ResultSet) db_con.search("select * from on_status_machines");
            while(rs.next())
            {
                String mould=rs.getString("mould_code");
                String machine=rs.getString("machine_id");
                double current_qty=GetCurrent_MouldQuantity(mould,machine);
                
                double prevoius_qty=GetDaily_MouldQuantity(mould);
                double up_to_now=current_qty+prevoius_qty;
                //System.out.println("currrent qty"+current_qty);
                double total_qty=GetTotal_MouldQTY(mould);
                //System.out.println("total qty"+total_qty);
                double remain_qty=total_qty-up_to_now;
                //System.out.println("remain qty"+remain_qty);
                
                double total_kgs=GetTotalKGs_NotComplete(remain_qty,mould);
                //System.out.println("total kg "+total_kgs);
                
                double total_hours=GetTotalHours_NotComplete(total_kgs, mould,machine);
                DecimalFormat DF=new DecimalFormat("###.##");
                double hours=Double.valueOf(DF.format(total_hours));
                
                
                //System.out.println("Total hours "+total_hours);
                GMQNC=new Completing_algoBean(machine, mould, remain_qty, total_kgs, hours);
                GetNotComplete.add(GMQNC);
            }
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        
        
        return GetNotComplete;
    
    }
    
    /*
     * Main method of finding current quantity for production using mould code and return quantity
    */
    public double GetCurrent_MouldQuantity(String mould,String machine)
    {
        try 
        {
            ResultSet rs=(ResultSet) db_con.search("select * from moulding_hourly_production where mould_code='"+mould+"' and machine_id='"+machine+"'");
            while(rs.next())
            {
                CurrentMouldQTY=CurrentMouldQTY+Double.parseDouble(rs.getString("quantity"));
            }
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        
        return CurrentMouldQTY;
    
    }
    
    /*
     * Main method of finding current quantity for production using mould code and return quantity
    */
    public double GetDaily_MouldQuantity(String mould)
    {
        try 
        {
            ResultSet rs=(ResultSet) db_con.search("select * from moulding_daily_production_summary where mould_code='"+mould+"'");
            while(rs.next())
            {
                DailyMouldQTY=DailyMouldQTY+Double.parseDouble(rs.getString("quantity"));
            }
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        
        return CurrentMouldQTY;
    
    }
    
    
    /*
     * Main method of finding total quantity for production using mould code and return quantity
    */
    public double GetTotal_MouldQTY(String mould)
    {
        try 
        {
           ResultSet rss=(ResultSet)db_con.search("SELECT * FROM total_order where mould_code='"+mould+"'");
           while(rss.next())
           {
               TotalMouldQTY=(double)Integer.parseInt(rss.getString("quantity"));
               
           }
        } 
        
        catch (SQLException ex) 
        {
           ex.printStackTrace();
        }
        
        return TotalMouldQTY;
    }
    
    /*
     * Main method of finding total kilograms for production using mould code and total quantity
    */
    public double GetTotalKGs_NotComplete(double qty,String mouldcode)
      {
         
          try 
          {
           
           ResultSet rss1=(ResultSet)db_con.search("SELECT * FROM mould where mould_code='"+mouldcode+"'");
           while(rss1.next())
           {
               double items_per_kg=Double.valueOf(rss1.getString("items_per_kg"));
               //System.out.println(items_per_kg);
               TOTAL_KG=qty/items_per_kg;
              // System.out.println("total KGS"+TOTAL_KG);
               
           }
          } 
          
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
          
          
          return TOTAL_KG;
      
      }
    
    /*
     * This returns total hours for produce quantities
    */
    public double GetTotalHours_NotComplete(double total_kg,String mould,String machine)
      {
          double target;
          try 
          {
           
           ResultSet rss2=(ResultSet)db_con.search("SELECT target FROM mould_for_machine WHERE mould_code='"+mould+"'AND machine_id='"+machine+"'");
           while(rss2.next())
           {
               target=Double.parseDouble(rss2.getString("target"));
               //System.out.println(kgs);
               //System.out.println("Machine code "+machine+ "Target "+target);
               TOTAL_HRS=total_kg/target;
              // System.out.println("Total HRS "+TOTAL_HRS);
           }
          }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
          
          
          return TOTAL_HRS;
      
      }
    
   /* public static void main(String[] args) {
        Calculate_timeAlgo_Notcomplete SC=new Calculate_timeAlgo_Notcomplete();
        List<Completing_algoBean> GET_DETAILS=SC.Getdetails_NotComplete();
        for(int i=0;i<GET_DETAILS.size();i++)
       {
           //double round_hours=Math.floor(GETLIST.get(i).getTotal_hrs())+1;
            System.out.println("Machine "+GET_DETAILS.get(i).getMachine()+" Mould code "+GET_DETAILS.get(i).getMould()+"  QTY "+GET_DETAILS.get(i).getQuantity()+" kilograms "+GET_DETAILS.get(i).getKilograms()+" Hours "+GET_DETAILS.get(i).getHours());
        }
    }*/
    
}
