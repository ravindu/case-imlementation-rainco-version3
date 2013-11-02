<%-- 
    Document   : rawMaterial1
    Created on : 31-Jul-2013, 20:35:27
    Author     : Sajee
--%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.db_con"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Dye Code</title>
<link rel="stylesheet" href="css/jquery-ui_RC.css"/>
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



</style>
<style type="text/css">
body
{
	background-color:white;
}

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
	
#tabs
{
	width:710px;
	height:380px;
	margin:0px 0px 0px 20px;
        
}
#tabs-1
{
	width:670px;
	height:400px;
}

#tabs-2
{
	width:670px;
	height:400px;
}

#tabs-3
{
	width:670px;
	height:400px;
}

h2
{
	margin:10px 0px 0px 0px;
}

.mainTable
{
	width:570px;
	margin:30px 0px 0px 0px;
}


</style>
<% 
   
  /*response.setHeader("Cache-Control","no-cache");
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
      <li><a href="RawServlet_retrieveRaw">Raw materials settings</a></li>
      <li><a href="DyeServlet_retrieveDye" class="selected">Dye code settings</a></li>
      <li><a href="MachineServlet_retrieveMachine">Machines settings</a></li>
      <li><a href="SparepartServlet_retrieve">Spareparts settings</a></li>
      <li><a href="BranchServlet_retrieveBranch"  >Company branches setting</a></li>
      <li><a href="fillSelectFields" >Umbrella settings</a></li>
      <li><a href="ActiveLog_retrieve" >Active log</a></li>
      
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
                <li style="padding-left:0px;"><a href="oic_home_raj">Home</a></li>
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
<li><a href="#tabs-1">Add new dye code</a></li>
<li><a href="#tabs-2">Edit/Update dye code</a></li>
<li><a href="#tabs-3">Delete dye code</a></li>

</ul>
<div id="tabs-1">
<form action=""  method="post">
		<h2>Add new dye codes</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td>Dye code</td>
                        <td><input type="text" name="txt_dyecode_id" id="txt_dyecode_id" class="formfeild" maxlength="4" onblur="checkDyeCodeError('txt_dyecode_id','checkDye')"/></td>
                        <td id="checkDye" style="width: 170px"></td>
                </tr>
		
		<tr valign="top">
			<td>Dye name</td>
                        <td><input type="text" name="txt_dyecode_name" id="txt_dyecode_name" class="formfeild" onblur="checkDyeNameError('txt_dyecode_name','checkDyeName')" /></td>
                        <td id="checkDyeName" style="width: 170px"></td>
		</tr>
		
		
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_addnew_dye2" disabled="disabled" class="button" value="Add new dye material" onclick="callAjaxAddnewDye('txt_dyecode_id','txt_dyecode_name','DyeCodeServlet','save_message');ToActiveLog_Add('txt_dyecode_id','ActiveLogServlet','<%=userName%>','save_message','<%="dye"%>')"/></td>
		</tr>
                <tr>
			<td></td>
                        <td colspan="2"><input type="button" name="btn_clear_dye"  class="button" value="Clear" onclick="ClearAddNew('txt_dyecode_id','txt_dyecode_name','save_message','checkDye','checkDyeName')"/></td>
		</tr>
                <tr>
                    <td></td>
                    <td id="save_message" colspan="2"><h2></h2></td>
                </tr>
		</table> 
	</form>
	</div>
    
	<div id="tabs-2">
	<form action=""  method="post">
		<h2>Edit and update previous dye codes</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select a dye code</td>
                <td colspan="2">
                    <select class="formfeild" id="dyecode_selection" onclick="EnableFindDyeButton('btn_find_dye','btn_editDye1')">
                      <option value="compulsary" selected="selected">Please select dye code</option>
			<%
                          ResultSet rss=(ResultSet)request.getSession().getAttribute("updateDye");

                        %>
                    <%
                        while(rss.next())
                        {
                            String c=rss.getString("dye_code");
                            
                    %>
                    <option value="<%=c%>" id ="<%=c%>"><%=c%></option>
                    <%
                    }
                    %>
			
		</select>
		</td>
                
		</tr>
		
		<tr valign="top" style="height:3px">
		</tr>
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_find_dye" disabled="disabled" class="button" value="Find dye details" onclick="callAjaxDyeSelect('dyecode_selection','DyeCodeServlet','resultid','resultname')"/></td>
		</tr>
		
		<tr valign="top" style="height:30px">
		</tr>
		
		<tr valign="top">
			<td>Dye code</td>
                        <td colspan="2"><input type="text" id="resultid" name="txt_Erawmaterial_id" class="formfeild" readonly="true"/></td>
                        
</td>
		</tr>
		
		<tr valign="top">
			<td>Dye name</td>
                        <td><input type="text" id="resultname" name="txt_Erawmaterial_name" class="formfeild"/></td>
                        <td id="editdyeName" style="width: 170px"></td>
		</tr>
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_editDye1" disabled="disabled" class="button" value="Save & Update dye code" onclick="callAjaxupdate('resultid','resultname','DyeCodeServlet','update_message');ToActiveLog_Update('dyecode_selection','ActiveLogServlet','<%=userName%>','update_message','<%="dye"%>')"/></td>
		</tr>
                <tr>
			<td></td>
                        <td colspan="2"><input type="button" name="btn_clear" class="button" value="Clear" onclick="ClearUpdate_Edit('resultid','resultname','update_message','dyecode_selection')"/></td>
		</tr>
                <tr>
                    <td></td>
                    <td id="update_message"><h2></h2></td>
                </tr>
		</table> 
	</form>
	</div>

        <div id="tabs-3">
	<form action=""  method="post">
		<h2>Delete dye codes</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select a dye code</td>
		<td>
                    <select class="formfeild" id="dyecode_selectionDelete" onclick="EnableFindDyeButton('btn_removedye_material')">
                      <option value="compulsary" selected="selected">Please select dye code</option>
			<%
                          ResultSet rsss=(ResultSet)request.getSession().getAttribute("deleteDye");

                        %>
                    <%
                        while(rsss.next())
                        {
                            String c=rsss.getString("dye_code");
                            
                    %>
                    <option value="<%=c%>" id ="<%=c%>"><%=c%></option>
                    <%
                    }
                    %>
			
		</select>
		</td>
                <td></td>
		</tr>
		
		<tr valign="top" style="height:3px">
		</tr>
		
		<tr>
			<td></td>
                        <td><input type="button" id="btn_removedye_material" disabled="disabled" class="button" value="Delete dye" onclick="callAjaxDeleteSelect('dyecode_selectionDelete','DyeCodeServlet','delete_message');ToActiveLog_Delete('dyecode_selectionDelete','ActiveLogServlet','<%=userName%>','delete_message','<%="dye"%>')"/></td>
		</tr>
               <tr>
			<td></td>
                        <td><input type="button" name="btn_clear" class="button" value="Clear" onclick="ClearDelete('delete_message','dyecode_selectionDelete')"/></td>
		</tr>
		
                <tr>
                    <td></td>
                    <td id="delete_message"><h2></h2></td>
                </tr>
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
