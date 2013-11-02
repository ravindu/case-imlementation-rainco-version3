/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sajee
 */
@WebServlet(name = "ActiveLogServlet", urlPatterns = {"/ActiveLogServlet"})
public class ActiveLogServlet_RC extends HttpServlet {
    private static final long serialVersionUID=-25363373888L;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        String status=request.getParameter("status");
        
        if(status.equals("add_activelog"))
        {
            try {
                String date=request.getParameter("date");
                String time=request.getParameter("time");
                String des=request.getParameter("des");
                String user=request.getParameter("user");
                String type=request.getParameter("type");
                
                db_con.change("insert into Activelog values('"+date+"','"+time+"','"+des+"','"+user+"','"+type+"')");
                out.println("Save successfull");
                
            } catch (Exception e) {
            }
        }
        
        if(status.equals("update_activelog"))
        {
            try {
                String date=request.getParameter("date");
                String time=request.getParameter("time");
                String des=request.getParameter("des");
                String user=request.getParameter("user");
                String type=request.getParameter("type");
                
                db_con.change("insert into Activelog values('"+date+"','"+time+"','"+des+"','"+user+"','"+type+"')");
                out.println("update successfull");
                
            } catch (Exception e) {
            }
        }
        
        if(status.equals("delete_activelog"))
        {
            try {
                String date=request.getParameter("date");
                String time=request.getParameter("time");
                String des=request.getParameter("des");
                String user=request.getParameter("user");
                String type=request.getParameter("type");
                
                db_con.change("insert into Activelog values('"+date+"','"+time+"','"+des+"','"+user+"','"+type+"')");
                out.println("delete successfull");
                
            } catch (Exception e) {
            }
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
