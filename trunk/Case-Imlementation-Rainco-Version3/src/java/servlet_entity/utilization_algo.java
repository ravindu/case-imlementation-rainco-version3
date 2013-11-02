/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.employee_id;
import bean_entity.machine_availableTime;
import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajitha
 */
@WebServlet(name = "utilization_algo", urlPatterns = {"/utilization_algo"})
public class utilization_algo extends HttpServlet {

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
           
            database.db_con.change("truncate table utilization_output");
            
            ArrayList<machine_availableTime> machine_avilab_time = new ArrayList<machine_availableTime>();
           
            
            
                //get the machine list
                java.sql.ResultSet rs_machines;
            try {
                rs_machines = db_con.search("select machine.machine_id from machine");
                
                while (rs_machines.next()) {                    
                    machine_availableTime machine_time;
                    machine_time = new machine_availableTime(rs_machines.getString("machine_id"),0.0);
                    machine_avilab_time.add(machine_time);
                }
                /* TODO output your page here. You may use following sample code. */
               //get the moulds order to their priorities 
                java.sql.ResultSet rs_mould_priority = db_con.search("select order_priority.mould_code,mould.items_per_kg from order_priority,mould where order_priority.mould_code = mould.mould_code  ORDER BY  order_priority.order_number ASC");
                
                while (rs_mould_priority.next()) {                    
                    String mould = rs_mould_priority.getString("mould_code");
                    int per_kg = rs_mould_priority.getInt("items_per_kg");
                    get_compatible_machines(mould,per_kg,machine_avilab_time);
                    
                }
                
                
                
           ResultSet rs_utilize=database.db_connect.data("select machine_id,mould_code from utilization_output");
            
            
                
                
                
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Servlet utilization_algo</title>");            
//                out.println("</head>");
//                out.println("<body>");
//                int i=0;
//		for(machine_availableTime temp: machine_avilab_time){
//		   out.println(" " + ++i + " : " + temp.getMachine()+ ", next available time : " + temp.getAvailable_time());
//                   out.print("<br/>");
//		}
            
            /* TODO output your page here. You may use following sample code. */
            
                
//                out.println("</body>");
//                out.println("</html>");
                
                HttpSession session = request.getSession(true);
            session.setAttribute("utilize", rs_utilize);
            //response.sendRedirect("set_remaining.jsp");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("/utilize_table.jsp");
            rd1.forward(request, response);
               
            } catch (SQLException ex) {
                Logger.getLogger(utilization_algo.class.getName()).log(Level.SEVERE, null, ex);
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



private static void get_compatible_machines(String mould, int per_kg, ArrayList<machine_availableTime> machine_avilab_time) {
        try {
            java.sql.ResultSet compatible_machines = db_con.search("select mould_for_machine.machine_id, mould_for_machine.target from mould_for_machine where mould_for_machine.mould_code = '"+mould+"'");
            
            
            ArrayList<machine_availableTime> tempry_machine_avilab_time = new ArrayList<machine_availableTime>();
            
            
            while (compatible_machines.next()) {
                //machine target is no of kgs that a employee can produce for hour
                machine_availableTime ma =  get_machine_from_list(compatible_machines.getString("machine_id"),machine_avilab_time);
                //System.out.println(compatible_machines.getString("machine_id"));

                double time = get_duration(compatible_machines.getString("machine_id"),compatible_machines.getDouble("target"),per_kg,mould);
                
                double current_time = ma.getAvailable_time();
                double new_time = current_time+time;
                machine_availableTime mat = new machine_availableTime(ma.getMachine(), new_time);
                tempry_machine_avilab_time.add(mat);
                
                
            }
            
            
            //sorting the tempry array
            machine_availableTime[] ar =  new machine_availableTime[tempry_machine_avilab_time.size()];
            ar = tempry_machine_avilab_time.toArray(ar);
            Arrays.sort(ar, machine_availableTime.machineTimeComparator);
            //choose the 1st element. seach the machine object from machine available time
            set_updatedTime_List(ar[0].getMachine(),ar[0].getAvailable_time(),machine_avilab_time);
            
            //set the database table. mould for ar[0] th machine
            String db_m = ar[0].getMachine();
            db_con.submit("insert into utilization_output (machine_id,mould_code) values ('"+db_m+"','"+mould+"')");
            //System.out.println("mould"+mould+"****machine"+ar[0].getMachine());    
            
            
            //To change body of generated methods, choose Tools | Templates.
        } catch (SQLException ex) {
            
        }
    }
    private static double get_duration(String machine, double target, int per_kg,String mould) throws SQLException {
        
            java.sql.ResultSet c = db_con.search("select total_order.quantity from total_order,current_production where total_order.order_number = current_production.productionId and total_order.mould_code = '"+mould+"'");
            int qnt = 0;
            while (c.next()) {                
                qnt=c.getInt("quantity");
            }
            double need_kg = (double)qnt/per_kg;
            double time_in_hours = need_kg/target;
            
            return time_in_hours;
       
        
    }

    private static machine_availableTime get_machine_from_list(String m_code, ArrayList<machine_availableTime> machine_avilab_time) {
            for(machine_availableTime m : machine_avilab_time) {
	       if(m.getMachine().equals(m_code))
	          return m;
	    }
        
    throw new IllegalStateException();
    }

    private static void set_updatedTime_List(String machine, double available_time, ArrayList<machine_availableTime> machine_avilab_time) {
        //System.out.println("j");
        for(machine_availableTime m : machine_avilab_time) {
	       if(m.getMachine().equals(machine)){
                   m.setAvailable_time(available_time);
                   
                   
               }
	          
	    }
        
    }
}
