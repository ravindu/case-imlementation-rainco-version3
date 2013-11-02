
<%@page import="java.sql.ResultSet"%>
<%@page import="database.db_con"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <% 
    
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("userName")==null)
  {
  response.sendRedirect("LoginPage.jsp");
  }
  

%>
    <link href="css_1/jquery_notification.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="js/jquery_v_1.4.js"></script>
    <script type="text/javascript" src="js/jquery_notification_v.1.js"></script>


        <script type="text/javascript">
                                function msg_show(){
                                    showNotification({
                                        type : "error",
                                        message: "You have new messages received."
                                    });    
                                }                                
        </script>
<script>
        
        function msg_click(passId)
        {
           var id=passId; 
           //alert(id);
           document.location.href = "message_from_oic_h?param1="+id; 
        }
        
</script>
    
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" type="text/css" href="css/main.css">




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



</style>


<title>View Message From OIC</title>
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
        <li><a href="maintenance_operator_home_h.jsp" >Home</a></li>
      
    </ul>
  </div>
<div class="left-inner">
   <div class="testimonials-main" style="padding-top:15px;">
      <div class="testimonials-1"></div>
      <div class="testimonials-2"></div>
      
   </div>
</div>
<div class="heading-type-1">News and Specials</div>
<div class="massage_image"></div>
            
<div class="left-inner">
    <%
          db_con db=new db_con();
          ResultSet rs=db.search("select * from machine_maintenance");    
    
          int new_count = 0;
          int old_count = 0;
          
          while(rs.next())
          {
            String x=rs.getString(7);
            
               if(x.equals("no"))
               {
                 String m=rs.getString(1);//get the maintenance id of new message
                 new_count++;
     %>
                 <div class="bullet-link" id="<%=m%>" ><label  id="<%=m%>" onclick="msg_click(this.id);" style="color: #FFFFFF"><strong>new message <%=new_count%></strong></label></div> 
                 <body onload="msg_show();">
     <%
               }
          }
     %>
     <div class="light-brown-twelve-font" style="font-weight:bold;"> You have <%=new_count%>  new messages.<br />
     Click on the message to view<br /> <br />
     </div>
     <%     
          db_con db2=new db_con();
          ResultSet rs2=db2.search("select * from machine_maintenance"); 
          
          while(rs2.next())
          {
            String y=rs2.getString(7);
            
               if(y.equals("yes"))
               {
                 String p=rs2.getString(1);//get the maintenance id of old message
                 old_count++;
     %>
     <div class="bullet-link"><label id="<%=p%>" onclick="msg_click(this.id);" style="color: #edb156"><strong>old message <%=old_count%></strong></label></div> 
    
     <%
               } 
          }
     %>
    
    
  </div>
   </div>
    <div class="middle-parent">
    	
      <div style="height: 50px; float:right;text-align: right">
                <% 
                  String userName=(String)request.getSession().getAttribute("userName");
              %>
              <p style="margin:10px 10px 0px 0px;color:#edb156; font-size: 13px"><b>You log as</b><label style="color: #643B0F;margin: 10px 55px 0px 15px;font-size: 13px;font-weight: bold"><%=userName%></label><a href="logout.jsp" style="color: white">Logout</a></p>
              
            </div> 
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
               <li><a href="maintenance_operator_home_h.jsp" style="padding-left:0px;" >Home</a></li>
               
 
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
      <h3>If you have received a message from the OIC, there will be a notification bar to indicate that for you.
          <br><br>
          Click on the new message icon to see new messages.
      </h3>
    
        
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href="maintenance_operator_home_h.jsp"  >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             
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