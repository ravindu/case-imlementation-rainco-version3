/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.insert_methods;
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
@WebServlet(name = "A_bullet_chart", urlPatterns = {"/A_bullet_chart"})
public class A_bullet_chart extends HttpServlet {

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
            
            ArrayList<machine_helper>mould_quantity=new ArrayList<machine_helper>();
            try {
                ResultSet rs=database.db_connect.data("select mould_code,sum(quantity) from moulding_daily_production_summary where mould_code in(select mould_code from on_status_machines) group by mould_code");
               
                
                while(rs.next()){
                
                    
                    
                String mould_code=rs.getString("mould_code");
                int qty=rs.getInt("sum(quantity)");
                
                
              //  bean_entity.insert_methods quantity=new  bean_entity.insert_methods.percentage(qty,mould_code);
                
                 insert_methods quantity=new insert_methods();
                 int total_quantity=quantity.percentage(qty, mould_code);
                
                
                 insert_methods rate=new insert_methods();
                 int completed_rate=rate.calculate_rate(qty,mould_code);
                 
                 
                
                mould_quantity.add(new machine_helper(mould_code,qty,total_quantity,completed_rate));
                
                }
               
                
                
                
                     
        
           request.getSession().setAttribute("mould_qty",mould_quantity);
           RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_bullet_chart.jsp");
           requestDispatcher.forward(request, response);  
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(A_bullet_chart.class.getName()).log(Level.SEVERE, null, ex);
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
