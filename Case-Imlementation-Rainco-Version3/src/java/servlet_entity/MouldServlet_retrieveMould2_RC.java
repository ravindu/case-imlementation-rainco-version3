/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sajee
 */
@WebServlet(name = "MouldServlet_retrieveMould2", urlPatterns = {"/MouldServlet_retrieveMould2"})
public class MouldServlet_retrieveMould2_RC extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String status=request.getParameter("status");
        try {
            String Ucode=request.getParameter("Ucode");
            String Mcode=request.getParameter("Mcode");
            int qty=Integer.parseInt(request.getParameter("qty"));
            
            db_con.submit("insert into mould_for_umbrella values('"+Ucode+"','"+Mcode+"','"+qty+"')");
            out.println("successfull");
        } 
        catch (Exception e) {
            System.out.println(e);
        }
        
        
        if(status.equals("checkUmbCode"))
        {
        try {
            String values=request.getParameter("Umbcode");
            ResultSet rs= db_con.search("select * from umbrella");
            String availability="";
            while(rs.next())
            {
                String code=rs.getString("umbrella_code");
                if(code.equals(values))
                {
                    availability="error";
                    break;
                    
                }
                if(!(code.equals(values)))
                {
                    availability="ok";
                    
                } 
            }
           out.println(availability);
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }}
        
        
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
