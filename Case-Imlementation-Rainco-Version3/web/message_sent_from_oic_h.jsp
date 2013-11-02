
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
<script language="javascript" type="text/javascript">

function look()
{
  alert("examine");
  window.location.href = "maintenance_operator_home_h.jsp";
}

function request(mn_id)
{
    var id=mn_id; 
    //alert(id);
    document.location.href = "request_oic_h?param2="+id;
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
      <h2 align="center">View Message</h2><br/>
        <br /> <br /><br /> 
    <%
       ResultSet rss=(ResultSet)request.getSession().getAttribute("result");
   
        if(rss!=null)
        {
          while(rss.next())
              {
                  String a=rss.getString(1);
                  String b=rss.getString(2);
                  String c=rss.getString(6);
                  String d=rss.getString(4);
     %> 
     
<form action="message_save_h" method="post" name="Message">
    
<table class="mainTable" border="0">
  <tr>          
    <td><label>Maintenance ID</label></td>
    <td><input name="txt_Mn_ID" id="txt_Mn_ID"  type="text" class="formfeild" readonly
       value="<%=a%>"            
    /></td>
  </tr>
  <tr>
    <td><label>Breakdown Date</label></td>
    <td><input name="txt_Brk_Date" id="txt_Brk_Date" type="text" class="formfeild" readonly
       value="<%=b%>"
    />
    </td>
  </tr>
  <tr>
    <td><label>Machine ID</label></td>
    <td><input name="txt_Mc_ID" id="txt_Mc_ID" type="text" class="formfeild" readonly
       value="<%=c%>"
    />
    </td>
  </tr>
  <tr>
    <td><label>Comment</label></td>
    <td><textarea name="Comment" id="Comment" cols="40" rows="20"><%=d%>  
    </textarea></td>
  </tr>
  <tr>
    
      <td align="left"><input name="proceed" type="button" value="Examine" class="button" onclick="look();" /></td>
    <td><input name="send" type="button" value="Request Spare Parts" class="button" onclick="request(<%=a%>);" /></td>
    <td align="right"><input name="done" type="submit" value="Repair Done" class="button" /></td>
    
  </tr>
</table>


    <%
              }
        }
        else
        {
    %>
    <h1>No Messages To Display</h1>
    <%
        }
    %>
</form> 	
        
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
               <a href="maintenance_operator_home_h.jsp">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              
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