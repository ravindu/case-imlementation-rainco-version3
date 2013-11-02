/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.additional_request;
import bean_entity.insert_methods;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "A_new_additional_request", urlPatterns = {"/A_new_additional_request"})
public class A_new_additional_request extends HttpServlet {

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
            ArrayList umbrella=new ArrayList();
            ArrayList branch =new ArrayList();
            ArrayList <bean_entity.additional_request> all=new ArrayList<bean_entity.additional_request>();
            
            
            try {
                ResultSet rs=database.db_connect.data("select umbrella_code from umbrella");
                
                while(rs.next()){
                
                String umbrella_code=rs.getString("umbrella_code");
                umbrella.add(umbrella_code);
             
                
                }
                
                
                
                ResultSet rs1=database.db_connect.data("select branch_name from branch");
                
                while(rs1.next()){
                
                String branch_name=rs1.getString("branch_name");
                branch.add(branch_name);
                
                  
                }
                
                
                
                ResultSet rs2=database.db_connect.data("select order_date,umbrella_code,branch_id,quantity,request_id from additional_request");
                
                
                while(rs2.next()){
                
                Date date=rs2.getDate("order_date");
                String umbrella_id=rs2.getString("umbrella_code");
                
                int branch_id=rs2.getInt("branch_id");
               
                bean_entity.insert_methods branch_name=new insert_methods();
                String name_of_branch=branch_name.show_branch(branch_id);
                 
                int quantity=rs2.getInt("quantity");
                int request_id=rs2.getInt("request_id");
                
                 all.add(new bean_entity.additional_request(date,umbrella_id,name_of_branch,quantity,request_id));
            
                }
                
                
                 request.getSession().setAttribute("all",all);     
                 request.getSession().setAttribute("umbrella",umbrella);
                 request.getSession().setAttribute("branch",branch);
                 RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_new_additional_request.jsp");
                 requestDispatcher.forward(request, response);  
            
                
                
           } catch (SQLException ex) {
                Logger.getLogger(additional_request.class.getName()).log(Level.SEVERE, null, ex);
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
