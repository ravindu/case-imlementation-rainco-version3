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
 * @author Ravindu
 */
@WebServlet(name = "EmployeeDetails_RC", urlPatterns = {"/EmployeeDetails_RC"})
public class EmployeeDetails_RC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String passStatus=request.getParameter("status");
        
        if(passStatus.equals("checkUserName"))
        {
            try 
            {
            
            String username=request.getParameter("User");
            ResultSet rs= db_con.search("select * from login");
            String availability="";
            while(rs.next())
            {
                String oldusers=rs.getString("username");
                if(oldusers.equals(username))
                {
                    availability="error";
                    break;
                    
                }
                if(!(oldusers.equals(username)))
                {
                    availability="ok";
                    
                } 
            }
                out.println(availability);
            } 
            catch (Exception e) 
            {
                
            }
        }
        
        if(passStatus.equals("SearchEMP"))
        {
            try 
            {
            
            String nic=request.getParameter("nic");
            ResultSet rs= db_con.search("select * from employee where employee_nic='"+nic+"'");
            String id="",name="",date="",type="";
            while(rs.next())
            {
                id=rs.getString("employee_id");
                name=rs.getString("employee_name");
                date=rs.getString("employee_join_date");
                type=rs.getString("employee_type");
                
            }
            out.println(id+":"+name+":"+date+":"+type); 
            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
        }
        
        if(passStatus.equals("delete"))
        {
         try {
            
            String code=request.getParameter("code");
            
            db_con.submit("delete from employee where employee_id='"+code+"'");
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
    }
}
