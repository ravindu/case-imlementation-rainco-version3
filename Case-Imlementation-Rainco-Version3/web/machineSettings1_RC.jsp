<%-- 
    Document   : mainPage
    Created on : 14-Jul-2013, 17:31:45
    Author     : Ravi
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.db_con"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
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
  }*/
  

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
      <li><a href="MachineServlet_retrieveMachine" class="selected">Machines settings</a></li>
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
                <li style="padding-left:0px;"><a href="oic_home_raj"    >Home</a></li>
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
<li><a href="#tabs-1">Add new machines</a></li>
<li><a href="#tabs-2">Edit/Update machines</a></li>
<li><a href="#tabs-3">Delete Machines</a></li>

</ul>
<div id="tabs-1">
<form action=""  method="post">
		<h2>Add new machine</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
                        <%
                            String mid="",midNew="",result="";
                            
                            ResultSet rst=(ResultSet)request.getSession().getAttribute("startMachine");
                            while(rst.next())
                            {
                                mid=rst.getString("machine_id");
                            }
                            
                            if(mid==null || mid=="")
                            {
                               result="machine_1";
                            }
                            else
                            {
                                midNew=mid;
                                String[] array=midNew.split("_");
                                String first=array[0].toString();
                                int num=Integer.parseInt(array[1].toString());
                                num=num+1;
                                String number=String.valueOf(num);
                                String symbol="_";
                                result=new StringBuilder(first).append(symbol).append(number).toString();
                               
                                
                                
                                }
                        %>
			<td>Machine id</td>
                        <td colspan="2"><input type="text" name="txt_machine_id" id="txt_machine_id1" class="formfeild" value="<%=result%>" readonly /></td>
		</tr>
		
		<tr valign="top">
			<td>Heating time (minutes)</td>
                        <td><input type="text" name="txt_heating_time" id="txt_heating_time" class="formfeild" maxlength="4" onblur="CheckMachineValue_Int('txt_heating_time','checkHtime')" /></td>
                        <td id="checkHtime" style="width: 150px"></td>
		</tr>
                
                <tr valign="top">
			<td>Response time (seconds)</td>
                        <td><input type="text" name="txt_response" id="txt_response" class="formfeild" maxlength="2" onblur="CheckMachineValue_Int('txt_response','checkRtime')" /></td>
                        <td id="checkRtime"></td>
		</tr>
		
		<tr valign="top">
			<td>Electricity consumption (KW)</td>
                        <td><input type="text" name="txt_elec_consumption" id="txt_elec_consumption" class="formfeild" maxlength="4" onblur="CheckMachineValue_Int('txt_elec_consumption','checkEtime')"  /></td>
                        <td id="checkEtime"></td>
		</tr>
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" disabled="disabled" id="btn_addnew_machinne123" class="button" value="Add new machine" onclick="callAjaxMachine('txt_machine_id1','txt_heating_time','txt_response','txt_elec_consumption','MachineServlet','save_message');ToActiveLog_Add('txt_machine_id1','ActiveLogServlet','<%=userName%>','save_message','<%="machine"%>')"/></td>
		</tr>
                <tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_clear_MachineAdd" disabled="disabled"  class="button" value="Clear & next machine" onclick="ClearAddNewMachine('txt_machine_id1','txt_heating_time','txt_response','txt_elec_consumption','save_message','checkHtime','checkRtime','checkEtime')"/></td>
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
		<h2>Edit and update machines</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select the machine</td>
                <td colspan="2">
		<select class="formfeild" id="machine_selection" onclick="EnableFindDyeButton('btn_find_machine12','btn_update_machine')">
			<option value="compulsary" selected="selected">Please select machine id</option>
			 <%
                          ResultSet rs=(ResultSet)request.getSession().getAttribute("updateMachine");

                         %>
                    <%
                        while(rs.next())
                        {
                            String x=rs.getString("machine_id");
                    %>
                        <option value="<%=x%>"><%=x%></option>
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
                        <td colspan="2"><input type="button" disabled="disabled" id="btn_find_machine12" class="button" value="Find machine details" onclick="callAjaxMachineSelect('machine_selection','MachineServlet','txt_Emachine_htime','txt_Emachine_rtime','txt_Epower_con')"/></td>
		</tr>
		
		<tr valign="top" style="height:30px">
		</tr>
		
		<tr valign="top">
			<td>Heating time (minutes)</td>
                        <td><input type="text" id="txt_Emachine_htime" class="formfeild" maxlength="4"/></td>
                        <td id="checkEHtime" style="width: 170px"></td>
		</tr>
		
		<tr valign="top">
			<td>Response time (seconds)</td>
                        <td><input type="text" id="txt_Emachine_rtime" class="formfeild" maxlength="2" /></td>
                        <td id="checkERtime" style="width: 170px"></td>
		</tr>
		
		<tr valign="top">
			<td>Power consumption (KV)</td>
                        <td><input type="text" id="txt_Epower_con" class="formfeild" maxlength="4" /></td>
                        <td id="checkEEtime" style="width: 170px"></td>
		</tr>
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_update_machine" disabled="disabled" class="button" value="Save & Update machine" onclick="callAjaxUpdateMachine('machine_selection','txt_Emachine_htime','txt_Emachine_rtime','txt_Epower_con','MachineServlet','update_message');ToActiveLog_Update('machine_selection','ActiveLogServlet','<%=userName%>','update_message','<%="machine"%>')" /></td>
		</tr>
                <tr>
			<td></td>
                        <td colspan="2"><input type="button" name="btn_clear" class="button" value="Clear" onclick="ClearUpdate_EditMachine('txt_Emachine_htime','txt_Emachine_rtime','txt_Epower_con','machine_selection','update_message')"/></td>
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
		<h2>Delete machines</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select the machine</td>
		<td>
		<select class="formfeild" id="machineSelectionDelete" onclick="EnableFindDyeButton('btn_delete_machine')">
			<option value="compulsary" selected="selected">Please select machine id</option>
			 <%
                          ResultSet rss=(ResultSet)request.getSession().getAttribute("deleteMachine");

                         %>
                    <%
                        while(rss.next())
                        {
                            String x=rss.getString("machine_id");
                    %>
                        <option value="<%=x%>"><%=x%></option>
                    <%
                    }
                    %>
			
		</select>
		</td>
		</tr>
		<tr>
			<td></td>
                        <td><input type="button" id="btn_delete_machine" disabled="disabled" class="button" value="Delete machine" onclick="callAjaxDeleteSelect('machineSelectionDelete','MachineServlet','delete_message');ToActiveLog_Delete('machineSelectionDelete','ActiveLogServlet','<%=userName%>','delete_message','<%="machine"%>')" /></td>
		</tr>
                <tr>
			<td></td>
                        <td><input type="button" name="btn_clear" class="button" value="Clear" onclick="ClearDelete('delete_message','machineSelectionDelete')"/></td>
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
