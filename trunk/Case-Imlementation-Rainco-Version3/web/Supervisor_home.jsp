

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.4.2.min.js" language="javascript" type="text/javascript"></script>
<script src="js/jquery-blink.js" language="javscript" type="text/javascript"></script>
<script type="text/javascript" src="js/script.js"></script>
<link href="css/notification.css" rel="stylesheet" type="text/css" media="all" />



<script type="text/javascript">

$(document).ready(function()
{
	$('.blink').blink();
});



</script>


<link rel="stylesheet" type="text/css" href="css/main.css"></link>




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



.letters{
    
    font-family: Garamond;
    font-size: 16px;
    font-weight: bold;
    color: #000;
    
}


.machines{
    
    font-family: Garamond;
    font-size: 16px;
    font-weight: bold;
    color: #000;
    margin-left: 100px;
    
}

</style>

</head>
<body>
  
   
    
  <%
 
      
     ArrayList machine_list=new ArrayList();
     ArrayList break_machines=new ArrayList();
     
     if(request.getSession().getAttribute("machine")!=null){
     machine_list=(ArrayList)request.getSession().getAttribute("machine");
     
     
     }
   
   
     
     if(request.getSession().getAttribute("break_machines")!=null){
     break_machines=(ArrayList)request.getSession().getAttribute("break_machines");
     
     
     }
     
     
     
 %>    
    
    
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
      
    </ul>
  </div>

<div class="heading-type-1">News and Specials</div>

<%
    if(machine_list.size()!=0){
     
 %>    
   
 
    <div class="blink">
    <div class="massage_image"></div>
    </div>
    <div class="left-inner">
        <div class="light-brown-twelve-font" style="font-weight:bold;"> view message  <a href="#" class="topopup" style="color:orange"> click here</a> <br /> <br />
    </div>
    
    
  </div>
 


 
<%     
     }  
 
   else if(break_machines.size()!=0){
     
 %>    
   
 
    <div class="blink">
    <div class="massage_image"></div>
    </div>
    <div class="left-inner">
        <div class="light-brown-twelve-font" style="font-weight:bold;"> view message  <a href="#" class="topopup" style="color:orange"> click here</a> <br /> <br />
    </div>
      
     
   
    


    
    <div class="bullet-link" style=" margin-top:10px;"><a href="" target="_blank"><strong>old message 1</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 2</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 3</strong></a></div>
    
  </div>
 


 
<%     
     }  
    
    
    if((machine_list.size()==0)&&(break_machines.size()==0)){
    
%>


<div class="massage_image"></div>
<div class="left-inner">
   <!-- <div class="light-brown-twelve-font" style="font-weight:bold;"> view message <a href="a" class="orange-twelve-link">click here</a>. <br /> <br />
    </div>
    <div class="bullet-link" style=" margin-top:10px;"><a href="" target="_blank"><strong>old message 1</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 2</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 3</strong></a></div>-->
    
  </div>
<%

    }
    
%>



   </div>
    <div class="middle-parent">
    	
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
              <li style="padding-left:0px;"><a href="Supervisor_home" class="selected">Home</a></li>
               <li><a href="assign_operator" >Operator<br/>Assigning</a></li>
              <li><a href="hourly_measure" >Employee <br/> Performance</a></li>
             
              <li><a href="RawMaterial_consumption.jsp" >Raw Material<br/>Consumption </a></li>
              <li><a href="Dye_consumption.jsp" >Dye Usage</a></li>
              <li style="border:none; padding-right:0px;"><a href="Runner_waste.jsp"  >Runner Wastage</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
      <h1>Supervisor Home Page</h1>
     
      
      
        <div id="toPopup"> 
    	
        <div class="close"></div>
       	<span class="ecs_tooltip">Press Esc to close <span class="arrow"></span></span>
		<div id="popup_content"> <!--your content start-->
            <p>
              <% if(machine_list.size()!=0){ %>  
               
              
              
              <span class="letters"> Following Machines need an employee assignment</span>
               <br>
                 
              <%
               
               
               for(int i=0;i<machine_list.size();i++){
               out.print("<div class='machines'>");
               out.println("<img src='images/machine.png' width='17px' height='17px'>");
               out.print(machine_list.get(i));
               out.print("<br/>");
               out.print("</div>");
               
               }  
              } 
               %>
             
                 
               <br/><br/><br/><br/>
               
             <% if(break_machines.size()!=0){ %>  
                
               <span class="letters">Following Machines have broken down.</span>
               <br>
                  <!-- <div class="machines">   --> 
               <%
               
               
               for(int i=0;i<break_machines.size();i++){
                out.print("<div class='machines'>");
               out.println("<img src='images/red_warn.jpg' width='17px' height='17px'>");
               out.print(break_machines.get(i));
               out.print("<br/>");
               out.print("</div>");
               
               }  
              } 
               %>   
                <!--</div>-->
              <br/><br/><br/><br/>  
            </p>
            
        </div> <!--your content end-->
    
    </div> <!--toPopup end-->
    
   
    
	<div class="loader"></div>
   	<div id="backgroundPopup"></div>


        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href="Supervisor_home.jsp" class="selected" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
               <a href="assign_operator" >Operator Assign</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="hourly_measure"  >Employee Performance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             
              <a href="RawMaterial_consumption.jsp" >Raw Material</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="Dye_consumption.jsp" >Dye Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="Runner_waste.jsp"  >Runner Wastage</a> 
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