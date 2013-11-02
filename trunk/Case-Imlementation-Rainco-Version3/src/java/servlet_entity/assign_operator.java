/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.operator_assignment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "assign_operator", urlPatterns = {"/assign_operator"})
public class assign_operator extends HttpServlet {

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
             
            
                ArrayList <operator_assignment> mould_and_machine=new ArrayList<operator_assignment>();
                ArrayList employee=new ArrayList();
                ArrayList mould_code=new ArrayList();
            
                
            try {
//              
                
                
              //ResultSet rs2= database.db_connect.data("select utilization_output.machine_id,utilization_output.mould_code from utilization_output,machine_status  where utilization_output.machine_id=machine_status.machine_id and machine_status.status='on'  and utilization_output.machine_id not in (select machine_id from on_status_machines)group by utilization_output.machine_id ");
                
              ResultSet rs2=database.db_connect.data("select machine_id,mould_code,employee_id from on_status_machines where employee_id=''");
                
                
                while(rs2.next()){
                
                
                String machine=rs2.getString("machine_id");
                String mould=rs2.getString("mould_code");
                
                
             
                
                mould_and_machine.add(new operator_assignment(machine,mould));
                
                }
                
                
                ResultSet rs1=database.db_connect.data("select employee_name,employee_id from employee where employee_type='machine operator'  and employee_id not in (select employee_id from on_status_machines)");
                while(rs1.next()){
                String e=rs1.getString("employee_name");
                    
                   employee.add(rs1.getString("employee_name"));
                 
                
                }
                
                
               
                
                 ResultSet rs=database.db_connect.data("select distinct mould_code from moulding_daily_employee_summary ");
               
                    
                while(rs.next()){
                
                String mould=rs.getString("mould_code");
                
                mould_code.add(mould);
                
                
                }
                
                

                  
           request.getSession().setAttribute("mould",mould_code);    
           request.getSession().setAttribute("mould_and_machine",mould_and_machine);
           request.getSession().setAttribute("employee",employee);
           RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/A_assign_operator.jsp");
           requestDispatcher.forward(request, response);  
            
          
                
            } catch (SQLException ex) {
                Logger.getLogger(assign_operator.class.getName()).log(Level.SEVERE, null, ex);
            }
        

      
        } finally {            
            out.close();
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
