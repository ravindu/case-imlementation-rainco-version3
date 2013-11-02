<%-- 
    Document   : view
    Created on : 12-May-2013, 14:15:30
    Author     : HP
--%>

<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.awt.List"%>
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

    font-size: 1.2em;
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

.para{
      font-family: Garamond;
      font-size: 16px;
       
     
}
 .list{
               
                  margin-left: 100px;
                  font-family: Garamond;
                  font-size: 16px;
                  background-color:#BEBEBE;
                  width: 650px;
                  height: 8px;  
                 
            }

 </style>   

  </head>
  <body>
        
    <FORM METHOD="" ACTION="" >
               
    <% 
        
 
        
        
     ArrayList rows = new ArrayList();
     ArrayList no_mould=new ArrayList();

       if (request.getSession().getAttribute("propertyList") != null) {
            rows = (ArrayList ) request.getSession().getAttribute("propertyList");
        }

      
      
     
       String abc=rows.toString().replace("[", ",").replace("]", ",");
   
        
        String []abc1=abc.split(",");
      
       
       for(int i=1;i<abc1.length;i++){
            
       
          
                
           
     out.print(" <input type='button' class='my_button' value="+abc1[i]+"  name="+abc1[i]+" onclick='send_page(this.name)'>  ");
   
            
       }
        
     
       
        
        no_mould=(ArrayList)request.getSession().getAttribute("no_moulds");
        out.print("<br/>");
        out.print("<br/>");
        out.print("<br/>");
         out.print("<br/>");
        out.print("<br/>");
       %> 
      
       <% if(no_mould.size()!=0){%>
       
       
       <img src="images/arrow.png" width="30px" height="30px">
       <span class="para">Following umbrellas do not have any moulds remaining</span>
      
        <%
        
        out.print("<br/>");
         out.print("<br/>");
        
        
      
        
   %>
        
    
	
         <%
          for(int x=0;x<no_mould.size();x++){
         %>
         
         <div class="list">
        <img src="images/umbrella.png" height="30px" width="30px"> <% out.println(no_mould.get(x)); %> Umbrella
        
        </div>
     
        <br/><br/>
        <% 
                    
          }
  }%>
    

          
    <div id="result"></div>
    
    </form>       

   
  
      
     
      
  </body>
</html>
