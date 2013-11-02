/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.machine_helper;
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
@WebServlet(name = "display_staus", urlPatterns = {"/display_staus"})
public class display_staus extends HttpServlet {

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
          String machine="";
          String mould="";
          String other_machine="";
          
          
          ArrayList<machine_helper> on_machines=new ArrayList<machine_helper>();
          ArrayList other=new ArrayList();
       
            
            String status=request.getParameter("q");
            
            out.print(status);
            try {
                ResultSet rs=database.db_connect.data("select count(machine_id) from machine_status where status='"+status+"'");
          
                while(rs.next()){
                
                    count=rs.getInt("count(machine_id)");
                   
                
                }
            
            
               if(status.equals("on")){ 
                ResultSet rs1=database.db_connect.data("select machine_id,mould_code from on_status_machines ");
                
                while(rs1.next()){
                
                    machine=rs1.getString("machine_id");
                    mould=rs1.getString("mould_code");
                    
                    on_machines.add(new machine_helper(machine, mould));
                    
                
                }
                
                
                
               }
            
               
              else{
               
                   
                   ResultSet rs2=database.db_connect.data("select machine_id from machine_status where status='available'");
               
                   while(rs2.next()){
                   
                   other_machine=rs2.getString("machine_id");
                   other.add(other_machine);
                   
                   }
               
               
               }
              
               
                request.getSession().setAttribute("on_count",count);
              
               if(on_machines.size()>0){
               
                       
                        request.getSession().setAttribute("on_machines",on_machines);
                        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/on_status.jsp");
                         requestDispatcher.forward(request,response);
               
               }
               
               
              else{
               
                   request.getSession().setAttribute("other_machines",other);
                  RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/other_status.jsp");
                   requestDispatcher.forward(request,response);
               
               
               }
               
               
               
               
               
               
            
            } catch (SQLException ex) {
                Logger.getLogger(display_staus.class.getName()).log(Level.SEVERE, null, ex);
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
