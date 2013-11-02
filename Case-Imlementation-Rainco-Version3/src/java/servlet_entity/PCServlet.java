/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * @author DARSHI
 */
@WebServlet(name = "PCServlet", urlPatterns = {"/PCServlet"})
public class PCServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        try {
            
            //String date=request.getParameter("dat");           
            String total_order=request.getParameter("parameter1");
            //out.println(total_order);
            String[] order= total_order.split(":");
            //out.println(order[0]);
            String query1= "insert into order_date(order_number) values('"+order[0]+"')";
            db_con.change(query1);
            
            String[] row = order[1].split(",");
            for(int i=0 ; i<=row.length ;i++)
            {
                String[] cell = row[i].split("-");
                
                //out.println(cell[0]);//quantity
                //out.println(cell[1]);//um_code
                //out.println(cell[2]);//branch
                
                String query2= "insert into production_order(order_number,quantity,branch_id,umbrella_code) values('"+order[0]+"','"+cell[0]+"','"+cell[2]+"','"+cell[1]+"')";
                db_con.change(query2);
               
            }
        } finally {    
            
//             request.getRequestDispatcher("/Production_chart.jsp").forward(request, response);
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
