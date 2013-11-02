/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ActiveLog_retrieve", urlPatterns = {"/ActiveLog_retrieve"})
public class ActiveLog_retrieve_RC extends HttpServlet {
    private static final long serialVersionUID = -403250971215465050L;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {

            ResultSet rs1 = db_con.search("select * from Activelog");
            ResultSet rs2 = db_con.search("select * from Activelog");
            ResultSet rs3 = db_con.search("select * from Activelog");
            ResultSet rs4 = db_con.search("select * from Activelog");
            ResultSet rs5 = db_con.search("select * from Activelog");
            
            HttpSession session = request.getSession(true);
            
            session.setAttribute("dataset1", rs1);
            session.setAttribute("dataset2", rs2);
            session.setAttribute("dataset3", rs3);
            session.setAttribute("dataset4", rs4);
            session.setAttribute("dataset5", rs5);
            
            
            RequestDispatcher RD = request.getRequestDispatcher("/LogDetails_RC.jsp");
            RD.forward(request, response);


        } catch (Exception e) {
            System.out.println(e);
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
