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
@WebServlet(name = "vertual_innerhub_verify", urlPatterns = {"/vertual_innerhub_verify"})
public class vertual_innerhub_verify extends HttpServlet {

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
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
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
            String s = request.getParameter("reminings");
            
            String[] rows = s.split(",");

            //String[][] matrix = new String[rows.length][]; 
            //int r = 0;
            for(int i = 0;i<rows.length;i++){
                String[] cells = rows[i].split("-");
                db_con.change("update buffer_level set buffer_level.remaining_quantity = '"+cells[1]+"' where buffer_level.buffer_id = '"+cells[0]+"'");
                
            }
            ResultSet rs_v = null;
            try {
                rs_v = (ResultSet) db_con.search("select * from virtual_inner_hub");
                
            } catch (SQLException ex) {
                Logger.getLogger(vertual_innerhub_verify.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            HttpSession session = request.getSession(true);
            session.setAttribute("virtual_innerhub_R", rs_v);
            //response.sendRedirect("vertual_innerhub_display.jsp");
            
            RequestDispatcher rd2 = request.getRequestDispatcher("/vertual_innerhub_display.jsp");
            rd2.forward(request, response);
            
        } finally {            
            //out.close();
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
    }
    // </editor-fold>
}
