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
@WebServlet(name = "hourly_production", urlPatterns = {"/hourly_production"})
public class hourly_production extends HttpServlet {

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
           ArrayList<operator_assignment> machine=new ArrayList();
           ArrayList emp=new ArrayList();
           
         
           int sum_hour=0;
           int sum_summary=0;
           int total_sum=0;
           int total_order=0;
          
           Calendar cal = Calendar.getInstance();
           cal.getTime();
           SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");         
           String now_time=sdf.format(cal.getTime()); 
            
            
            
             number_of_hours hour=new number_of_hours();
            // Float hours=hour.get_time();
              //  out.print(hours);
             
             String hours=hour.get();
            
             
            float final_hour=Float.parseFloat(hours);
         
          
            
            
             String values=request.getParameter("q");
             
             
             
             
             String []each_row=values.split(",");
             
             for(int i=0;i<each_row.length;i++){
            
                    String []each_cell=each_row[i].split("-");
                    
                   
                    
                    int quantity=Integer.parseInt(each_cell[4]);
                 try { 
                     
                     
                     ResultSet rs5=database.db_connect.data("select employee_name from employee");
                     
                     while(rs5.next()){
                         emp.add(rs5.getString("employee_name"));
                     
                     }
                     
                     
                     
                    
                     ResultSet rs = database.db_connect.data("select employee_id from employee where employee_name='"+each_cell[0]+"'");
                     
                     while(rs.next()){
                  
                         String employee_id=rs.getString("employee_id");
                             
                         bean_entity.insert_methods in=new insert_methods();
                         float tot=in.items(each_cell[2],quantity);
                         
                         
                       bean_entity.insert_methods.insert_production(final_hour,employee_id,each_cell[1],each_cell[2],each_cell[3],tot);
                       int x=database.db_connect.getData("update start_time set time='"+now_time+"' where machine_id='"+each_cell[2]+"'");
                         
                         
                         ResultSet rs6=database.db_connect.data("select sum(quantity) from moulding_hourly_production where mould_code='"+each_cell[1]+"' ");
                         
                         while(rs6.next()){
                         
                             sum_hour=rs6.getInt("sum(quantity)");
                         
                            // out.println(sum_hour);
                         }
                         
                         
                         
                         ResultSet rs7=database.db_connect.data("select sum(quantity) from moulding_daily_production_summary where mould_code='"+each_cell[1]+"'");
                         
                         
                         while(rs7.next()){
                         
                             sum_summary=rs7.getInt("sum(quantity)");
                           //  out.println(sum_summary);
                         }
                         
                         total_sum=sum_hour+sum_summary;
                         
                       //  out.println(total_sum);
                         
                         ResultSet rs8=database.db_connect.data("select sum(quantity) from total_order where mould_code='"+each_cell[1]+"'");
                         
                         while(rs8.next()){
                         
                             total_order=rs8.getInt("sum(quantity)");
                           //  out.print(total_order);
                         }
                         
                         if(total_sum>=total_order){
                         
                      
                              int delete=database.db_connect.getData("delete from utilization_output where mould_code='"+each_cell[1]+"' and machine_id='"+each_cell[2]+"'");
                             
                     }
                     
//                         else{
//                         out.print("lesser");
//                         }
                         
                     }
                     
                     
                     
                    
                     ResultSet rs4=database.db_connect.data("select count(machine_id),utilization_output.machine_id,utilization_output.mould_code from utilization_output where utilization_output.machine_id='"+each_cell[2]+"' ");
                     
                     
                     while(rs4.next()){
                     
                        int  count=rs4.getInt("count(machine_id)");
                         
                          if(count==0){
                                int delete=database.db_connect.getData("delete from on_status_machines where machine_id='"+each_cell[2]+"'");
                                int up=database.db_connect.getData("update machine_status set status='available' where machine_id='"+each_cell[2]+"'");
                                int mach=database.db_connect.getData("delete from start_tme where machine_id='"+each_cell[2]+"'");
                                    
                                
                             RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/test2.jsp");
                             requestDispatcher.forward(request,response);
                          
                          
                          }
                          else{     
                         
                             machine.add(new operator_assignment (rs4.getString("utilization_output.machine_id"),(rs4.getString("utilization_output.mould_code"))));
                             request.getSession().setAttribute("emp",emp);
                             request.getSession().setAttribute("machine",machine); 
          
                              RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/new_assign.jsp");
           
                             requestDispatcher.forward(request,response);
           
          
                             
                             
                         }
                    
                     }
                     
                     
                 } catch (SQLException ex) {
                     Logger.getLogger(hourly_production.class.getName()).log(Level.SEVERE, null, ex);
                 }
                
                 
                 
                 
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
