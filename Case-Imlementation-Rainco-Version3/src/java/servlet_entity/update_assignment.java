/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_connect;
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
@WebServlet(name = "update_assignment", urlPatterns = {"/update_assignment"})
public class update_assignment extends HttpServlet {

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
          
            String combine=request.getParameter("q");
            
             String []splitted_result=combine.split(",");
             
             for(int i=0;i<splitted_result.length;i++){
             
             
                 String [] final_split=splitted_result[i].split("-");
                 

                try {
                    
                    ResultSet rs= db_connect.data("select employee_id from employee where employee_name='"+final_split[2]+"'");
                    
                    while(rs.next()){
                    
                    String employee=rs.getString("employee_id");
                    
                    
                    
                    int x=database.db_connect.getData("update on_status_machines set mould_code='"+final_split[1]+"',employee_id='"+employee+"' where machine_id='"+final_split[0]+"' ");
                   
                    
                    }
                
                    
                   ResultSet break_down= db_connect.data("select count(machine_id) from break_down_status_machines where machine_id='"+final_split[0]+"' and mould_code='"+final_split[1]+"'");
                    
                   while(break_down.next()){
                   
                       int count=break_down.getInt("count(machine_id)");
                       
                       
                       if(count>0){
                           int delete=database.db_connect.getData("delete from break_down_status_machines where machine_id='"+final_split[0]+"' and mould_code='"+final_split[1]+"'");
                       
                       }
                       
                       
                       else{
                       
                           int delete1=database.db_connect.getData("delete from utilization_output where machine_id='"+final_split[0]+"' and mould_code='"+final_split[1]+"'");
                       
                       }
                       
                   
                   }
                   
                    
                    
                    
                    
                    
                } catch (SQLException ex) {
                    Logger.getLogger(update_assignment.class.getName()).log(Level.SEVERE, null, ex);
                }
             
             }
           RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Supervisor_home");
           requestDispatcher.forward(request, response);  
            
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
