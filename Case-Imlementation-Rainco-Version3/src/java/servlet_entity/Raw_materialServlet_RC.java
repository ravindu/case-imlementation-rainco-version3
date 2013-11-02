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
 * @author Ravi
 */
@WebServlet(name = "rawMaterials", urlPatterns = {"/rawMaterials"})
public class Raw_materialServlet_RC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String status=request.getParameter("status");
        
        if(status.equals("true"))
        {
        try {
            String values=request.getParameter("id");
            ResultSet rs= db_con.search("select * from raw_material where raw_material_code='"+values+"'");
            String name = "";
            while(rs.next())
            {
                name=rs.getString("raw_material_name");
                
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
            String name=request.getParameter("name");
            
            
                db_con.change("update raw_material set raw_material_name='"+name+"' where raw_material_code='"+code+"'");
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
            String pureCode=code+"_"+"pure";
            String pureName=name+" "+"pure";
            String crushCode=code+"_"+"crush";
            String crushName=name+" "+"crush";
             
                db_con.submit("insert into raw_material values('"+pureCode+"','"+pureName+"')");
                db_con.submit("insert into raw_material values('"+crushCode+"','"+crushName+"')");
                db_con.submit("insert into virtual_inner_hub values('"+crushCode+"','0')");
                out.println("save successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
        } 
        
        if(status.equals("delete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.change("delete from raw_material where raw_material_code='"+code+"'");
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
