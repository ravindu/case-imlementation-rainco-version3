/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.insert_methods;
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
@WebServlet(name = "A_start_machines", urlPatterns = {"/A_start_machines"})
public class A_start_machines extends HttpServlet {

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
            try {
                
               
                
                
                ResultSet rs=database.db_connect.data("select distinct utilization_output.machine_id ,mould_code from utilization_output,machine_status where machine_status.machine_id=utilization_output.machine_id  and machine_status.status!='break_down' group By utilization_output.machine_id ");
          
                
                
                 while(rs.next()){
                 
                     String machine=rs.getString("machine_id");
                     String mould=rs.getString("mould_code");
                 
                 
                     bean_entity.insert_methods count_value=new insert_methods();
                    int count=count_value.count(machine);
                    
                    
                    if(count<1){
                    
                   int insert=database.db_connect.getData("insert into on_status_machines(machine_id,mould_code) values('"+machine+"','"+mould+"')");
                 
                   
                    }
                    
                    else{
                    
                    }
                 
                 }
            
           
                 
                 int update=database.db_connect.getData("update machine_status set status='on' where machine_id in(select machine_id from utilization_output) and status!='break_down'");
                 
                  
            
                  ResultSet rs1=database.db_connect.data("select machine_id,mould_code from on_status_machines");
                  
                  while(rs1.next()){
                  
                  String mould=rs1.getString("mould_code");
                  String machine=rs1.getString("machine_id");
                  
                  
                  
                  int delete=database.db_connect.getData("delete from utilization_output where machine_id='"+machine+"' and mould_code='"+mould+"'");
                  
                  }
                  
                  
                  
                  
            
            } catch (SQLException ex) {
                Logger.getLogger(A_start_machines.class.getName()).log(Level.SEVERE, null, ex);
            }
           
            
            
             RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/order_priority");
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
