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
@WebServlet(name = "A_process_request", urlPatterns = {"/A_process_request"})
public class A_process_request extends HttpServlet {

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
           
            int buffer_qty=0;
            int qty=0;
            String decision="";
            String id_received=request.getParameter("q");
            
            
            int id=Integer.parseInt(id_received);
           
            
            try {
                ResultSet rs=database.db_connect.data("select umbrella_code,quantity from additional_request where request_id="+id+"");
                
                
                while (rs.next()){
                
                String umbrella=rs.getString("umbrella_code");
                qty=rs.getInt("quantity");
                
                bean_entity.insert_methods buffer_quantity=new insert_methods();
                buffer_qty=buffer_quantity.get_buffer_quantity(umbrella);
                
                
                if(qty<=buffer_qty){
                decision="yes";
                    
                
                }
                
                else{
                
                decision="no";
                
                }
                
              
                
                }
                
           
                
                request.getSession().setAttribute("id",id);
                request.getSession().setAttribute("qty",qty);
                request.getSession().setAttribute("buffer_qty",buffer_qty);
                request.getSession().setAttribute("decision",decision);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_process_request.jsp");
                requestDispatcher.forward(request, response);      
                
                
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(A_process_request.class.getName()).log(Level.SEVERE, null, ex);
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
