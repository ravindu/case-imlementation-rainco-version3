/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_entity;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.mysql.jdbc.ResultSet;
import database.db_con;
import java.io.IOException;
import java.sql.SQLException;
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
 * @author Rajitha
 */
@WebServlet(name = "pdf_genarating", urlPatterns = {"/pdf_genarating"})
public class pdf_genarating extends HttpServlet {

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
        response.setContentType("application/pdf");
            Document document = new Document(PageSize.A4,0,0,5,0);
            try{
                try {
                    PdfWriter.getInstance(document, response.getOutputStream()); // Code 2
                
			document.open();
			Image image = Image.getInstance("pdf_background.png");
                        image.setAlignment(Image.MIDDLE | Image.UNDERLYING); 
                        //image.scaleAbsolute(0, 0); 
                        //image.scaleToFit(100, 100); 
                        //image.setBorder(Image.BOX); 
                        //image.setBorderColor(new Color(20, 50, 40)); 
                        //image.setBorderWidth(6); 
                        image.scalePercent(25, 25);// for image resizing x and y 
                        //Chunk c = new Chunk(image, 80, 100); 
                        
                        
                        
                        
                        
                        document.add(image);
                        String pro_num = "";
                    try {
                        ResultSet rs = (ResultSet) db_con.search("select * from current_production");
                        while(rs.next()){
                            pro_num = rs.getString(1);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(pdf_genarating.class.getName()).log(Level.SEVERE, null, ex);
                    }
        
                      
                    PdfPTable table = new PdfPTable(1); // 3 columns.

                    
                    PdfPCell cell3 = new PdfPCell(new Paragraph("Cell 3"));
                    cell3.setPaddingTop(160);
                    cell3.setBorder(0);
                    
                    PdfPTable nestedTable = new PdfPTable(2);
                    PdfPCell nestedcell_date = new PdfPCell(new Paragraph("Date:"));
                    nestedcell_date.setColspan(2);
                    nestedcell_date.setPaddingBottom(10f);
                    nestedcell_date.setBorder(0);
                    nestedTable.addCell(nestedcell_date);
                    
                    PdfPCell nestedcell_num = new PdfPCell(new Paragraph("Production No:"));
                    nestedcell_num.setColspan(2);
                    nestedcell_num.setPaddingBottom(10f);
                    nestedcell_num.setBorder(0);
                    nestedTable.addCell(nestedcell_num);
                    
                    PdfPCell nestedcell_oic = new PdfPCell(new Paragraph("Authorized person:"));
                    nestedcell_oic.setColspan(2);
                    nestedcell_oic.setPaddingBottom(15f);
                    nestedcell_oic.setBorder(0);
                    nestedTable.addCell(nestedcell_oic);
                    
                    
                    PdfPCell nestedcell1 = new PdfPCell(new Paragraph("Raw Material"));
                    PdfPCell nestedcell2 = new PdfPCell(new Paragraph("Quantity"));
                    nestedcell1.setPaddingBottom(10f);
                    nestedcell2.setPaddingBottom(10f);
                    nestedTable.addCell(nestedcell1);
                    nestedTable.addCell(nestedcell2);
                    
                    cell3.addElement(nestedTable);

                    
                    table.addCell(cell3);
                    
                    document.add(table);

                    document.close();          
			
			// Code 4
			//document.add(table);
                        
			document.close(); 

                 } catch (DocumentException ex) {
                     System.out.println(ex);
                }
                
            
        } finally {            
            
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
