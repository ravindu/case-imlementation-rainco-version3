package servlet_entity;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import bean_entity.graph_generator;
import bean_entity.mould_graph;
import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author HP
 */
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

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
   
      
     public void doGet(HttpServletRequest req,
                        HttpServletResponse resp)
            throws ServletException, IOException {
            Graph(req, resp);
 
      }
 
      public void doPost(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {
            Graph(req, resp);
      }
         

         
     public void Graph(HttpServletRequest req,
                           HttpServletResponse resp) throws IOException {
         
        // 
         
      try {
     
                  
          OutputStream out = resp.getOutputStream();
            // Create a simple Bar chart
            System.out.println("Setting dataset values");
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
 
            String mould=req.getParameter("q");
                
            ArrayList<bean_entity.mould_graph> my_list=new ArrayList();
            
            ResultSet rs=database.db_connect.data("select mould_priority.mould_code,mould_priority.priority from mould_priority,mould_for_umbrella,buffer where umbrella_code='"+mould+"' and mould_priority.mould_code=mould_for_umbrella.mould_code and  mould_for_umbrella.mould_code=buffer_id group by mould_code order by mould_priority.priority desc  ");
            
            
            while(rs.next()){
                
               int x=rs.getInt("mould_priority.priority");
               String x1=rs.getString("mould_code");
              // String x2=rs.getString("umbrella_code");
            
              
              my_list.add(new mould_graph(x1, x));
               
               // String[] categoryNames = new String[] { x2 };
               
              // dataset.addValue(x, "umbrella_id", x1);
             
            
            }
              
           

           bean_entity.graph_generator chart1=new graph_generator();
 
          
           JFreeChart chart=chart1.createChart(my_list,"Mould_code","Mould priority level for the selected Umbrella");
    
 
     resp.setContentType("image/png");
     ChartUtilities.writeChartAsPNG(out, chart,400,500);
      
       
//      
//   req.getSession().setAttribute("person",chart);
//      ServletContext context = getServletContext();
//      RequestDispatcher dispatcher = context.getRequestDispatcher("/sub_chart.jsp");
//                dispatcher.forward(req,resp);
      
      } catch (Exception e) {
      System.err.println(
      "Problem occurred creating chart." + e.getMessage());
            }
      }
     
   
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
  

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   

