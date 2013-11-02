/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sajee
 */
@WebServlet(name = "UmbrellaServlet", urlPatterns = {"/UmbrellaServlet"})
public class UmbrellaServlet_RC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        String status=request.getParameter("status");
        
        if(status.equals("select"))
        {
        try {
            String values=request.getParameter("code");
            ResultSet rs= db_con.search("select * from umbrella where umbrella_code='"+values+"'");
            String name = "";
            while(rs.next())
            {
                name=rs.getString("colour");
                
            }
            out.println(name);
            
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
            
        }
        
         if(status.equals("update"))
        {
         try {
            
            String code=request.getParameter("code");
            String colour=request.getParameter("colour");
            
            
                db_con.change("update umbrella set colour='"+colour+"' where umbrella_code='"+code+"'");
                out.println("update successfull");
                
                
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
        
       if(status.equals("delete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from umbrella where umbrella_code='"+code+"'");
             out.println("delete successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
       
       if(status.equals("UMBMouldDelete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from mould_for_umbrella where umbrella_code='"+code+"'");
             out.println("delete successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
       
       if(status.equals("addUmbrella"))
        {
            try {
            
            String Ucode=request.getParameter("Umbcode");
            String colour=request.getParameter("colour");
           
            
            db_con.submit("insert into umbrella values('"+Ucode+"','"+colour+"')");
            db_con.submit("insert into buffer(buffer_id,quantity,dye_code) value('"+Ucode+"',0,'0')");
            db_con.submit("insert into buffer_level (buffer_level.buffer_id,buffer_level.buffer_limit,buffer_level.remaining_quantity) values ('"+Ucode+"','0','0')");
            out.println("Save successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
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
