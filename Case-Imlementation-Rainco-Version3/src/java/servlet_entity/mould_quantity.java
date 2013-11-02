/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.graph_generator;
import bean_entity.mould_graph;
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
@WebServlet(name = "mould_quantity", urlPatterns = {"/mould_quantity"})
public class mould_quantity extends HttpServlet {

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
     
    try{
            
        
         OutputStream out = response.getOutputStream();
            // Create a simple Bar chart
            System.out.println("Setting dataset values");
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
 
            String mould=request.getParameter("q");
                
            ArrayList<bean_entity.mould_graph> my_list=new ArrayList();
            
            ResultSet rs;
            try {
                rs = database.db_connect.data("select buffer_id, sum(buffer.quantity) from buffer,mould_for_umbrella where mould_for_umbrella.mould_code=buffer.buffer_id and umbrella_code='"+mould+"' group by mould_code order by sum(buffer.quantity) asc");
           
            
            
            while(rs.next()){
                
               int x=rs.getInt("sum(buffer.quantity)");
               String x1=rs.getString("buffer_id");
              // String x2=rs.getString("umbrella_code");
            
              
              my_list.add(new mould_graph(x1, x));
               
               // String[] categoryNames = new String[] { x2 };
               
              // dataset.addValue(x, "umbrella_id", x1);
             
            
            }
              
           

           bean_entity.graph_generator chart1=new graph_generator();
 
          
           JFreeChart chart=chart1.createChart(my_list,"Mould_code","Mould stock level for the selected Umbrella");
    
 
         response.setContentType("image/png");
        ChartUtilities.writeChartAsPNG(out, chart,400,500);

        
         } catch (SQLException ex) {
                Logger.getLogger(mould_quantity.class.getName()).log(Level.SEVERE, null, ex);
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
