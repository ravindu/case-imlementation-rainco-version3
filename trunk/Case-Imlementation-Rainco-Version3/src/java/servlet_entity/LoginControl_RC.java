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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sajee
 */
@WebServlet(name = "LoginControl_RC", urlPatterns = {"/LoginControl_RC"})
public class LoginControl_RC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            String x=request.getParameter("username").toString();
            String y=request.getParameter("password").toString();
            HttpSession session=request.getSession(true);
            
           if(x==null || "".equals(x) || y==null || "".equals(y))
            {
                response.sendRedirect("LoginPage.jsp");
            }
            
           else
            {
             try
            {
            ResultSet rs= db_con.search("select * from login");
            while(rs.next())
            {
                String user=rs.getString("username");
                String pass=rs.getString("password");
                String designation=rs.getString("employee_desig");
                
               /* if (!(x.equals(user)) || !(y.equals(pass)))
                {
                    response.sendRedirect("Errorpage_RC.jsp");
                }*/
                
                
                 if(x.equals(user) && y.equals(pass) && designation.equals("oic"))
                {
                    
                    session.setAttribute("userName",user);
                    response.sendRedirect("oic_home_raj");
                }
                else if (x.equals(user) && y.equals(pass) && designation.equals("mould supervisor"))
                {
                    
                    session.setAttribute("userName",user);
                   
                    response.sendRedirect("Supervisor_home.jsp");
                }
               else if (x.equals(user) && y.equals(pass) && designation.equals("machine operator"))
                {
                    
                    session.setAttribute("userName",user);
                    response.sendRedirect("maintenance_operator_home_h.jsp");
                }
                else
               {
                  // response.sendRedirect("Errorpage_RC.jsp");
               }
               
            } 
            
        } 
        catch (Exception e) {
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
