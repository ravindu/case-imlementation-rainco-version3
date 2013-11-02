package servlet_entity;



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import bean_entity.graph_generator;
import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.WriteAbortedException;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.SubCategoryAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryToolTipGenerator;
import org.jfree.chart.labels.StandardXYSeriesLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.urls.CategoryURLGenerator;
import org.jfree.chart.urls.StandardCategoryURLGenerator;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.TextAnchor;

/**
 *
 * @author HP
 */
@WebServlet(urlPatterns = {"/new_graph"})
public class new_graph extends HttpServlet {
int i;

    public void doGet(HttpServletRequest req,
                        HttpServletResponse resp)
            throws ServletException, IOException {
            genGraph(req, resp);
            

 
      }
 
      public void doPost(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {
            genGraph(req, resp);
      }
         
      public void genGraph(HttpServletRequest req,
                           HttpServletResponse resp) throws IOException {
          
         
          
      try {
          
              
          
            OutputStream out = resp.getOutputStream();
           
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
            
            ArrayList<bean_entity.mould_graph> list=new ArrayList();
            
            ResultSet rs=database.db_connect.data("select buffer_id,sum(quantity),umbrella_code from buffer,umbrella where umbrella_code=buffer_id group by buffer_id order by sum(quantity) asc ");
            
           
            while(rs.next()){
                
               int x=rs.getInt("sum(quantity)");
               //String x1=rs.getString("buffer_id");
               String x2=rs.getString("umbrella_code");
            
              
  
               list.add(new bean_entity.mould_graph(x2, x));
             
               
               //dataset.addValue(x, "umbrella_code", x2);
             
            
            }
              
           
            bean_entity.graph_generator chart1=new graph_generator();
 
          
          JFreeChart chart=chart1.createChart(list,"Umbrella_code","");

           
           
      
          resp.setContentType("image/png");
          ChartUtilities.writeChartAsPNG(out, chart,600,500);
     
 
  

   
       
         
      
            
     
      
      } catch (Exception e) {
      
         
              System.err.println(
      
              "Problem occurred creating chart." + e.getMessage());
            }
      }
 
}// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   // @Override
   // protected void doPost(HttpServletRequest request, HttpServletResponse response)
    //        throws ServletException, IOException {
     //   processRequest(request, response);
  //  }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
  //  @Override
  //  public String getServletInfo() {
    //    return "Short description";
   // }// </editor-fold>

