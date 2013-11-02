

<%@page import="bean_entity.additional_request"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" type="text/css" href="css/main.css"></link>

  <script src="js/add_request.js"></script>
  <script src="js/functions_page.js"></script>

        
  
  

<style type="text/css">
.left-parent {
	background:#9c8f7f url(images/left-right-bg-form.jpg) repeat-x left 167px;
	height:1000px;
}
.right-parent {
	background:#9c8f7f url(images/left-right-bg-form_new.jpg) repeat-x left 134px;
	height:1100px;
}
.button  {
	background:url(images/button-form.jpg) no-repeat left top;
	width:210px;
}



form span.imp{ color:#FF0000;}

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}

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

</style>
        
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

            .imp{
                
                font-family: Garamond;
                font-size: 16px;
                
            }

</style>       
        
      

</head>
<body>
<noscript style="width:100%; height:100%;">
	<div style=" position:fixed; top: 0px; left: 0px; background:#222222; opacity:0.7; width:100%; height:100%; z-index: 10000;">
    </div>
    <div  style="position:fixed; width:100%; height:100%;z-index: 10000;">
    <div style=" padding:5px; border:2px #0000FF solid; background:#FFFFFF; color:#000000; font:large bold; width:400px; margin:200px auto; text-align:center;z-index: 10001;" >
        <p align="justify" style="margin:0">Your browser doesn't support JavaScript or you have disabled JavaScript. You have to either <strong>update your browser</strong> or <strong>enable javascript</strong> on it  in order to use this form.</p>
		<br />
        <a href="<?php echo $_SERVER['HTTP_REFERER']; ?>" target="_self">Go Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://support.microsoft.com/gp/howtoscript" target="_blank">How to enable JavaScript</a>
    </div>
    </div>
</noscript>


<div class="parent-div">
  <div class="wrapper-div">
  
  
    <div class="left-parent">
      <div class="header-left">
   <div class="logo"></div>
   </div>
   <div class="bucket-menu">
    <ul>
      <li><a href="Production_chart.jsp" >New Chart</a></li>
      <li><a href="A_new_additional_request" class="selected">Additional Requests</a></li>
      
    </ul>
  </div>



   </div>
    <div class="middle-parent">
    	
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
              <li style="padding-left:0px;"><a href="oic_home_raj"    >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="Production_chart.jsp" class="selected">New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
           <div style="padding-left: 30px">
      <br /> <br /><br /> 	
     
      <h1>Additional Requests</h1>
      <br/><br/>
      
<%
     
      
      ArrayList umbrella=new ArrayList();
      umbrella=(ArrayList)request.getSession().getAttribute("umbrella");
      
      
      ArrayList branch=new ArrayList();
      branch=(ArrayList)request.getSession().getAttribute("branch");
     
      out.print("<table >"); 
     
      out.print("<tbody>");
     
      out.print("<tr>");
      out.print("<td bgcolor=' #f3ddba' width='150px'>");
      out.print("Umbrella Code");
      
     
      out.print("</td>");
     
      out.print("<td>"); 
      out.print("<select name='umbrella' id='umbrella' style='width: 150px'>");         
      
     for(int i=0;i<umbrella.size();i++){
     
      out.print("<option value="+umbrella.get(i)+">"+umbrella.get(i)+"</option>");
     
     
     
     }
     
  
     out.print("</select>");  
     out.print("</td>");
    
     out.print("</tr>");
    
     out.print("<tr>");;
    
     out.print("<td bgcolor=' #f3ddba'>"); 
     out.print("Branch Name");
     out.print("</td>");
     
     out.print("<td>");
     out.print("<select name='branch' id='branch' style='width: 150px'>");         
      
     for(int i=0;i<branch.size();i++){
     
         out.print("<option value="+branch.get(i)+">"+branch.get(i)+"</option>");
     
     
     
     }
     
    out.print("</select>");  
    out.print("</td>");
    out.print("</tr>");
     
     
    out.print("<tr>");
    out.print("<td bgcolor='  #f3ddba'>");
    out.print("Quantity");;
    out.print("</td>");
    
    out.print("<td>");
    out.print("<input type='text' value='' name='qty' id='qty' style='width: 146px'>");
    
    out.print("</td>");
    out.print("</tr>");
     
    out.print("</tbody>");
    out.print("</table>");
     
     
     out.print("<br/>");
     out.print("<br/>");
     
   %>
   
   
   
   
   <input type="button"  class="buttonR" name="add" id="add" value="ADD" onclick="request()"/>
     
   <br/><br/><br/><br/><br/>
   
   <h1>Process Request</h1>
 
   <br/><br/>
   
	 <div id="request_table">
        
    <%
        
     
        
   
 ArrayList<bean_entity.additional_request> all=new ArrayList<additional_request>();
   all=(ArrayList)request.getSession().getAttribute("all");
   
   if(all.size()!=0){
   
  
  out.print("<table class='bordered'>");
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
   out.print("<input type='button' value='Process Request' class='my' name='process' id='process' onclick='process_request("+i+")'>");
   out.print("</td>");
   
   
   
   out.print("</tr>");
  
   }
    
   
   out.print("</table>");
 
   }
   
   else{
   }
    
 
    %>
         </div>         
             
    </div> 
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href="oic_home_raj"   >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="machine_status" >Machine Status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="oic_home_h.jsp"  >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="Production_chart.jsp" class="selected">New Chart</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="AdminTools_home_RC.jsp">Administrative Tools</a>
              </div>
              
              <div class="copyright"> © Copyright 2013 RAINCO (Pvt) Ltd. All rights reserved. <span  class="orange-text-twelve">Powered by </span><a href="http://www.rjt.ac.lk/" class="rjt" target="_blank">www.rjt.ac.lk</a> </div>
            
            
      </div>
    </div>
    </div>
        <div class="right-parent">
          <!--<div class="header-right">
            
            
          </div>-->
          
          
        </div>
  
</div>
</div>
</body>


</html>