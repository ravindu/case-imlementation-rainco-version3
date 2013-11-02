/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.insert_methods;
import bean_entity.number_of_hours;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "change_mould", urlPatterns = {"/change_mould"})
public class change_mould extends HttpServlet {

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
           
            
            String values=request.getParameter("q");
            
           
            
            String split_values[]=values.split(",");
            
            for(int i=0;i<split_values.length;i++){
            
              String final_split[]=split_values[i].split("-");
              
              String employee=final_split[0];
              String mould=final_split[1];
              String machine=final_split[2];
              String dye=final_split[3];
              float qty=Float.parseFloat(final_split[4]);
              
              
              insert_methods emp_id=new insert_methods();
              String emp=emp_id.employee_id(employee);
              
             
             
                try {
                    ResultSet rs2 = database.db_connect.data("select time from start_time where machine_id='"+machine+"'");
              
                
                     
                   while(rs2.next()){
                   String time=rs2.getString("time");
                       
                   number_of_hours hour=new number_of_hours();
                   Float difference=Float.parseFloat(hour.get_time());
                   
                   
                 
                   
              
                     bean_entity.insert_methods in=new insert_methods();
                     float tot=in.items(mould,qty);
                     
                    
                     
                    int insert=database.db_connect.getData("insert into moulding_hourly_production (time,employee_id,machine_id,mould_code,dye_code,quantity) values('"+difference+"','"+emp+"','"+machine+"','"+mould+"','"+dye+"',"+tot+")");
                       
                               
                               
                
                     
                       
                    bean_entity.insert_methods.daily_summary(difference,emp,machine,mould,dye,tot);
                    
                    bean_entity.insert_methods.daily_employee_summary(difference,emp,machine,mould,dye,tot);
                    
                    
                    bean_entity.insert_methods.set_buffer(mould,dye,tot);
                       
                    int insert_break_down=database.db_connect.getData("insert into break_down_status_machines(machine_id,mould_code) values('"+mould+"','"+machine+"')");
                    
                    int delete_on_status=database.db_connect.getData("delete from on_status_machines where machine_id='"+machine+"'");
                    
                                   
                   int delete_machine_from_start_time=database.db_connect.getData("delete from start_time where machine_id='"+machine+"'");
                
                
                
                   }
                
                
                
                
                } catch (SQLException ex) {
                    Logger.getLogger(change_mould.class.getName()).log(Level.SEVERE, null, ex);
                }
              
              
            
            }
            
          
              
         RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Supervisor_home");
         requestDispatcher.forward(request,response);
            
            
            
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
