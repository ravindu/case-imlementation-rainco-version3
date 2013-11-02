/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
 * @author DARSHI
 */
@WebServlet(name = "Runner_waste", urlPatterns = {"/Runner_waste"})
public class Runner_waste extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        //String query0="delete from runner_waste";
        //db_con.change(query0);
        
        try { 
            String All = request.getParameter("parameter1");
            //out.print(All);
            String[] date = All.split(":");
            //out.print(date[0]);
            
            String[] row = date[1].split(",");
            for(int i=0 ; i<=row.length ;i++)
            {
                String[] cell = row[i].split("-");
                //out.print(cell[0]);

                String query1= "insert into runner_waste(date,raw_material_code,quantity) values('"+date[0]+"','"+cell[0]+"','"+cell[1]+"')";
                db_con.change(query1);
                
                //db_con.search("select count (*) from inner_hub where raw_material_code ='"+cell[0]+"'"));
                ResultSet rs=db_con.search("select * from inner_hub where raw_material_code ='"+cell[0]+"'");
                int count=0;
                while(rs.next()){
                    count++;
                }
                //out.println(count);
                
                if(count==0){
                    String query3= "insert into inner_hub(raw_material_code,quantity) values('"+cell[0]+"','"+cell[1]+"')";
                    db_con.change(query3);
                    //out.println("insert");
                }
                else{
                    String query4 ="update inner_hub set quantity=quantity +'"+cell[1]+"' where raw_material_code ='"+cell[0]+"'";
                    db_con.change(query4);
                    //out.println("update");
                }
                                
            }      
         
        } 
         
        finally {   
                   
             //request.getRequestDispatcher("/Runner_waste.jsp").forward(request, response);
            //RequestDispatcher rd=request.getRequestDispatcher("/RW.jsp");
            //rd.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Runner_waste.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Runner_waste.class.getName()).log(Level.SEVERE, null, ex);
        }
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
