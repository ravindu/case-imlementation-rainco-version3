<%-- 
    Document   : signUp
    Created on : 08-Aug-2013, 16:17:28
    Author     : Sajee
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/signUp_css_RC.css">
<link rel="stylesheet" href="css/jquery-ui_RC.css"/>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/ajax.js"></script>



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
	

.mainTable
{
	width:570px;
	margin:30px 0px 0px 0px;
}


</style>
<script>
    $(function(){
    $( "#txt_joindate" ).datepicker();
    });
    
   
</script>


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
        <div style="height: 50px; float:right;text-align: right">
                <% 
                  String userName=(String)request.getSession().getAttribute("userName");
              %>
              <p style="margin:10px 10px 0px 0px;color:#edb156; font-size: 13px"><b>You log as</b><label style="color: #643B0F;margin: 10px 55px 0px 15px;font-size: 13px;font-weight: bold">Production Manager</label><a href="logout.jsp" style="color: white">Logout</a></p>
              
            </div> 
        
        
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
          <div id="container">
              <div id="header"><h2>User registration form</h2></div>
              <div id="contend_signUp">
                  <div id="signUp_form">
                      <form action="EmployeeDetailsAdd" method="post">
                      <h3 style="color:#b1440f;margin:0px 0px 0px 15px"><b>Profile details</b></h3>
                      <table border="0" class="mainTable" colspan="0" rowspan="0">
                          
                          <tr>
                          <td width="120px">Employee ID</td>
                         <%
                            String mid="",midNew="",result="";
                            
                            ResultSet rst=(ResultSet)request.getSession().getAttribute("resultsetEmp");
                            
                            while(rst.next())
                            {
                                mid=rst.getString("employee_id");
                            }
                            
                            if(mid==null || mid=="")
                            {
                               result="employee_1000";
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
                          <td><input type="text" name="txt_id" id="txt_id" class="formfeild" value="<%=result%>" readonly/></td>
                          <td width="140px" id="idNumber"></td>
                          </tr>
                          
                          <tr>
                          <td width="120px">Full Name</td>
                          <td><input type="text" name="txt_fullName" id="txt_fullName" class="formfeild" onblur="checkEmpDetailsName('txt_fullName','fullname');"/></td>
                          <td width="140px" id="fullname"></td>
                          </tr>
                          
                          <tr>
                          <td width="120px">Address</td>
                          <td><input type="text" name="txt_address1" id="txt_address1" class="formfeild" onblur="checkEmpDetailsAddress('txt_address1','address1')"/></td>
                          <td width="140px" id="address1"></td>
                          </tr>
                          
                          <tr>
                          <td width="120px"></td>
                          <td><input type="text" name="txt_address2" id="txt_address2" class="formfeild" onblur="checkEmpDetailsCity('txt_address2','address2')"/></td>
                          <td width="140px" id="address2"></td>
                          </tr>
                         
                          <tr>
                          <td width="120px">NIC</td>
                          <td><input type="text" name="txt_nic" id="txt_nic" class="formfeild" maxlength="10" onblur="checkEmpDetailsNIC('txt_nic','nic')"/></td>
                          <td width="140px" id="nic"></td>
                          </tr>
                          
                          <tr>
                          <td width="120px">Phone No</td>
                          <td><input type="text" name="txt_phoneNo" id="txt_phoneNo" class="formfeild" maxlength="10" onblur="checkEmpDetailsPhone('txt_phoneNo','phoneNo')"/></td>
                          <td width="140px" id="phoneNo"></td>
                          </tr>
                          
                          <tr>
                          <td width="120px">Email</td>
                          <td><input type="text" name="txt_email" id="txt_email" class="formfeild" onblur="checkEmpDetailsEmail('txt_email','email')"/></td>
                          <td width="140px" id="email"></td>
                          </tr>
                      </table>
                      <h3 style="color:#b1440f;margin: 25px 0px 0px 15px"><b>Designation details</b></h3>
                      <table border="0" class="mainTable" rowspan="0" colspan="0" style="margin:10px 0px 0px 15px">
                          <tr>
                          <td width="120px">Join date</td>
                          <td><input type="text" name="txt_joindate" id="txt_joindate" class="formfeild" onblur="checkEmpDetailsDate('txt_joindate','date')"/></td>
                          <td width="140px" id="date"></td>
                          </tr>
                          <tr>
                          <td width="120px">Designation</td>
                          <td>
                              <select class="formfeild" id="select_desig" name="select_desig">
                                  <option value="compulsory" selected="selected" id="compulsory">Select the designation</option>
                                  <option value="oic" id="oic">Overrall in-charge (OIC)</option>
                                  <option value="mould supervisor" id="supervisor1">Mould supervisor</option>
                                  <option value="assembly supervisor" id="supervisor2">Assemble supervisor</option>
                                  <option value="machine operator" id="Operator">Machine operator</option>
                                  <option value="Foreman" id="Foreman">Foreman</option>
                              </select>
                          </td>
                          <td width="140px" id="designation"></td>
                          </tr>
                      </table>
                      
                      <h3 style="color:#b1440f;margin:35px 0px 0px 15px"><b>Login details</b></h3>
                      <table border="0" class="mainTable" rowspan="0" colspan="0" style="margin:10px 0px 0px 15px">
                          <tr>
                          <td width="120px">Username</td>
                          <td><input type="text" name="txt_user" id="txt_user" class="formfeild" onblur="checkEmpDetailsUser('txt_user','user')"/></td>
                          <td width="140px" id="user"></td>
                          </tr>
                          <tr>
                              <td colspan="2"><input type="button" name="btn_userCheck" id="btn_userCheck" class="button" value="Check user availability" style="margin:0px 0px 0px 125px" onclick="checkUsernameValidation('txt_user','EmployeeDetails_RC','user')" /></td>
                          <td width="140px" id="user"></td>
                          </tr>
                          <tr>
                          <td width="120px">password</td>
                          <td><input type="password" name="txt_password" id="txt_password" class="formfeild" onblur="checkEmpDetailsPass('txt_password','password')" onkeydown="dissableOtherStuff();" /></td>
                          <ptd width="140px" id="password"></td>
                          </tr>
                          <tr>
                          <td width="120px">Confirm password</td>
                          <td><input type="password" name="txt_Confirmpassword" id="txt_ConfirmPassword" class="formfeild" onblur="checkEmpDetailsConfirmPass('txt_password','txt_ConfirmPassword','Confirmpassword')"/></td>
                          <td width="140px" id="Confirmpassword"></td>
                          </tr>
                          
                      </table>
                     
                      <table border="0" class="mainTable" rowspan="0" colspan="0" style="margin:10px 0px 0px 15px">
                          <tr>
                              <td colspan="2"><input type="submit" name="btn_save" id="btn_saveEmp" class="button" value="Create account" style="margin:30px 0px 0px 125px"/></td>
                          <td width="140px" id="save_message1"></td>
                          <!--onclick="save_EmpDetails('txt_id','txt_fullName','txt_address1','txt_address2','txt_nic','txt_phoneNo','txt_email','txt_joindate','select_desig','txt_user','txt_Confirmpassword','EmployeeDetails_RC','save_message1')" -->
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
                  <a href="HomePage_RC.jsp" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="signUp_RC.jsp"  class="selected" >Employee Registration</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="Delete_employeeRC.jsp"  >Delete Employee</a>&nbsp;&nbsp;&nbsp;
                 
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
