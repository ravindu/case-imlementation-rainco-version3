<%-- 
    Document   : A_show_request
    Created on : 17-Sep-2013, 15:40:56
    Author     : HP
--%>

<%@page import="bean_entity.additional_request"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        
       
<style>

/*body {
    width: 600px;
    margin: 40px auto;
    font-family: 'trebuchet MS', 'Lucida sans', Arial;
    font-size: 14px;
    color: #444;
}

table {
    
    border-spacing: 0;
    width: 100%;    
}
*/
.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #f3ddba;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #f3ddba, #f3ddba);
    background-image:    -moz-linear-gradient(top, #f3ddba, #f3ddba);
    background-image:     -ms-linear-gradient(top, #f3ddba, #f3ddba);
    background-image:      -o-linear-gradient(top, #f3ddba, #f3ddba);
    background-image:         linear-gradient(top, #f3ddba, #f3ddba);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 0px 0 0 0;
    -webkit-border-radius: 0px 0 0 0;
    border-radius: 0px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 0px 0 0;
    -webkit-border-radius: 0 0px 0 0;
    border-radius: 0 0px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 0px 0px 0 0;
    -webkit-border-radius: 0px 0px 0 0;
    border-radius: 0px 0px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 0px;
    -webkit-border-radius: 0 0 0 0px;
    border-radius: 0 0 0 0px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 0px 0;
    -webkit-border-radius: 0 0 0px 0;
    border-radius: 0 0 0px 0;
}

.my{
                
                height: 25px;
                width: 120px;
                background-color:#DEDEDE;
                color: #555555;
                border-radius:7px;
               /* border: solid #ccd0d5 .4em;*/
                font-family: Times new roman;
                font-size: 14px;
                
            }



</style>
    </head>
    <body>
      
 <%  
        
 ArrayList<bean_entity.additional_request> all=new ArrayList<additional_request>();
   all=(ArrayList)request.getSession().getAttribute("all");
   
   

  
   out.print("<table  class='bordered'>");
   out.print("<thead>");
   out.print("<tr>");
  
   out.print("<th width='100px'>");
   out.print("Requested Date");
   out.print("</th>");
   
   
   out.print("<th width='100px'>");
   out.print("Umbrella Code");
   out.print("</th>");
   
   
   
   out.print("<th width='100px'>");
   out.print("Branch Name");
   out.print("</th>");
   
   
   out.print("<th width='100px'>");
   out.print("Quantity");
   out.print("</th>");
   
   
   out.print("<th>");
   out.print("</th>");
   
   out.print("</tr>");
   out.print("</thead>");
   for(int i=0;i<all.size();i++){
     
    
   out.print("<tr>");
   
   
   out.print("<td style='display:none'>");
   out.print("<input type='hidden' name='hide' id='hide"+i+"' value='"+all.get(i).getRequest_id()+"'>");
   out.print("</td>");
   
    
   
   out.print("<td>");
   out.print(all.get(i).getDate());
   out.print("</td>");
   
   out.print("<td>");
   out.print(all.get(i).getUmbrella());
   out.print("</td>");
   
   
   out.print("<td>");
   out.print(all.get(i).getBranch());
   out.print("</td>");
   
   
   out.print("<td>");
   out.print(all.get(i).getQuantity());
   out.print("</td>");
   
   
   out.print("<td>");
   out.print("<input type='button' value='Process Request'  class='my' name='process' id='process' onclick='process_request("+i+")'>");
   out.print("</td>");
   
   
   
   out.print("</tr>");
  
   }
    
 
   out.print("</table>");
 
 
    %>
      
    </body>
</html>
