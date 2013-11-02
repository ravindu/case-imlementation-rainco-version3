/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "operator_save", urlPatterns = {"/operator_save"})
public class operator_save extends HttpServlet {

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
               Calendar cal = Calendar.getInstance();
           cal.getTime();
           SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");         
           String now_time=sdf.format(cal.getTime());   
            
            
         
          String result=request.getParameter("q");
          
       
          
           String []final_result=result.split("-");
           
         bean_entity.insert_methods.insert_time(final_result[0],now_time);
              try {
              
               
              
                    
                 ResultSet rs = database.db_connect.data("select employee_id from employee where employee_name='"+final_result[2]+"'");
              
              
                 while(rs.next()){
                  
                String employee_id=rs.getString("employee_id");
        
//                
                
             //  bean_entity.insert_methods.insert_performance(final_result[0],final_result[1],employee_id);
                //delete from on status machine  
             //   int performance=database.db_connect.getData("insert into on_status_machines(machine_id,mould_code,employee_id)values('"+final_result[0]+"','"+final_result[1]+"','"+employee_id+"')");
               
                int performance=database.db_connect.getData("update  on_status_machines set employee_id='"+employee_id+"' where machine_id='"+final_result[0]+"' and mould_code='"+final_result[1]+"'");
                
            // 
                 
                  }
              
              
              
              } catch (SQLException ex) {
                  Logger.getLogger(operator_save.class.getName()).log(Level.SEVERE, null, ex);
              }
          
            
       
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/assign_operator");
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
