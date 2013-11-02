/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.insert_methods;
import bean_entity.performance_helper;
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
@WebServlet(name = "employee_rate", urlPatterns = {"/employee_rate"})
public class employee_rate extends HttpServlet {

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
          ArrayList<performance_helper> details= new ArrayList<performance_helper>();
            
            
            try {
                ResultSet rs=database.db_connect.data("select machine_id,mould_code,employee_id from on_status_machines");
                
                while(rs.next()){
                
                   
                String machine=rs.getString("machine_id");
                String mould=rs.getString("mould_code");
                String employee=rs.getString("employee_id");
                
                
              
                
                
                bean_entity.insert_methods emp=new insert_methods();
                String employee_name=emp.id(employee);
                
                
                out.print(employee_name);
                
                bean_entity.insert_methods in=new insert_methods();
                float result=in.target(machine,mould,employee);
               
              
                
                
                bean_entity.insert_methods production=new insert_methods();
                float to_produce=production.to_be(machine,mould,employee);
                float final_answer= Math.round((to_produce * 100) / 100);
               
                
                bean_entity.insert_methods produced=new insert_methods();
                float product=  produced.produced(machine, mould, employee);
               
                
               bean_entity.insert_methods should=new insert_methods();
               float should_produce=should.should_produce(machine, mould, employee);
               
                
            details.add(new performance_helper(employee_name, result, should_produce, product, final_answer));
                
                
              
                }
                
                
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(employee_rate.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            
     request.getSession().setAttribute("data",details);
     RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_employee_target.jsp");
     requestDispatcher.forward(request,response);
            
//            
            
        
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
