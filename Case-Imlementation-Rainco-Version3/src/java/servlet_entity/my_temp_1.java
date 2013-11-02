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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "my_temp_1", urlPatterns = {"/my_temp_1"})
public class my_temp_1 extends HttpServlet {

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
         
            insert_methods in=new insert_methods();
            
    
            
            ResultSet rs;
            try {
                rs = database.db_connect.data("select distinct umbrella_code from temp");
            
            
            while(rs.next()){
            
            String umbrella=rs.getString("umbrella_code");
            
            ResultSet r=database.db_connect.data("select  temp.mould_code from temp ,mould_priority where umbrella_code='"+umbrella+"' and mould_priority.mould_code=temp.mould_code order by mould_priority.priority desc");
           
            while(r.next()){
             String mould=r.getString("mould_code");
             
             
            insert_methods.insert(mould);
            
            
            }
            
            }  
            
            ResultSet rs1=database.db_connect.data("select distinct mould_code from order_tempory");
            
            while(rs1.next()){

                    String mould_code=rs1.getString("mould_code");
    
      
                    insert_methods.insert_into_order_priority(mould_code);
      
      
        
    
     }
          
            
            
         
            } catch (SQLException ex) {
                Logger.getLogger(my_temp_1.class.getName()).log(Level.SEVERE, null, ex);
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
