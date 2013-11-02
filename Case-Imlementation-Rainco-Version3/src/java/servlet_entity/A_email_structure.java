/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;

/**
 *
 * @author HP
 */
@WebServlet(name = "A_email_structure", urlPatterns = {"/A_email_structure"})
public class A_email_structure extends HttpServlet {

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
          
            String combine=request.getParameter("q");
            
            String split_combine[]=combine.split(",");
            
            int id=Integer.parseInt(split_combine[0]);
            int decision=Integer.parseInt(split_combine[1]);
            
            String umbrella="";
            String email="";
            int qty=0;
            Date date = null;
            int branch=0;
            
            try {
                ResultSet rs=database.db_connect.data("select order_date,umbrella_code,branch_id,quantity from additional_request where request_id="+id+"");
          
                while (rs.next()){
                
                date=rs.getDate("order_date");
                umbrella=rs.getString("umbrella_code");
                
                branch=Integer.parseInt(rs.getString("branch_id"));
              
                
                qty=rs.getInt("quantity");
                
                
                
                bean_entity.insert_methods branch_email=new bean_entity.insert_methods();
                email=branch_email.branch_email(branch);
                
                
                
                out.println(date);
                out.println(umbrella);
               
                out.println(email);
                
                
                }
            
           
                
                request.getSession().setAttribute("id",id);
                request.getSession().setAttribute("decision",decision);       
                request.getSession().setAttribute("date",date);
                request.getSession().setAttribute("umbrella",umbrella);
                request.getSession().setAttribute("email",email);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_email_structure.jsp");
                requestDispatcher.forward(request, response);       
                
                
            
            } catch (SQLException ex) {
                Logger.getLogger(A_email_structure.class.getName()).log(Level.SEVERE, null, ex);
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
