/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

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
@WebServlet(name = "Supervisor_home", urlPatterns = {"/Supervisor_home"})
public class Supervisor_home extends HttpServlet {

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
            int brk_count=0;
            ArrayList machine=new ArrayList();
            ArrayList brk_machines=new ArrayList();
            
            
            
            try {
                ResultSet rs=database.db_connect.data("select count(machine_id) from on_status_machines where on_status_machines.employee_id=''");
                
                while(rs.next()){
                
                    
                   count=rs.getInt("count(machine_id)");
                
                
                }
             
                     if(count>0){
                
                    ResultSet rs1=database.db_connect.data("select machine_id from on_status_machines where on_status_machines.employee_id=''");
                    
                    while(rs1.next()){
                    
                    String machine_id=rs1.getString("machine_id");
                    
                    machine.add(machine_id);
                
                }
             }
                
               
                     
               ResultSet break_down=database.db_connect.data("select count(on_status_machines.machine_id) from on_status_machines,machine_status where on_status_machines.machine_id=machine_status.machine_id and machine_status.`status`='break_down' ");
               
               
               while(break_down.next()){
               
                   brk_count=break_down.getInt("count(on_status_machines.machine_id)");
                  
                  
               
               }
               
               
               
               if(brk_count>0){
               
               ResultSet break_machines=database.db_connect.data("select on_status_machines.machine_id from on_status_machines,machine_status where on_status_machines.machine_id=machine_status.machine_id and machine_status.`status`='break_down' ");
               
               
               while(break_machines.next()){
               
                    String break_m=break_machines.getString("on_status_machines.machine_id");
               
                    brk_machines.add(break_m);
                   
               }
               
               
               }
               
               
                     
            } catch (SQLException ex) {
                Logger.getLogger(Supervisor_home.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
             request.getSession().setAttribute("break_machines",brk_machines);
             request.getSession().setAttribute("machine",machine);
             RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Supervisor_home.jsp");
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
