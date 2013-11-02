/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.Mailer_RC;
import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sajee
 */
@WebServlet(name = "EmployeeDetailsAdd", urlPatterns = {"/EmployeeDetailsAdd"})
public class EmployeeDetailsAdd extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter(); 
       
        try {
                String id=request.getParameter("txt_id");
                String name=request.getParameter("txt_fullName");
                String address1=request.getParameter("txt_address1");
                String address2=request.getParameter("txt_address2");
                String fullAddress=address1+","+address2;
                String nic=request.getParameter("txt_nic");
                String phone=request.getParameter("txt_phoneNo");
                String email=request.getParameter("txt_email");
                String jdate=request.getParameter("txt_joindate");
                String designation=request.getParameter("select_desig");
                String user=request.getParameter("txt_user");
                String pass=request.getParameter("txt_Confirmpassword");
                
                
                db_con.change("insert into employee(employee_id,employee_name,employee_address,employee_nic,employee_type,employee_join_date,phone_number,employee_email) values('"+id+"','"+name+"','"+fullAddress+"','"+nic+"','"+designation+"','"+jdate+"','"+phone+"','"+email+"')");
                db_con.submit("insert into login values('"+user+"','"+pass+"','"+id+"','"+designation+"')"); 
                Mailer_RC.send(email,designation,user,pass);
                out.println("Employee registration successfull.Go and Check Email");
        } 
        catch (Exception e) 
        {
            System.out.println(e);
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
