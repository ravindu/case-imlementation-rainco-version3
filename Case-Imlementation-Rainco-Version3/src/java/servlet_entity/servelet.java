package servlet_entity;



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import org.apache.catalina.User;
/**
 *
 * @author HP
 */

 


@WebServlet(urlPatterns = {"/servelet"})
public class servelet extends HttpServlet {

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
            
       
           
        String arrstr = null;
        String umbrella=null;
        int count=0;
        
        
    
        
        ResultSet rs=database.db_connect.data("select buffer_id,sum(quantity),umbrella_code from buffer,umbrella where umbrella_code=buffer_id group by umbrella_code order by sum(quantity) asc");
 
           
       ArrayList Rows = new ArrayList();
       ArrayList no_moulds=new ArrayList();

       while (rs.next()){  
           
       umbrella=rs.getString("umbrella_code");
           
       
//  ResultSet rs2=database.db_connect.data("select mould_code,umbrella_code,count(mould_code) from buffer, mould_for_umbrella where umbrella_code='"+umbrella+"' and mould_code =buffer_id");
      
  ResultSet rs2=database.db_connect.data("select mould_for_umbrella.umbrella_code,mould_for_umbrella.mould_code,sum(buffer.quantity) from mould_for_umbrella,buffer where mould_for_umbrella.umbrella_code='"+umbrella+"'  and  buffer.buffer_id=mould_for_umbrella.mould_code ");
       
       
       while(rs2.next()){
       
              count=rs2.getInt("sum(buffer.quantity)");
              
              
              if(count>0){
                Rows.add(rs2.getString("mould_for_umbrella.umbrella_code"));
                //out.print(rs2.getString("umbrella_code"));
              }
              
             else{
                  no_moulds.add(umbrella);
                  //out.print(umbrella);
              }
    
       }
       
      
      
       }
    
     request.getSession().setAttribute("propertyList",Rows);
      request.getSession().setAttribute("no_moulds",no_moulds);
      RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/view.jsp");
     requestDispatcher.forward(request,response);
            
            
           
            
            
        } catch (SQLException ex) {
            Logger.getLogger(servelet.class.getName()).log(Level.SEVERE, null, ex);
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
