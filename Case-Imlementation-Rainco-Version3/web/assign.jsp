<%-- 
    Document   : assign
    Created on : 07-Aug-2013, 14:46:34
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean_entity.operator_assignment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script language="javascript" src="js/add_row.js"></script>
         
         
    </head>
    <body>
    <%
    
    ArrayList<operator_assignment> machine=new ArrayList();
    machine=(ArrayList)request.getSession().getAttribute("machine");
    
   
   ArrayList emp=new ArrayList();
       emp=(ArrayList)request.getSession().getAttribute("emp");
       
              
       
       
       out.print("<table border='1' name='myTable' id='myTable'>");
       
       
       out.print("<tr>");
       
       out.print("<td>");
       out.print("Machine");
       out.print("</td>");
       
       
       
       out.print("<td>");
       out.print("Mould");
       out.print("</td>");
               
               
       out.print("<td>");
       out.print("Employee");
       out.print("</td>") ;       
       
       out.print("</tr>");
       
       for(int i=0;i<machine.size();i++){
           
       out.print("<tr>");    
           
       out.print("<td>");    
       out.print("<input type='text' name='machine' id='mould' value='"+machine.get(i).getMachine_code()+"' readonly>");    
       out.print("</td>");
     
       
       out.print("<td>");    
       out.print("<input type='text' name='machine' id='mould' value='"+machine.get(i).getMould_code()+"' readonly>");    
       out.print("</td>");
     
       
    out.print("<td>");
    out.print("<select name='machine_id'>");
    out.print("<option value='0'>select Employee</option>");
    for(int x3=0;x3<emp.size();x3++){
   
    out.print("<option value='"+emp.get(x3)+"'>" +emp.get(x3)+ "</option>");
    
    }
    
    out.print("</select>");
    out.print("</td>");
    
           
       out.print("</tr>");    
       
       
       }
       
       out.print("</table>");
    
    
    %>
    
    
       <input type="button" value="Update" onclick="update()">
    </body>
</html>
