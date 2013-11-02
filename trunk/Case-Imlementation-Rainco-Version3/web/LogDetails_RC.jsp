<%-- 
    Document   : LogDetails
    Created on : 07-Aug-2013, 13:46:24
    Author     : Sajee
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="css/jquery-ui_RC.css" />
<link rel="stylesheet" href="css/main.css"/>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>



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

#tabs
{
	width:710px;
	height:800px;
	margin:0px 0px 0px 20px;
        
}
#tabs-1
{
	width:670px;
	height:800px;
}

#tabs-2
{
	width:670px;
	height:800px;
}

#tabs-3
{
	width:670px;
	height:800px;
}

h2
{
	margin:10px 0px 0px 0px;
}

.mainTable
{
	width:580px;
	margin:30px 0px 0px 0px;
}
.formfeild
{
    width: 100px;
    height: 22px;
}


</style>
<% 
  /*  
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("userName")==null)
  {
  response.sendRedirect("LoginPage.jsp");
  }
  
*/
%>

</head>
<body>
<noscript style="width:100%; height:100%;">
	<div style=" position:fixed; top: 0px; left: 0px; background:#222222; opacity:0.7; width:100%; height:100%; z-index: 10000;">
    </div>
    <div  style="position:fixed; width:100%; height:100%;z-index: 10000;">
    <div style=" padding:5px; border:2px #0000FF solid; background:#FFFFFF; color:#000000; font:large bold; width:400px; margin:200px auto; text-align:center;z-index: 10001;" >
        <p align="justify" style="margin:0">Your browser doesn't support JavaScript or you have disabled JavaScript. You have to either <strong>update your browser</strong> or <strong>enable javascript</strong> on it  in order to use this form.</p>
		<br />
        <a href="" target="_self">Go Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
      <li><a href="RawServlet_retrieveRaw">Raw materials settings</a></li>
      <li><a href="DyeServlet_retrieveDye">Dye code settings</a></li>
      <li><a href="MachineServlet_retrieveMachine">Machines settings</a></li>
      <li><a href="SparepartServlet_retrieve">Spareparts settings</a></li>
      <li><a href="BranchServlet_retrieveBranch"  >Company branches setting</a></li>
      <li><a href="fillSelectFields" >Umbrella settings</a></li>
      <li><a href="ActiveLog_retrieve" class="selected" >Active log</a></li>
     
      
    </ul>
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
                <li><a href="oic_home_raj"   style="padding-left:0px;" >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="Production_chart.jsp" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" class="selected" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
          <div id="mainContend2" style="margin: 33px 0px 30px 7px">
              <div id="tabs">
<ul>
<li><a href="#tabs-1">Raw active log</a></li>
<li><a href="#tabs-2">Dye active log</a></li>
<li><a href="#tabs-3">Branch active log</a></li>
<li><a href="#tabs-4">Machine/Sparepart active log</a></li>
<li><a href="#tabs-5">Mould/Umbrella active log</a></li>


</ul>
<div id="tabs-1">
<form action=""  method="post">
		<h2>Active log panel for raw material setting </h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100px"><h3 style="color:#b1440f"><b>Date</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Time</b></h3></td>
                        <td width="240px"><h3 style="color:#b1440f"><b>Brief description</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Authorized by</b></h3></td>
                    </tr>
                    <tr>
                        <td width="100px" ></td>
                        <td width="100px"></td>
                        <td width="260px"></td>
                        <td width="100px"></td>
                    </tr>
                    
                        <%
                        ResultSet rss=(ResultSet)request.getSession().getAttribute("dataset1");
                        while(rss.next())
                        {
                            String type=rss.getString("type");
                            
                            if(type.equals("raw"))
                            {
                            String date=rss.getString("date");
                            String time=rss.getString("time");
                            String description=rss.getString("description");
                            String authorize=rss.getString("autho");
                            
                        %>
                        <tr>
                            <td width="80px"><input id="date" class="formfeild" type="text" value="<%=date%>" style="border: none" readonly/></td>
                            <td width="80px"><input id="time" class="formfeild" type="text"  value="<%=time%>" style="border: none" readonly/></td>
                            <td width="240px"><input id="description" class="formfeild" type="text"  value="<%=description%>" style="border: none;width:230px" readonly/></td>
                            <td width="80px"><input id="authorize" class="formfeild" type="text"  value="<%=authorize%>" style="border: none" readonly/></td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    
		</table> 
	</form>
	</div>
         
       <div id="tabs-2">
<form action=""  method="post">
		<h2>Active log panel for dye code setting </h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100px"><h3 style="color:#b1440f"><b>Date</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Time</b></h3></td>
                        <td width="240px"><h3 style="color:#b1440f"><b>Brief description</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Authorized by</b></h3></td>
                    </tr>
                    <tr>
                        <td width="100px" ></td>
                        <td width="100px"></td>
                        <td width="260px"></td>
                        <td width="100px"></td>
                    </tr>
                    
                        <%
                        ResultSet rss1=(ResultSet)request.getSession().getAttribute("dataset2");
                        while(rss1.next())
                        {
                            String type=rss1.getString("type");
                            
                            if(type.equals("dye"))
                            {
                            String date=rss1.getString("date");
                            String time=rss1.getString("time");
                            String description=rss1.getString("description");
                            String authorize=rss1.getString("autho");
                            
                        %>
                        <tr>
                            <td width="80px"><input id="date" class="formfeild" type="text" value="<%=date%>" style="border: none" readonly/></td>
                            <td width="80px"><input id="time" class="formfeild" type="text"  value="<%=time%>" style="border: none" readonly/></td>
                            <td width="240px"><input id="description" class="formfeild" type="text"  value="<%=description%>" style="border: none;width:230px" readonly/></td>
                            <td width="80px"><input id="authorize" class="formfeild" type="text"  value="<%=authorize%>" style="border: none" readonly/></td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    
		</table> 
	</form>
	</div>
        <div id="tabs-3">
<form action=""  method="post">
		<h2>Active log panel for branch setting details</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100px"><h3 style="color:#b1440f"><b>Date</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Time</b></h3></td>
                        <td width="240px"><h3 style="color:#b1440f"><b>Brief description</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Authorized by</b></h3></td>
                    </tr>
                    <tr>
                        <td width="100px" ></td>
                        <td width="100px"></td>
                        <td width="260px"></td>
                        <td width="100px"></td>
                    </tr>
                    
                        <%
                        ResultSet rss2=(ResultSet)request.getSession().getAttribute("dataset3");
                        while(rss2.next())
                        {
                            String type=rss2.getString("type");
                            
                            if(type.equals("branch"))
                            {
                            String date=rss2.getString("date");
                            String time=rss2.getString("time");
                            String description=rss2.getString("description");
                            String authorize=rss2.getString("autho");
                            
                        %>
                        <tr>
                            <td width="80px"><input id="date" class="formfeild" type="text" value="<%=date%>" style="border: none" readonly/></td>
                            <td width="80px"><input id="time" class="formfeild" type="text"  value="<%=time%>" style="border: none" readonly/></td>
                            <td width="240px"><input id="description" class="formfeild" type="text"  value="<%=description%>" style="border: none;width:230px" readonly/></td>
                            <td width="80px"><input id="authorize" class="formfeild" type="text"  value="<%=authorize%>" style="border: none" readonly/></td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    
		</table> 
	</form>
	</div>
         <div id="tabs-4">
<form action=""  method="post">
		<h2>Active log panel for machines & spareparts setting </h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100px"><h3 style="color:#b1440f"><b>Date</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Time</b></h3></td>
                        <td width="240px"><h3 style="color:#b1440f"><b>Brief description</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Authorized by</b></h3></td>
                    </tr>
                    <tr>
                        <td width="100px" ></td>
                        <td width="100px"></td>
                        <td width="260px"></td>
                        <td width="100px"></td>
                    </tr>
                    
                        <%
                        ResultSet rss3=(ResultSet)request.getSession().getAttribute("dataset4");
                        while(rss3.next())
                        {
                            String type=rss3.getString("type");
                            
                            if(type.equals("spare") || type.equals("machine") )
                            {
                            String date=rss3.getString("date");
                            String time=rss3.getString("time");
                            String description=rss3.getString("description");
                            String authorize=rss3.getString("autho");
                            
                        %>
                        <tr>
                            <td width="80px"><input id="date" class="formfeild" type="text" value="<%=date%>" style="border: none" readonly/></td>
                            <td width="80px"><input id="time" class="formfeild" type="text"  value="<%=time%>" style="border: none" readonly/></td>
                            <td width="240px"><input id="description" class="formfeild" type="text"  value="<%=description%>" style="border: none;width:230px" readonly/></td>
                            <td width="80px"><input id="authorize" class="formfeild" type="text"  value="<%=authorize%>" style="border: none" readonly/></td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    
		</table> 
	</form>
	</div>
        <div id="tabs-5">
<form action=""  method="post">
		<h2>Active log panel for mould & umbrella setting </h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100px"><h3 style="color:#b1440f"><b>Date</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Time</b></h3></td>
                        <td width="240px"><h3 style="color:#b1440f"><b>Brief description</b></h3></td>
                        <td width="100px"><h3 style="color:#b1440f"><b>Authorized by</b></h3></td>
                    </tr>
                    <tr>
                        <td width="100px" ></td>
                        <td width="100px"></td>
                        <td width="260px"></td>
                        <td width="100px"></td>
                    </tr>
                    
                        <%
                        ResultSet rss4=(ResultSet)request.getSession().getAttribute("dataset5");
                        while(rss4.next())
                        {
                            String type=rss4.getString("type");
                            
                            if(type.equals("umbrella")|| type.equals("mould"))
                            {
                            String date=rss4.getString("date");
                            String time=rss4.getString("time");
                            String description=rss4.getString("description");
                            String authorize=rss4.getString("autho");
                            
                        %>
                        <tr>
                            <td width="80px"><input id="date" class="formfeild" type="text" value="<%=date%>" style="border: none" readonly/></td>
                            <td width="80px"><input id="time" class="formfeild" type="text"  value="<%=time%>" style="border: none" readonly/></td>
                            <td width="240px"><input id="description" class="formfeild" type="text"  value="<%=description%>" style="border: none;width:230px" readonly/></td>
                            <td width="80px"><input id="authorize" class="formfeild" type="text"  value="<%=authorize%>" style="border: none" readonly/></td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    
		</table> 
	</form>
	</div>
    
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
                  <a href="Production_chart.jsp" >New Chart</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="AdminTools_home_RC.jsp" class="selected">Administrative Tools</a>
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
