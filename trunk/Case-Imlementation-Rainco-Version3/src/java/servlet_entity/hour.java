/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.array_dye;
import bean_entity.array_mould;
import bean_entity.employee_id;
import bean_entity.insert_methods;
import bean_entity.machine_count;
import bean_entity.machine_id;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "hour", urlPatterns = {"/hour"})
public class hour extends HttpServlet {

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
            
          
          int count=0;
          ArrayList<machine_count> select_machine_count=new ArrayList();
          ArrayList<employee_id>select_employee=new ArrayList<employee_id>();
          ArrayList<machine_id>select_machine=new ArrayList<machine_id>();
          ArrayList<array_mould>select_mould=new ArrayList<array_mould>();
          ArrayList<array_dye>select_dye=new ArrayList<array_dye>();
        

            
            
            
            
            try {
                ResultSet rs2=database.db_connect.data("select on_status_machines.machine_id from on_status_machines,machine_status where on_status_machines.machine_id=machine_status.machine_id and machine_status.`status`='break_down' ");
                
                while(rs2.next()){
                    String machine=rs2.getString("on_status_machines.machine_id");
                    select_machine.add(new machine_id(machine));
                    
                  
                    
                 ResultSet rs3=database.db_connect.data("select employee_id from on_status_machines where machine_id='"+machine+"'");
                 
                 while(rs3.next()){
                 
                     String emp=rs3.getString("employee_id");
                     insert_methods employee=new insert_methods();
                     String name=employee.id(emp);
                     
                    select_employee.add(new employee_id(name));
                 
                 }
                    
                  
                 
                 ResultSet rs4=database.db_connect.data("select mould_code from on_status_machines where machine_id='"+machine+"'");
                 
                 while(rs4.next()){
                 
                     String mould=rs4.getString("mould_code");
                     select_mould.add(new array_mould(mould));
                     
                     out.print(mould);
                 
                 }
                 
                 
                    
                }
                
 
            } catch (SQLException ex) {
                Logger.getLogger(hourly_production.class.getName()).log(Level.SEVERE, null, ex);
            }
           
           
            
         
          
          
          ResultSet rs3;
            try {
                rs3 = database.db_connect.data("select dye_code from dye");
           
          
                  while(rs3.next()){
                         
                  String dye=rs3.getString("dye_code");
                  select_dye.add(new array_dye(dye));
          }
          
          
         } catch (SQLException ex) {
                Logger.getLogger(hourly_production.class.getName()).log(Level.SEVERE, null, ex);
            }  

          
            
           request.getSession().setAttribute("data",count);
           request.getSession().setAttribute("employee",select_employee);
           request.getSession().setAttribute("machine",select_machine);
           request.getSession().setAttribute("mould",select_mould);
           request.getSession().setAttribute("dye",select_dye);
           
           RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/hourly_production.jsp");
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
