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


@WebServlet(name = "MachineServlet", urlPatterns = {"/MachineServlet"})
public class MachineServlet_RC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String status=request.getParameter("status");
       
        if(status.equals("SelectMachine"))
        {
        try {
            String values=request.getParameter("id");
            ResultSet rs= db_con.search("select * from machine where machine_id='"+values+"'");
            String htime="",rtime="",elec="";
            while(rs.next())
            {
                htime=rs.getString("heating_time");
                rtime=rs.getString("response_time");
                elec=rs.getString("electricity");
                
            }
            out.println(htime+":"+rtime+":"+elec);
            
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
            
        }
        
        if(status.equals("update"))
        {
        try {
            
            String id=request.getParameter("id");
            String htime=request.getParameter("htime");
            String res=request.getParameter("rtime");
            String elec=request.getParameter("elec");
            
             
                db_con.submit("update machine set heating_time='"+htime+"',response_time='"+res+"',electricity='"+elec+"' where machine_id='"+id+"'");
                out.println("update successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
        
        if(status.equals("addMachine"))
        {
        try {
            
            String id1=request.getParameter("id").toString();
            String htime1=request.getParameter("htime").toString();
            String res1=request.getParameter("rtime").toString();
            String elec1=request.getParameter("elec").toString();
            
             
                db_con.change("insert into machine(machine_id,heating_time,response_time,electricity) values('"+id1+"','"+htime1+"','"+res1+"','"+elec1+"')");
                db_con.change("insert into machine_status values('"+id1+"','available')");
                out.println("save successfull");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
        
        if(status.equals("delete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from machine where machine_id='"+code+"'");
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
