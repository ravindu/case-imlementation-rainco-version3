/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;


import bean_entity.summary_helper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "summary", urlPatterns = {"/summary"})
public class summary extends HttpServlet {

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
              ArrayList<summary_helper> summary=new ArrayList();
               
              //  String name[][]=new String[6][3];
                
                ResultSet rs= database.db_connect.data("select buffer.buffer_id,sum(buffer.quantity),remaining_quantity  from buffer,buffer_level where buffer_level.buffer_id=buffer.buffer_id and buffer_level.buffer_id in(select umbrella_code from production_order)group by buffer_id ");
           
             
                    
                while(rs.next()){
               
                String buffer_id=rs.getString("buffer.buffer_id");
                int qty =rs.getInt("sum(buffer.quantity)");
                int remaining=rs.getInt("remaining_quantity");
                 
                summary.add(new summary_helper(buffer_id,qty,remaining));
                
                 
            }
           //out.println(summary.size());
                
         
           
     
           
           
       
                request.getSession().setAttribute("mybean",summary);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/summary.jsp");
                requestDispatcher.forward(request,response);   
                
                
            } catch (SQLException ex) {
                Logger.getLogger(summary.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
        } finally {            
           // out.close();
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
