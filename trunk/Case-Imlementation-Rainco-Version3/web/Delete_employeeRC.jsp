<%-- 
    Document   : Delete_employeeRC
    Created on : Aug 23, 2013, 1:11:11 PM
    Author     : Ravindu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
.top-menu ul li {
  margin:0px;
	padding:0px;
	float:left;
	padding:0px 24px 0px 24px;
	border-right:1px solid #5c4e42;
	text-align:center;
}


form span.imp{ color:#FF0000;}

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}

.mainTable
{
	width:510px;
	margin:16px 0px 0px 15px;
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
    
  </div>
<div class="left-inner">
   <div class="testimonials-main" style="padding-top:15px;">
      <div class="testimonials-1">Importaint awarenesses goes </div>
      <div class="testimonials-2">here</div>
      
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
               <li><a href="HomePage_Manager.jsp"  class="selected" style="padding-left:0px;" >Home</a></li>
               <li><a href="EmpDetails_retrieveRC"  >Employee Registration</a></li>
               <li style="border:none; padding-right:0px;"><a href="EmpDetails_Delete_retrieve"  >Delete Employee</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
          <form action=""  method="post">
              <h2 style="margin: 25px 0px 0px 15px">Delete employees</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0" style="margin: 25px 0px 0px 15px">
		<tr valign="top">
                    <td width="180px">Select employee NIC number</td>
                <td colspan="2">
                    <select class="formfeild" id="employee_selection12" onclick="enableEmpdetele()">
                      <option value="compulsary" selected="selected">Please select employee NIC</option>
			<%
                          ResultSet rss=(ResultSet)request.getSession().getAttribute("deletesetEmp");

                        %>
                        <%
                        while(rss.next())
                        {
                            String nic=rss.getString("employee_nic");
                            
                    %>
                    <option value="<%=nic%>" id ="<%=nic%>"><%=nic%></option>
                    <%
                    }
                    %>
			
		</select>
		</td>
                
		</tr>
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_searchEmp"  class="button" value="Search employee" onclick=alert("ok")/></td>
		</tr>
                    <tr valign="top" style="height:30px">
		</tr>
                    
                <tr valign="top" style="height:20px">
			<td>Employee ID</td>
                        <td><input type="text" id="txt_EmpID" class="formfeild" readonly/></td>
                        
		</tr>
		
		<tr valign="top" style="height:20px">
			<td>Employee full name</td>
                        <td><input type="text" id="txt_EmpName" class="formfeild" readonly/></td>
                        
		</tr>
		
		<tr valign="top" style="height:20px">
			<td>Joined date</td>
                        <td><input type="text" id="txt_joinDate" class="formfeild" readonly /></td>
                        
		</tr>
		
		<tr valign="top">
			<td>Account type</td>
                        <td><input type="text" id="txt_EmpaccType" class="formfeild" readonly /></td>
                        
		</tr>
		
		<tr>
			<td></td>
                        <td colspan="2"><input type="button" id="btn_deleteEmp" disabled="disabled" class="button" value="Delete employee" onclick="DeleteEmpDetails('txt_EmpID','EmployeeDetails_RC','delete_message');" /></td>
                        <td id="delete_message"></td>
		</tr>
                </table>
          </form>
          
      </div>
        
        
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                  <a href="HomePage_RC.jsp" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="signUp_RC.jsp" >Employee Registration</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="Delete_employeeRC.jsp" class="selected" >Delete Employee</a>&nbsp;&nbsp;&nbsp;
                 
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
