package servlet_entity;



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import bean_entity.employee_id;
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
@WebServlet(urlPatterns = {"/order_priority"})
public class order_priority extends HttpServlet {

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
            
                
            ArrayList<bean_entity.employee_id> machine_mould=new ArrayList<employee_id>();
                
            ResultSet utilize=database.db_connect.data("select machine_id,mould_code from utilization_output");
            
            while(utilize.next()){
            
                String machine=utilize.getString("machine_id");
                String mould=utilize.getString("mould_code");
                
                machine_mould.add(new employee_id(machine, mould));
            
            
            }
            
                
                
             ResultSet rs= database.db_connect.data("select  mould_code from order_priority ");
               // ResultSet rs= database.db_connect.data("select distinct mould_code,temp1.umbrella_code from temp1,umbrella_priority where  temp1.umbrella_code=umbrella_priority.umbrella_code  group by mould_code  order by umbrella_priority.total_quantity asc");
                ArrayList Rows = new ArrayList();
                
                while(rs.next()){
                 
               // out.print(rs.getString("mould_code"));
                
                Rows.add(rs.getString("mould_code"));
                 
                
                }
      request.getSession().setAttribute("utilize",machine_mould);          
      request.getSession().setAttribute("order_priority",Rows);
      RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_show_order_priority.jsp");
      requestDispatcher.forward(request,response);   
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(order_priority.class.getName()).log(Level.SEVERE, null, ex);
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
