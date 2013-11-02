

<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" type="text/css" href="css/main.css">


  <script src="js/additional_request.js"></script>
   <script type="text/javascript" src="js/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="js/jHtmlArea-0.7.5.js"></script>
    <link rel="Stylesheet" type="text/css" href="css/jHtmlArea.css" />
    
    <style type="text/css">
       
        div.jHtmlArea .ToolBar ul li a.custom_disk_button 
        {
            background: url(images/disk.png) no-repeat;
            background-position: 0 0;
        }
        
        div.jHtmlArea { border: solid 1px #ccc; }
    </style>
    
    
     <script type="text/javascript">
        
        $(function() {
       
            $("textarea").htmlarea(); // Initialize jHtmlArea's with all default values
        });
    </script>
    
         
<style type="text/css">
             
    .bigtext {
    
    width:250px;
}
             
</style>   

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
                    margin-left: 110px;
                }



                .cover{
                    
                    width: 600px;
                    height: 600px;
                    border: solid #000 .1em;
                    margin-top: 100px;
                    margin-left: 32px;
                    padding-left: 40px;
                        
                    
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
<div class="left-inner">
   <div class="testimonials-main" style="padding-top:15px;">
      <div class="testimonials-1">Importaint awarenesses goes here</div>
      <div class="testimonials-2"></div>
      
   </div>
</div>
<div class="heading-type-1">News and Specials</div>
<div class="massage_image"></div>
<div class="left-inner">
    <div class="light-brown-twelve-font" style="font-weight:bold;"> view message <a href="a" class="orange-twelve-link">click here</a>. <br /> <br />
    </div>
    <div class="bullet-link" style=" margin-top:10px;"><a href="" target="_blank"><strong>old message 1</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 2</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 3</strong></a></div>
    
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
            <div class="cover">
      <br /> <br /><br /> 	
     
 <%
      
      
      Date date=(Date)request.getSession().getAttribute("date");
      String umbrella=(String)request.getSession().getAttribute("umbrella");
      String email=(String)request.getSession().getAttribute("email");
      int decision=(Integer)request.getSession().getAttribute("decision");
      int id=(Integer)request.getSession().getAttribute("id");
      
      out.print("<input type='hidden' name='hide' id='hide' value="+id+">");
       

      out.print("<table >");
     
      out.print("<tr>");
      out.print("<td>");
    
      out.print("Message Recipient"); 
    
      out.print("</td>");
       
 
       
      out.print("<td>");
      out.print("<input type='text' name='receiver' id='receiver' value='"+email+"'>");
      out.print("</td>");
      out.print("</tr>");
     
   
      out.print("<tr>");
      out.print("</tr>");
      
      
      
      out.print("<tr>");
      out.print("<td>");
      out.print("<br/>");
     
      out.print("Subject");
   
      out.print("</td>");
     
      
      
      out.print("<td>");
      out.print("<br/>");
      out.print("<br/>");
      
      out.print("<input type='text' name='umbrella' id='umbrella' class='bigtext' value='Request for the umbrella number "+umbrella+"'>"); 
      out.print("</td>");
      out.print("</tr>");
     
     
     
      out.print("<tr>");
      out.print("</tr>");
   
     
     
      
      out.print("<tr>");
      out.print("<td>"); 
   
      out.print("Message");
    
      out.print("</td>");
     
   
     if(decision==0){
         
         
        
         out.print("<td>");
     
       %>  
    <br/><br/><br/><br/>      
   <textarea id="tinyeditor" style="width: 400px; height: 200px">
    Dear Sir/Madam; 
    </br>
    We are sorry to inform you that we are unable to fulfill your request
    you have sent us on <%out.print(date);%> regarding the umbrella <% out.print(umbrella);%>.
    Please contact us for further details              
     </br>      
     Thank you!
   </textarea> 
    
    <label style="width: 2000px">
    <%     
      out.print("</td>");
     }
     
     else{
        out.print("<td>");   
         
   %>  
   
   <br/><br/><br/><br/>
   
   
    <textarea id="tinyeditor" style="width: 400px; height: 200px">
    Dear Sir/Madam;    
    </br>
    We are pleased to inform you that we can fulfill your request
    you have sent us on <%out.print(date);%> regarding the umbrella <% out.print(umbrella);%>.
                 
     <br/>      
     Thank you!
   </textarea>   
         
  <%     
         
     }
     
      out.print("</td>");
     
      out.print("</tr>");
     
      out.print("</table>");
      
      %>
      <br/>  
      <br/>
      
      <input type="button" class="buttonR" value="Send email" onclick="additional_request()">  
      
      
          
  <div id="display_email"></div>
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