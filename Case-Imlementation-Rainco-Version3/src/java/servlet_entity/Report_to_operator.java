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
 * @author Hasith
 */
@WebServlet(name = "Report_to_operator", urlPatterns = {"/Report_to_operator"})
public class Report_to_operator extends HttpServlet {

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
            String Mn_ID = request.getParameter("txt_Mn_ID");
            String Brk_date = request.getParameter("txt_Brk_Date");
            String Mc_ID = request.getParameter("txt_Mc_ID");
            String Comment = request.getParameter("Comment");
            String Rec_Date = "";
            String person = "Kamal";
            String msg_status = "no";
            String Status = "Breakdown";
                
            db_con.change("insert into machine_maintenance values('"+Mn_ID+"','"+Brk_date+"',"
                        + "'"+Rec_Date+"','"+Comment+"','"+person+"','"+Mc_ID+"','"+msg_status+"')");
            
            db_con.change("update machine_status set status = '"+Status+"' where machine_id = '"+Mc_ID+"'  ");
            
       
        } finally {
            request.getRequestDispatcher("report_to_machine_operator_by_oic.jsp").forward(request, response);
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
