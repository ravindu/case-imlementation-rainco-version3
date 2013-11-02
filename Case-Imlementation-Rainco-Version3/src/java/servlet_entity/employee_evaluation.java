/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.employee_evaluation_helper;
import bean_entity.insert_methods;
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
@WebServlet(name = "employee_evaluation", urlPatterns = {"/employee_evaluation"})
public class employee_evaluation extends HttpServlet {

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
            ArrayList<bean_entity.employee_evaluation_helper> combination=new ArrayList<employee_evaluation_helper>();
            
            String mould=request.getParameter("q");
            try {
                ResultSet rs=database.db_connect.data("select employee_id,sum(quantity),sum(number_of_hours),sum(quantity)/ sum(number_of_hours) as rate from moulding_daily_employee_summary where mould_code='"+mould+"' group by employee_id  order by rate desc");
        
                while(rs.next()){
                
                String employee_id=rs.getString("employee_id");
                int rate=rs.getInt("rate");
             
                
                bean_entity.insert_methods emp=new insert_methods();
                String employee_name=emp.employee_name(employee_id);
                
                combination.add(new employee_evaluation_helper(rate,employee_name,employee_id));
                
                
                }
            
             request.getSession().setAttribute("mould",mould);
             request.getSession().setAttribute("collection",combination); 
             RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/employee_evaluation.jsp");
             requestDispatcher.forward(request,response);      
                
                
            
            } catch (SQLException ex) {
                Logger.getLogger(employee_evaluation.class.getName()).log(Level.SEVERE, null, ex);
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
