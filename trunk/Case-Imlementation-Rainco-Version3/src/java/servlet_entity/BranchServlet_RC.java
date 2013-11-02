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

@WebServlet(name = "BranchServlet", urlPatterns = {"/BranchServlet"})
public class BranchServlet_RC extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String status=request.getParameter("status");
       
        if(status.equals("true"))
        {
        try {
            String values=request.getParameter("id");
            ResultSet rs= db_con.search("select * from branch where branch_id='"+values+"'");
            String name = "",email="";
            while(rs.next())
            {
                name=rs.getString("branch_name");
                email=rs.getString("email");
                
            }
            out.println(name+":"+email);
            
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
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            
            
                db_con.change("update branch set branch_name='"+name+"',email='"+email+"' where branch_id='"+code+"'");
                out.println("update successfull");
                
                
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
        
        if(status.equals("false"))
        {
            try {
            
            String code=request.getParameter("code");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            
                db_con.submit("insert into branch values('"+code+"','"+name+"','"+email+"')");
                out.println("save successfull");
               
            
        } catch (Exception e) {
            System.out.println(e);
        }
       }   
        
        if(status.equals("delete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from branch where branch_id='"+code+"'");
             //out.println("delete successfull");
            
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
