<%-- 
    Document   : on_status
    Created on : 24-Aug-2013, 17:49:13
    Author     : HP
--%>

<%@page import="bean_entity.machine_helper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style type="text/css">
         .box{ width:400px;
        padding:10px;
        border:5px solid gray;
        margin:10px;
        height:150px;
       
     }   
     
     
     
      .box1{ width:430px;
       
        border:1px solid gray;
         margin:10px;
        height:50px;
     }
     
     
     p
{
    background-color: #edb156;
    width:650px;
}


.content-2{
    
   
    
}
        
        </style>
    </head>
    <body>
       
        
        
        <%
        
        int count=(Integer)request.getSession().getAttribute("on_count");
        
        if(count>0){
        
        ArrayList<machine_helper> machine_list=new ArrayList();
        machine_list=(ArrayList)request.getSession().getAttribute("on_machines");
            
        
        %>
        
        
      

            <%
            
            for(int i=0;i<machine_list.size();i++){
            %>
            
            
            <p><strong>  Machine_<% out.print(machine_list.get(i).getMachine_id());%></strong></p>
            
             
                 <table>
                 <tr>
                     <td>Running Mould</td>
                     <td><% out.print(machine_list.get(i).getStatus());%></td>
                     </tr>
                     
                     <tr>
                     <td>Next Mould</td>
                     <td>1060_clip</td>
                     </tr>
                     
                  </table>   
                 
                  
            
            
            <%
            }
            
            %>
            
            
            
        
     <%
     
        }
        
        
     %>   
    </body>
</html>
