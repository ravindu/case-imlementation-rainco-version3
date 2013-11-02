/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_con;
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
 * @author Hasith
 */
@WebServlet(name = "sp_request_by_oic_h", urlPatterns = {"/sp_request_by_oic_h"})
public class sp_request_by_oic_h extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           String s = request.getParameter("param1");
           String date = "10";
           int sum = 0;
                        
           String[] rows = s.split(",");
                    
                    
           for(int i = 0;i<rows.length;i++)
           {
             String[] cells = rows[i].split("-");  
                        
             db_con.change("insert into spare_parts_request values('"+date+"','"+i+"',"
               + "'"+cells[1]+"','"+cells[3]+"')");
                         
             ResultSet rs=db_con.search("select * from spare_parts_stock where spare_part_id='"+cells[1]+"'");
                while(rs.next())
                {
                   String name = rs.getString("quantity");
                   int num = Integer.parseInt(name);
                   sum = num - Integer.parseInt(cells[2]);
                   
            
                }
                if(sum>0)
                 db_con.change("update spare_parts_stock set quantity = '"+sum+"' where spare_part_id = '"+cells[1]+"'  ");
                if(sum<0)
                {
                    int zero = 0;
                    db_con.change("update spare_parts_stock set quantity = '"+zero+"' where spare_part_id = '"+cells[1]+"'  ");
                }
           }
        
                        
        } finally {  
            response.sendRedirect("oic_home_h.jsp");  
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sp_request_by_oic_h.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sp_request_by_oic_h.class.getName()).log(Level.SEVERE, null, ex);
        }
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
