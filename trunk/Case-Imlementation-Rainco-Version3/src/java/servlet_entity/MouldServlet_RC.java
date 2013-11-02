/*
 * To change this template, choose Tools | Templates
 * and open the temmsplate in the editor.
 */
package servlet_entity;

import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "MouldServlet", urlPatterns = {"/MouldServlet"})
public class MouldServlet_RC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String status=request.getParameter("status").toString();
        
        if(status.equals("addmould"))
        {
            try {
            
            String id=request.getParameter("code1");
            String name=request.getParameter("name1");
            double runner=Double.parseDouble(request.getParameter("runner1").toString());
            String capa=request.getParameter("capa1");
            double items;
            items = Double.parseDouble(request.getParameter("items1").toString());
            
            db_con.submit("insert into mould values('"+id+"','"+name+"','"+runner+"','"+capa+"','"+items+"')");
            
            add_to_buffer(id);
             
            out.println("Save successfull");
            
            } catch (Exception e) {
            System.out.println(e);
            }
        
        }
        
        if(status.equals("MouldUmbrella"))
        {
            try {
            
            String Umbcode=request.getParameter("Umbcode");
            String Moucode=request.getParameter("mouCode");
            int qty=Integer.parseInt(request.getParameter("quantity"));
            
            db_con.submit("insert into mould_for_umbrella values('"+Umbcode+"','"+Moucode+"','"+qty+"')");
            out.println("Save successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        }
        
        
        
        if(status.equals("updateMould"))
        {
        try {
            
            String code=request.getParameter("code");
            String name=request.getParameter("name");
            String runner=request.getParameter("runner");
            String capa=request.getParameter("capa");
            String items=request.getParameter("items");
            
             
                db_con.submit("update mould set mould_name='"+name+"',runner_waste='"+runner+"',mould_capacity='"+capa+"',items_per_kg='"+items+"' where mould_code='"+code+"'");
                out.println("update successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
        
        if(status.equals("selectMould"))
        {
            try {
            
            String mouldcode=request.getParameter("Mid");
            ResultSet rss=db_con.search("select * from mould where mould_code='"+mouldcode+"'");
            String name="",runner="",capa="",items="";
            while(rss.next())
            {
                name=rss.getString("mould_name");
                runner=String.valueOf(rss.getString("runner_waste"));
                capa=rss.getString("mould_capacity");
                items=String.valueOf(rss.getString("items_per_kg"));
            
            }
            out.println(name+":"+runner+":"+capa+":"+items);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        }
        
        if(status.equals("MouldDelete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from mould where mould_code='"+code+"'");
             out.println("delete successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
        if(status.equals("UMBMouldDelete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from mould_for_umbrella where mould_code='"+code+"'");
             out.println("delete successfull");
            
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

    private void add_to_buffer(String id) {
        try {
            ResultSet rs= database.db_con.search("select dye_code from dye");
            
            while(rs.next()){
            
                String dye=rs.getString("dye_code");
                
                db_con.submit("insert into buffer (buffer_id,quantity,dye_code) values('"+id+"',0,'"+dye+"')");
                
                
        
            }
        } catch (SQLException ex) {
            Logger.getLogger(MouldServlet_RC.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }
}
