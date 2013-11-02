<%-- 
    Document   : other_status
    Created on : 24-Aug-2013, 18:15:35
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           
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
        
        ArrayList machine_list=new ArrayList();
        machine_list=(ArrayList)request.getSession().getAttribute("other_machines");
            
        
        
        %>
        
        
         
             <div class="box">
                <img src="images/machine.jpg" width="350" height="150">
                
                
            </div><br>
        <p><strong> The List Machinery</strong></p>
        
           <%
            
            for(int i=0;i<machine_list.size();i++){
                
            %>
        
         
            <div class="box1">
                 <table>
                 <tr>
                     <td><% out.print(machine_list.get(i));%></td>
                    
                     </tr>
                     
                  </table>   
                 
             </div>
            
            
            
            
            
            
            
        <%
            }
        }
        
        
        else{
        
        out.print("No machines to display");
        }
        %>
        
    </body>
</html>
