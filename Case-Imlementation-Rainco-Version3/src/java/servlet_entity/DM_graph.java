/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.graph_generator;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author HP
 */
@WebServlet(name = "DM_graph", urlPatterns = {"/DM_graph"})
public class DM_graph extends HttpServlet {

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
       
        try {
          
            OutputStream out = response.getOutputStream();
           
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
            
            ArrayList<bean_entity.mould_graph> list=new ArrayList();
            
            ResultSet rs;
            try {
                rs = database.db_connect.data("select umbrella_code,total_quantity from umbrella_priority order by total_quantity desc");
           
            
           
            while(rs.next()){
                
               int x=rs.getInt("total_quantity");
               String x2=rs.getString("umbrella_code");
            
              
  
               list.add(new bean_entity.mould_graph(x2, x));
             
               
               //dataset.addValue(x, "umbrella_code", x2);
             
            
            }
            
            
            
            bean_entity.graph_generator chart1=new graph_generator();
 
          
           JFreeChart chart=chart1.createChart(list,"Umbrella_code","");

      
          response.setContentType("image/png");
          ChartUtilities.writeChartAsPNG(out, chart,500,600);
     
 
            
            
            
            } catch (SQLException ex) {
                Logger.getLogger(DM_graph.class.getName()).log(Level.SEVERE, null, ex);
            } 
        } finally {            
           // out.close();
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
