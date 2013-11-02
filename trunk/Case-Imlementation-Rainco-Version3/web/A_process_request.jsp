<%-- 
    Document   : A_process_request
    Created on : 17-Sep-2013, 19:16:35
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <script src="js/functions_page.js"></script>
          <script src="js/additional_request.js"></script>
              
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

.buttonR  {
                    background:url(images/button-reset.jpg) no-repeat left top;
                    width:100px;
                    word-spacing:-0.2px;
                    font-weight:bold;
                    color:#FFFFFF;
                    height:28px;
                    font-size:12px;
                    padding-bottom:3px;
                    cursor:pointer;
                    border-style:none;
                    cursor: pointer;
                }

.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}



</style>          
        
    </head>
    <body>
        
     
        <%
     
     
  String decision=(String)request.getSession().getAttribute("decision");
     int qty=(Integer)request.getSession().getAttribute("qty");
     int buffer_qty=(Integer)request.getSession().getAttribute("buffer_qty");
     int id=(Integer)request.getSession().getAttribute("id");
     int deci=0;
     
     if(decision.equals("yes")){
         out.print("<span class='imp'>");
         
         %>
         
          <img src="images/correct.png" width="40px" height="40px">
         <%
         out.print("Can proceed with the additional request");
         out.print("</span>");
         
         deci=1;
     }
     
     
      if(decision.equals("no")){
         out.print(" <span class='imp'>");
         %>
         
         <img src="images/warn.png" width="30px" height="30px">
     <%    out.print("  Can not proceed with the additional request");
           out.print("</span>");
           
           deci=0;
     }
     
     
      out.print("<br/>");
      out.print("<br/>");
      out.print("<br/>"); 
      
      out.print("<table  class='bordered'>");
      out.print("<thead>");
      
      out.print("<tr>");
      
      out.print("<th width='200px'>");
      out.print("The requested quantity");
      out.print("</th>");
      
       
      out.print("<th width='200px'>");
      out.print("Buffer quantity");
      out.print("</th>");
      
      out.print("</tr>");
      out.print("</thead>");
      
      
     
      
      out.print("<tr>");
      
      out.print("<td>");
      out.println(qty);
      out.print("</td>");
      
      out.print("<td>");
      out.println(buffer_qty);
      out.print("</td>");
      
      out.print("</tr>");
      
      
      
      out.print("</table>");
      
      
      out.print("<br/>");
      out.print("<br/>");
      
      out.print("<input type=button name='continue' id='continue' class='buttonR'  value='Continue' onclick='continue_page("+id+","+deci+")'>");
   
      
     %>
     
     <div id="display_email">
         
        
     </div>
    
    
        
    </body>
</html>
