
<%@page import="java.util.Date"%>
<%@page import="database.db_con"%>
<%@page import="java.sql.ResultSet"%>
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
    <script>
        function my_curr_date() {      
        var currentDate = new Date();
              var day = currentDate.getDate();
              var month = currentDate.getMonth() + 1;
              var year = currentDate.getFullYear();
         var my_date = day+"-"+month+"-"+year;
         document.getElementById("txt_Brk_Date").value= my_date;

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


</head>
<body onload='return my_curr_date();'>
    
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
        <li><a href="report_to_machine_operator_by_oic.jsp" >Report for Maintenance</a></li>
        <li><a href="sp_request_by_oic_h.jsp" >Request Spare Parts</a></li>
        
      
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
    <div class="light-brown-twelve-font" style="font-weight:bold;"> view message <a href="a" class="orange-twelve-link">click here</a>. <br /> <br />
    </div>
    <div class="bullet-link" style=" margin-top:10px;"><a href="" target="_blank"><strong>old message 1</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 2</strong></a></div>
    <div class="bullet-link"><a href="" target="_blank"><strong>old message 3</strong></a></div>
    
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
               <li><a href="HomePage_RC.jsp" style="padding-left:0px;" >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" class="selected" >Machine<br/> Maintenance</a></li>
               <li><a href="production_chart_entering" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
 
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
      <h2 align="center">Report To Maintenance Operator</h2><br/>
<form action="Report_to_operator" method="post" name="Report">
<table class="mainTable" border="0">
  <tr>
    <td><label>Maintenance ID</label></td>
    <td>
     
    <%
         db_con main=new db_con();
         ResultSet m=main.search("select * from machine_maintenance");    
    %>  
         <input name="txt_Mn_ID" type="text" class="formfeild" id="txt_Mn_ID" readonly
    <%      
         int max = 0;
         int count = 0;
         while(m.next())
         {
           count++;
           String x=m.getString(1);
           int a = Integer.parseInt(x);
                if(max<a)
                {
                  max = a;
                }
          }
          if(count==0)
             {
                String value="1000";      
    %>
          value="<%=value%>"
    <%
             }
          else
          {
                max = max + 1;
    %>
          value="<%=max%>"
    <%
          }
    %>
    
      />
    </td>
  </tr>
  <tr>
    <td><label>Breakdown Date</label></td>
    <td><input name="txt_Brk_Date" type="text" class="formfeild" id="txt_Brk_Date" readonly /></td>
    
  </tr>
  <tr>
    <td><label>Machine ID</label></td>
    <td>
            <%
                db_con db=new db_con();
                ResultSet rs=db.search("select * from machine");    
            %>
            <select name="txt_Mc_ID" id="txt_Mc_ID">
            <option>Select Machine</option>
            <%
                while(rs.next())
                {
                    String x=rs.getString(1);
            %>
            <option><%=x%></option>
            <%
                }
            %>
      </select>
    </td>
  </tr>
  <tr>
    <td><label>Comment</label></td>
    <td><textarea name="Comment" cols="40" rows="20"></textarea></td>
  </tr>
  <tr>
      <td colspan="2" align="right"><input name="Send" type="submit" value="Send" class="button" /></td>
  </tr>
</table>

</form> 
	
        
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href="HomePage_RC.jsp"  >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="oic_home_h.jsp" class="selected" >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="AdminTools_home_RC.jsp"  >Administrative Tools</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu4</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu5</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu6</a> 
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