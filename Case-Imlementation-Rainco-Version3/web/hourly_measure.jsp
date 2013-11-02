<%-- 
    Document   : hourly_measure
    Created on : 03-Aug-2013, 20:08:52
    Author     : HP
--%>

<%@page import="bean_entity.operator_assignment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script language="javascript" src="js/add_row.js"></script>
    </head>
    <body>
        <%
        
        ArrayList<operator_assignment> measurement=new ArrayList<operator_assignment>();
        measurement=(ArrayList<operator_assignment>)request.getSession().getAttribute("measure");
        
        
        ArrayList dye_code=new ArrayList();
        dye_code=(ArrayList)request.getSession().getAttribute("dye");
        
        
        
        out.print("<table border='1' name='measure' id='measure'>");
        
        out.print("<tr>");
        
        out.print("<th>");
        out.print("Employee Name");
        out.print("</th>");
       
    
        out.print("<th>");
        out.print("Mould");
        out.print("</th>");
    
    
        out.print("<th>");
        out.print("Machine");
        out.print("</th>");
    
        out.print("<th>");
        out.print("Dye Code");
        out.print("</th>");
    
       out.print("<th>");
       out.print("Quantity");
       out.print("</th>");
    
        
        
        out.print("</tr>");
        
        for(int i=0;i<measurement.size();i++){
        
       
            
            
        out.print("<tr>");  
        
        
       
       
      
        
        
        
        out.print("<td>");
        out.print("<input type='text' name='employee' id='employee' value='"+measurement.get(i).getEmployee_id()+"' readonly>");
        out.print("</td>");
            
      
        
        
        out.print("<td>");
        out.print("<input type='text' name='mould' id='mould' value='"+measurement.get(i).getMould_code()+"' readonly>");
        out.print("</td>");
        
        
        out.print("<td>");
        out.print("<input type='text' name='machine'  id='machine' value='"+measurement.get(i).getMachine_code()+"' readonly>");
        out.print("</td>");
        
        
        out.print("<td>");
        out.print("<select name='dye_code'>");
        out.print("<option value='0'>select dye</option>");
        
        for(int x4=0;x4<dye_code.size();x4++){
   
            out.print("<option value='"+dye_code.get(x4)+"'>" +dye_code.get(x4)+"</option>");
    
         }
    
        out.print("</select>");
        out.print("</td>");
        
        
        out.print("<td>");
        out.print("<input type='text' name='qty' id='qty' value=''>");
        out.print("</td>");
        
        
         out.print("<td style='visibility:hidden'>");
         out.print("<input type='hidden' name='emp' id='emp' value='"+measurement.get(i).getId()+"'>");
         out.print("</td>");
       
        
         out.print("<td>");
         out.print("<input type='button' value='click'>");
         
         out.print("</td>");
         
         
         
        out.print("</tr>");
      
        
       
        
        
        }
        
        
        
       
       
        out.print("</table>");
        
        
        
        %>
        
        <input type="button" value="Save Data" onclick="hourly_record()">
        
    </body>
</html>
