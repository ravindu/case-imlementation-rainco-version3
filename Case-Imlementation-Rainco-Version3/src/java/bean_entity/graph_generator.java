/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import java.awt.Color;
import java.util.List;
import org.jfree.chart.ChartFactory;
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
public class graph_generator {
    public static JFreeChart createChart(List<mould_graph> li,String type,String head) {
  DefaultCategoryDataset dataset = new DefaultCategoryDataset();
    for(int i=0;i<li.size();i++){
        String name = li.get(i).getMould_name();
        int val = li.get(i).getX();
       
        dataset.addValue(val,type,name);
    }
    
   
    
JFreeChart chart= ChartFactory.createBarChart3D(head,type,"Quantity", dataset, PlotOrientation.VERTICAL,true, true, false);

chart.setBackgroundPaint(Color.white);

      chart.setBackgroundPaint(Color.white);
     
      // Set the background colour of the chart
      chart.getTitle().setPaint(Color.BLACK);
     
      
      // Adjust the colour of the title
      CategoryPlot plot = chart.getCategoryPlot();
     
     
      
      
      
      
      // Get the Plot object for a bar graph
     

      plot.setBackgroundPaint(Color.DARK_GRAY);

      plot.setBackgroundPaint(Color.decode("#fcfdfe"));      

      plot.setRangeGridlinePaint(Color.ORANGE);
      CategoryItemRenderer renderer = plot.getRenderer();
     
      
      renderer.setSeriesPaint(0, Color.decode("#006400"));
     
    // renderer.setSeriesPaint(1, Color.green);
     
   // CategoryPlot categoryPlot = chart.getCategoryPlot();
    BarRenderer br = (BarRenderer) plot.getRenderer();
    br.setMaximumBarWidth(.06);
    plot.getDomainAxis().setCategoryMargin(0);
      

return chart;
}

}
