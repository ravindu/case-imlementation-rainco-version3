/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.insert_methods;
import bean_entity.number_of_hours;
import bean_entity.operator_assignment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "hourly_save1", urlPatterns = {"/hourly_save1"})
public class hourly_save1 extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         
            ArrayList<operator_assignment> machine_array=new ArrayList<operator_assignment>();
            ArrayList emp_array=new ArrayList();
            
         
            
           float total_order=0;
           float total_sum=0;
            
            
            
           Calendar cal = Calendar.getInstance();
           cal.getTime();
           SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");         
           String now_time=sdf.format(cal.getTime()); 
                    
            
            
              String sum=request.getParameter("q");
          //   out.print(sum);
              
               String []split_sum=sum.split(",");
             
               for(int i=0;i<split_sum.length;i++){
               
             
                   
                 String[] final_split=split_sum[i].split("-");
                 
               
                   String mould= final_split[1];
                   
                   String machine=final_split[2];
                   String dye=final_split[3];
                   float qty=Float.parseFloat(final_split[4]);
                   String emp=final_split[5];
               
                   
                   
                   
               
//                 
//                  
             try {
                    ResultSet rs2 = database.db_connect.data("select time from start_time where machine_id='"+machine+"'");
//                    
//                    
                   while(rs2.next()){
                     String time=rs2.getString("time");
                       
                   number_of_hours hour=new number_of_hours();
                   Float difference=Float.parseFloat(hour.get_time());
                   
                   
                 
                   
              
                     bean_entity.insert_methods in=new insert_methods();
                     float tot=in.items(mould,qty);
                     
                    
                     
                      int insert=database.db_connect.getData("insert into moulding_hourly_production (time,employee_id,machine_id,mould_code,dye_code,quantity) values('"+difference+"','"+emp+"','"+machine+"','"+mould+"','"+dye+"',"+tot+")");
                       
                               
                               
                               
                    int update=database.db_connect.getData("update start_time set time='"+now_time+"' where machine_id='"+machine+"'");
                     
                       
                    bean_entity.insert_methods.daily_summary(difference,emp,machine,mould,dye,tot);
                    
                    bean_entity.insert_methods.daily_employee_summary(difference,emp,machine,mould,dye,tot);
                    
                    
                    bean_entity.insert_methods.set_buffer(mould,dye,tot);
                       
                     
                     
                                           }
                    
                    
                } catch (SQLException ex) {
                   Logger.getLogger(hourly_save1.class.getName()).log(Level.SEVERE, null, ex);
               }
//              
               }
              
              
             for(int i=0;i<split_sum.length;i++){
              
                 
                  String[] final_split=split_sum[i].split("-");  
                  String machine=final_split[2];
                 
            
                  String mould_code=  final_split[1];
                  
            
                  bean_entity.insert_methods in=new insert_methods();
                  total_sum= in.calculate_total(mould_code);
                  
                  
                try {
                    
                    
                    
                     ResultSet rs=database.db_connect.data("select employee_name from employee where employee_id='"+final_split[5]+"'");
                          
                      while(rs.next()){
                 
                     emp_array.add(rs.getString("employee_name"));
                 }
                    
                    
                    ResultSet rs3 = database.db_connect.data("select sum(quantity) from total_order where mould_code='"+mould_code+"'");
                    
                    while(rs3.next()){
                    
                     total_order=rs3.getInt("sum(quantity)");
                    
                    }
                    
                    
                    if(total_sum>=total_order){
                    
                        
                        
                    //    int delete=database.db_connect.getData("delete from utilization_output where mould_code='"+mould_code+"' and machine_id='"+machine+"'");
                        
                        ResultSet rs5=database.db_connect.data("select count(machine_id),mould_code from break_down_status_machines where machine_id='"+machine+"'");
                        
                       while(rs5.next()){
                           int b_count=rs5.getInt("count(machine_id)");
                           String break_mould=rs5.getString("mould_code");
                           
                           
                           if(b_count==0){
                           
                             
                        ResultSet rs4=database.db_connect.data("select count(machine_id),utilization_output.machine_id,utilization_output.mould_code from utilization_output where utilization_output.machine_id='"+machine+"' ");
                        
                        
                        while(rs4.next()){
                     
                        int  count=rs4.getInt("count(machine_id)");
                        
                          if(count==0){
                        
                          
                              int delete1=database.db_connect.getData("delete from on_status_machines where machine_id='"+machine+"'");
                              int up=database.db_connect.getData("update machine_status set status='available' where machine_id='"+machine+"'");
                              int mach=database.db_connect.getData("delete from start_tme where machine_id='"+machine+"'");   
                          }
                          
                          
                          
                          else{
                                  
                                 machine_array.add(new operator_assignment (rs4.getString("utilization_output.machine_id"),(rs4.getString("utilization_output.mould_code"))));
                        
                          
                          }
                          
                        
                         }
                           
                        
                           
                    }
                       
                           else{
                           
                               
                               machine_array.add(new operator_assignment(machine,break_mould));
                           
                           }
                           
                           
                       }
                        
                        
                      
                    
                        
                        
                    }   
                } catch (SQLException ex) {
                    Logger.getLogger(hourly_save.class.getName()).log(Level.SEVERE, null, ex);
                }
                  
                  
              
                    
             }
             
             
             
             
               
                if(machine_array.size()!=0){
                
                        request.getSession().setAttribute("emp",emp_array);
                        request.getSession().setAttribute("machine",machine_array); 
                        
                 RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/new_assign.jsp");
               requestDispatcher.forward(request,response);
                        
                
                }
                
                 
                if(machine_array.size()==0){
                  
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Supervisor_home");
                requestDispatcher.forward(request,response);
                    
                }    
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
