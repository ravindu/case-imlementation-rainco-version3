

<%@page import="bean_entity.machine_helper"%>
<%@page import="com.lowagie.text.Anchor"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" type="text/css" href="css/main.css">

    <script src="js/status.js"></script>


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




     p
{
    background-color: #edb156;
    width:650px;
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
      <li><a href="" >Sub_option_1</a></li>
      <li><a href="" >Sub_option_2</a></li>
      <li><a href="" >Sub_option_3</a></li>
      <li><a href="" >Sub_option_4</a></li>
      <li><a href="" >Sub_option_5</a></li>
      <li><a href="" >Sub_option_6</a></li>
      <li><a href="" >Sub_option_7</a></li>
      <li><a href="" >Sub_option_8</a></li>
      <li><a href="" >Sub_option_9</a></li>
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
              <li style="padding-left:0px;"><a href="" >Menu1</a></li>
              <li><a href="" >Menu2</a></li>
              <li><a href="" >Menu3</a></li>
              <li><a href="" >Menu4</a></li>
              <li style="border:none; padding-right:0px;"><a href=""  >Menu5</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
      
      
      
      Select Machine Status
      <select name="machine" id="machine" onchange="status(this.value)">
       
          <option value="on">On</option>
           <option value="available">Available</option>
            <option value="break_down">Break Down</option>
          
          
      </select>    
	
      <div id="display"></div>  
      
      <%
      
       ArrayList<machine_helper> on_machines=new ArrayList();
       on_machines=(ArrayList)request.getSession().getAttribute("on_machines");
      
    
            
            for(int i=0;i<on_machines.size();i++){
            %>
            
            
            <p><strong>  Machine_<% out.print(on_machines.get(i).getMachine_id());%></strong></p>
            
             
                 <table>
                 <tr>
                     <td>Running Mould</td>
                     <td><% out.print(on_machines.get(i).getStatus());%></td>
                     </tr>
                     
                     <tr>
                     <td>Next Mould</td>
                     <td>1060_clip</td>
                     </tr>
                     
                  </table>   
                 
                  
            
            
            <%
            }
            
            %>
            
            
      
   
      
     
      
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href=""  >Menu1</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu2</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu3</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu4</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu5</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu6</a> 
              </div>
              
              <div class="copyright"> � Copyright 2013 RAINCO (Pvt) Ltd. All rights reserved. <span  class="orange-text-twelve">Powered by </span><a href="http://www.rjt.ac.lk/" class="rjt" target="_blank">www.rjt.ac.lk</a> </div>
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