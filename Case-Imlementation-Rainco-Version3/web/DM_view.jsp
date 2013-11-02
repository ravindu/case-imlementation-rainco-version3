<%-- 
    Document   : DM_view
    Created on : 18-Jul-2013, 15:01:38
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            
        <script src="js/functions_page.js"></script>
        
  <style type="text/css">
    
          .my_button{
	position: relative;
        float: left;
    color: rgba(255,255,255,1);
    text-decoration: none;
    background-color: rgba(215, 127, 44, 0.9);
    font-family: 'Yanone Kaffeesatz';

    font-size: .8em;
    display: block;
    padding: 4px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;

-webkit-box-shadow: 0px 9px 0px rgba(192,192,192,192), 0px 6px 4px rgba(0,0,0,.7);

  
margin: 10px;
	width: 85px;
	text-align: center;
	
	-webkit-transition: all .1s ease;
	-moz-transition: all .1s ease;
	-ms-transition: all .1s ease;
	-o-transition: all .1s ease;
	transition: all .1s ease;
}

.my_button:active {
    -webkit-box-shadow: 0px 3px 0px rgba(222,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
    -moz-box-shadow: 0px 3px 0px rgba(222,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
    box-shadow: 0px 3px 0px rgba(222,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
  
    top: 6px;
}         
            
        </style>
        
    </head>
    <body>
         <FORM METHOD="" ACTION="" >
      <h1>          
    <% 
        
  
        
        
     ArrayList rows = new ArrayList();

       if (request.getSession().getAttribute("umbrella") != null) {
            rows = (ArrayList ) request.getSession().getAttribute("umbrella");
        }

     
       String abc=rows.toString().replace("[", ",").replace("]", ",");
      // out.print(abc);
         
       
        //String abc=rows.toString().replace("[", "").replace("]", "");
        //out.print(abc);
        
        String []abc1=abc.split(",");
        //String new_a=ab.toString();
        
      //  String abc1[]=new_a.split(",");
       out.print("<br><br>");
       for(int i=1;i<abc1.length;i++){
            
       
        //out.print("<button name="+abc1[i]+" onclick='send_DM(this.name)'>");
       // out.print(" <img src='images/amy.jpg' width='50' height='5'/> " );
     
        // out.print("<br/><strong>"+abc1[i]+"</strong>");
        // out.print("</button>");
                 
     out.print(" <input type='button' class='my_button' value="+abc1[i]+" name="+abc1[i]+" onclick='send_DM(this.name)' >");   
        
      // out.println("<input type=button name="+abc1[i]+" value="+abc1[i]+" onclick='send_DM(this.name)'>");
            
            
      
            
       }
        
        //out.print(request.getSession().getAttribute("propertyList"));
      
 %>
 
    </body>
</html>
