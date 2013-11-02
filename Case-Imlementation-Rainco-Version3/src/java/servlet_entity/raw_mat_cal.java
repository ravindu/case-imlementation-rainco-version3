/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import bean_entity.NewInterface;
import bean_entity.NewMain1_raj;
import bean_entity.display_r_m_q;
import bean_entity.raw_m_final;
import bean_entity.set_umb_quantity;
import bean_entity.umb_color_wise;
import com.mysql.jdbc.ResultSet;
import database.db_con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "raw_mat_cal", urlPatterns = {"/raw_mat_cal"})
public class raw_mat_cal extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            //umbrella quantity table should be cleared
            
            
            try {
                //********************************************************************************
                //set vertual innerhub
                //********************************************************************************
            //umbrella quantity table should be cleared. disable for testing.
                db_con.change("TRUNCATE TABLE umbrella_quantity");
            //raw_material_needed table is cleared before inserting new data   
                db_con.change("TRUNCATE TABLE raw_material_needed");
            //total_order table is cleared before inserting new data   
                db_con.change("TRUNCATE TABLE total_order");
                //**********************************test   
                String production_num = "";
                ResultSet pro_num;
            try {
                
         
                pro_num = (ResultSet) db_con.search("SELECT current_production.productionId from current_production");
                while (pro_num.next()) {                    
                    production_num = pro_num.getString("productionId");
                }
            } catch (SQLException ex) {
                Logger.getLogger(get_remaining.class.getName()).log(Level.SEVERE, null, ex);
            }
                
                
            String s = request.getParameter("innerhub");
            
            String[] rows = s.split(",");

            
            for(int i = 0;i<rows.length;i++){
                String[] cells = rows[i].split("-");
                db_con.change("update virtual_inner_hub set virtual_inner_hub.remaining_quantity = '"+cells[1]+"' where virtual_inner_hub.raw_material = '"+cells[0]+"'");
                
            }
                
                
                
                
                
             //get the umbrella quantity
            set_umb_quantity um = new set_umb_quantity(production_num);
            um.set_chart();
            
            java.sql.ResultSet rs = db_con.search("select umbrella_quantity.umbrella_code,umbrella_quantity.quantity,umbrella.colour from umbrella_quantity,umbrella where umbrella_quantity.umbrella_code=umbrella.umbrella_code");
            while (rs.next()){
            String umbrella_code = rs.getString("umbrella_code");
            String colour = rs.getString("colour");
            int umb_quantity = rs.getInt("quantity");
            if(umb_quantity>0){
            new umb_color_wise(umbrella_code, colour, umb_quantity);
            }
            }
            
            //setect sum of quantities - raw material type and colour type
           ResultSet rs2 = (ResultSet) db_con.search("select raw_material,colour,total_quantity,runner_waste from raw_material_needed");
           NewInterface ni = new display_r_m_q();
           List<raw_m_final> result_list = new display_r_m_q().rm_cal(rs2);
           //**************************************************************************test
           
           
           //mould priority table setting by removing the previous content
           
           db_con.change("truncate table mould_priority");
           db_con.change("truncate table umbrella_priority");
           
           //*****************amila
//           
//           ResultSet mould_nt_in_buffer = (ResultSet) db_con.search("select total_order.mould_code,quantity from total_order where total_order.mould_code not in (select buffer.buffer_id from buffer)");
//           int i = 0;     
//           while (mould_nt_in_buffer.next()) {                    
//                   i++; 
//                }
//           
//           if(i!=0){
//               mould_nt_in_buffer.beforeFirst();
//               while (mould_nt_in_buffer.next()) {
//                   
//                   String mould_c = mould_nt_in_buffer.getString("total_order.mould_code");
//                   int qnt = mould_nt_in_buffer.getInt("quantity");
//                   
//                   db_con.submit("insert into mould_priority (mould_code,priority) values ('"+mould_c+"',"+qnt+")");
//                }
//           }
//           
           
           
           
           
           
           
           ResultSet umbrella=(ResultSet) database.db_connect.data("select production_order.umbrella_code,sum(production_order.quantity)/remaining_quantity  as priority from  production_order,buffer_level where production_order.umbrella_code=buffer_level.buffer_id group by umbrella_code order by priority desc");
           
           while(umbrella.next()){
           
               String umbrella_code=umbrella.getString("production_order.umbrella_code");
               float priority=umbrella.getFloat("priority");
               
              
               
              int insert=database.db_connect.getData("insert into umbrella_priority (umbrella_code,total_quantity)values('"+umbrella_code+"',"+priority+")");
               
               
           }
           
           
             
           ResultSet mould=(ResultSet) database.db_connect.data("select buffer_id,total_order.quantity/ sum(buffer.quantity)as priority from  buffer,total_order where mould_code=buffer_id group by mould_code order by priority desc");
           
           while(mould.next()){
           
               String mould_code=mould.getString("buffer_id");
               float mould_priority=mould.getFloat("priority");
               
              
             int insert_mould=database.db_connect.getData("insert into mould_priority (mould_code,priority)values('"+mould_code+"',"+mould_priority+")");
               
               
           }
           
           
           
           
           
           // umbrella priority
           
           
           
           
           //*****************************************************************************************
            
           HttpSession session = request.getSession(true);
           session.setAttribute("MySessionVariable", result_list);
           
           
           RequestDispatcher rd3 = request.getRequestDispatcher("/raw_material_display.jsp");
           rd3.forward(request, response);
           
            
            
        } catch (Exception ex) {
            System.out.println(ex);
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

//private void display_resut(List<raw_m_final> li2) {
//        for(int i=0;i<li2.size();i++){
//            System.out.print(li2.get(i).getRm());
//            System.out.print("---");
//            System.out.println(li2.get(i).getTotal());
//        
//        }
//        
//    }

}

