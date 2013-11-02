/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import com.mysql.jdbc.ResultSet;
import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajitha
 */
@WebServlet(name = "production_chart_entering", urlPatterns = {"/production_chart_entering"})
public class production_chart_entering extends HttpServlet {

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
                
                
                String production_num = "";
                //comment the below for testing
                ResultSet pro_num;
            
                pro_num = (ResultSet) db_con.search("SELECT current_production.productionId from current_production");
                while (pro_num.next()) {                    
                    production_num = pro_num.getString("productionId");
                
                }
                
                
                int production_num1  = Integer.parseInt(production_num);
                production_num1++;
                production_num = String.valueOf(production_num1);
                
                db_con.change("UPDATE current_production set productionId = '"+production_num+"'");
                //***********************************************************************************************
                
               
                
                /* TODO output your page here. You may use following sample code. */
                //production chart goes to database.COMMENTED DATABASE INSERTON FOR TESTING
                
            //commented here to    
                          
           String total_order=request.getParameter("parameter1");
//            
           String[] order= total_order.split(":");
            
            String query1= "insert into order_date(order_number,date) values('"+production_num+"','"+order[0]+"')";
            db_con.change(query1);
            
            String[] row = order[1].split(",");
            for(int i=0 ; i<row.length ;i++)
            {
                String[] cell = row[i].split("-");
                
                if(cell[0].equals("")){
                }else{
//                out.println("umb_code - ");//um_code
//                out.println(cell[1]);//um_code
//                out.println("quantity - ");
//                out.println(cell[0]);//quantity
//                out.println("quantity - ");
//                out.println(cell[2]);//branch
//                out.println("<br/><br/>");
                
                String query2= "insert into production_order(order_number,quantity,branch_id,umbrella_code) values('"+production_num+"',"+cell[0]+","+cell[2]+",'"+cell[1]+"')";
                db_con.change(query2);
                }
               
            }
                
                //*****************************************************************************************here
                //displaying buffer levels to edit
                

                
                java.sql.ResultSet rs_buffer = db_con.search("select buffer_level.buffer_id,buffer_level.buffer_limit,remaining_quantity from buffer_level,production_order where order_number='"+production_num+"' and buffer_level.buffer_id=production_order.umbrella_code group by umbrella_code");
                HttpSession session = request.getSession(true);
                session.setAttribute("Buffer_Level_R", rs_buffer);
                
                
                RequestDispatcher rd = request.getRequestDispatcher("/set_buffer_levels.jsp");
                
                rd.forward(request, response);
                
                
            } catch (Exception ex) {
                System.out.println(ex);
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
