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
import database.db_con;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLEngineResult.Status;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Hasith
 */
@WebServlet(name = "mnt_request_oic_pdf_h", urlPatterns = {"/mnt_request_oic_pdf_h"})
public class mnt_request_oic_pdf_h extends HttpServlet {

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
            throws ServletException, IOException, DocumentException {
        
            response.setContentType("application/pdf");
            Document document = new Document(PageSize.A4,0,0,0,0);
            
            String sss = request.getParameter("param3");// get the request id
         

        try {
            
                    PdfWriter.getInstance(document,new FileOutputStream("D:\\Test"+sss+".pdf"));
                   
//                    PdfWriter.getInstance(document, response.getOutputStream());
			//***************************************************
                    document.open();
	            Image image = Image.getInstance("rainco.png");
                    image.setAlignment(Image.MIDDLE | Image.UNDERLYING);                       
                    image.scalePercent(25, 25);// for image resizing x and y                                   
                    document.add(image);
                                          
                    PdfPTable table = new PdfPTable(1); // 3 columns.

                    
                    PdfPCell large_cell = new PdfPCell(new Paragraph("large cell"));
                    large_cell.setPaddingTop(160);
                    large_cell.setBorder(0);
                    
                    //**************************************************************************
                    Calendar currentDate = Calendar.getInstance();
                    SimpleDateFormat formatter= 
                    new SimpleDateFormat("yyyy/MMM/dd");
                    String dateNow = formatter.format(currentDate.getTime());
                    //**************************************************************
                    
                    PdfPTable nestedTable = new PdfPTable(2);
                    
                    PdfPCell nestedcell_date = new PdfPCell(new Paragraph("Date:"));
                    PdfPCell nestedcell_date_val = new PdfPCell(new Paragraph(dateNow));
                    
                    nestedcell_date_val.setPaddingBottom(10f);
                    nestedcell_date_val.setBorder(0);
                    nestedcell_date.setPaddingBottom(10f);
                    nestedcell_date.setBorder(0);
                    nestedTable.addCell(nestedcell_date);
                    nestedTable.addCell(nestedcell_date_val);
                    
                    String ss = request.getParameter("param3");
                    PdfPCell nestedcell_id = new PdfPCell(new Paragraph("Request ID :"));
                    PdfPCell nestedcell_id_val = new PdfPCell(new Paragraph(ss));
                    
                    nestedcell_id_val.setPaddingBottom(10f);
                    nestedcell_id_val.setBorder(0);
                    nestedcell_id.setPaddingBottom(10f);
                    nestedcell_id.setBorder(0);
                    nestedTable.addCell(nestedcell_id);
                    nestedTable.addCell(nestedcell_id_val);
                    
                    
                    PdfPCell nestedcell1 = new PdfPCell(new Paragraph("Spare Part Name"));
                    PdfPCell nestedcell2 = new PdfPCell(new Paragraph("Quantity"));
                    nestedcell1.setPaddingBottom(15f);
                    nestedcell2.setPaddingBottom(15f);
                    nestedTable.addCell(nestedcell1);
                    nestedTable.addCell(nestedcell2);
                    //******************************************************************
                    
                    String s = request.getParameter("param1");
                        
                    String[] rows = s.split(",");
                   
                    for(int i = 0;i<rows.length;i++)
                    {
                        String[] cells = rows[i].split("-");                       
                          
                        PdfPCell loop_1 = new PdfPCell(new Paragraph(cells[0]));
                        PdfPCell loop_2 = new PdfPCell(new Paragraph(cells[1]));
                        loop_1.setPaddingBottom(10f);
                        loop_2.setPaddingBottom(10f);
                        nestedTable.addCell(loop_1);
                        nestedTable.addCell(loop_2);    
                    }
                                 
                    //*******************************************************************
                    large_cell.addElement(nestedTable);

                    
                    table.addCell(large_cell);
                        //*****************************************************
                    
			document.add(table);
                        
			document.close(); 

                 } catch (DocumentException ex) {
                     System.out.println(ex);
                }
        try {
            String Maintenance_ID = request.getParameter("param4");
            String Status = "Send To OIC";
            
            db_con.change("insert into spare_parts_operator values('"+sss+"','"+Maintenance_ID+"','"+Status+"')");
           
//          request.getRequestDispatcher("requset_from_oic_h.jsp").forward(request, response);
            response.sendRedirect("maintenance_operator_home_h.jsp");   
            
            
        } catch (Exception e) {
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
            try {
                processRequest(request, response);
            } catch (DocumentException ex) {
                Logger.getLogger(mnt_request_oic_pdf_h.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception ex) {
            Logger.getLogger(mnt_request_oic_pdf_h.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (DocumentException ex) {
                Logger.getLogger(mnt_request_oic_pdf_h.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception ex) {
            Logger.getLogger(mnt_request_oic_pdf_h.class.getName()).log(Level.SEVERE, null, ex);
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

    private void printStackTrace(Exception e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
