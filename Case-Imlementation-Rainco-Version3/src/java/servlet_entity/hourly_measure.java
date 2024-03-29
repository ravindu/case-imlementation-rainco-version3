/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.operator_assignment;
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
@WebServlet(name = "hourly_measure", urlPatterns = {"/hourly_measure"})
public class hourly_measure extends HttpServlet {

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
            ArrayList<operator_assignment>hourly_measure=new ArrayList<operator_assignment>();
            ArrayList dye=new ArrayList();
            
            try {
                
                ResultSet rs2=database.db_connect.data("select dye_code from dye");
                
                while(rs2.next()){
                
                 dye.add(rs2.getString("dye_code"));
                
                }
                
                
                ResultSet rs=database.db_connect.data("select machine_id,mould_code,employee_id from on_status_machines where employee_id!=''");
                
                
                while(rs.next()){
                String employee=rs.getString("employee_id");
                
                
                ResultSet rs1=database.db_connect.data("select employee_id,employee_name from employee where employee_id='"+employee+"'");
                
                
                    while(rs1.next()){
                       
                        String employee_name=rs1.getString("employee_name");
                        String machine=rs.getString("machine_id");
                        String mould=rs.getString("mould_code");
                        
                     
                     
                        
                        hourly_measure.add(new operator_assignment(machine,mould,employee_name,employee));
                        
                    }
                
                
                    
                }
                
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(hourly_measure.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            
            request. getSession().setAttribute("measure",hourly_measure);
            request. getSession().setAttribute("dye",dye);
          RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/hourly_measurement.jsp");
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
