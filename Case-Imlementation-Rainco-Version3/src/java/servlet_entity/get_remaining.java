/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import com.mysql.jdbc.ResultSet;
import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajitha
 */
@WebServlet(name = "get_remaining", urlPatterns = {"/get_remaining"})
public class get_remaining extends HttpServlet {

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
            
                /* TODO output your page here. You may use following sample code. */
                String production_num = "";
                ResultSet pro_num;
            try {
                pro_num = (ResultSet) db_con.search("SELECT current_production.productionId from current_production");
                while (pro_num.next()) {                    
                    production_num = pro_num.getString("productionId");
                }
            } catch (SQLException ex) {
                Logger.getLogger(get_remaining.class.getName()).log(Level.SEVERE, null, ex);
            }
                
            
                    
            
            String s = request.getParameter("buffers");
            
            String[] rows = s.split(",");

            //String[][] matrix = new String[rows.length][]; 
            //int r = 0;
            for(int i = 0;i<rows.length;i++){
                String[] cells = rows[i].split("-");
                db_con.change("update buffer_level set buffer_level.buffer_limit = '"+cells[1]+"' where buffer_level.buffer_id = '"+cells[0]+"'");
                
            }
            java.sql.ResultSet rs_remaining = null;
            try {
                rs_remaining = db_con.search("select buffer_level.buffer_id,remaining_quantity from buffer_level,production_order where order_number='"+production_num+"' and buffer_level.buffer_id=production_order.umbrella_code group by umbrella_code");
            } catch (SQLException ex) {
                Logger.getLogger(get_remaining.class.getName()).log(Level.SEVERE, null, ex);
            }

            
            HttpSession session = request.getSession(true);
            session.setAttribute("virtual_remaining_R", rs_remaining);
            //response.sendRedirect("set_remaining.jsp");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("/set_remaining.jsp");
            rd1.forward(request, response);
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
