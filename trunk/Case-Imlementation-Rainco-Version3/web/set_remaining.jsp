
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" type="text/css" href="css/main.css"></link>


        <script language="JavaScript" type="text/javascript" src="js/jquery - Copy.js"></script>
        <script language="JavaScript" type="text/javascript" src="js/jTPS.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jTPS.css"></link>
        
        <script>

                $(document).ready(function () {
                
                        $('#demoTable').jTPS( {perPages:[5,12,15,50,'ALL'],scrollStep:1,scrollDelay:30,
                                clickCallback:function () {     
                                        // target table selector
                                        var table = '#demoTable';
                                        // store pagination + sort in cookie 
                                        document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
                                                'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
                                                'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
                                }
                        });

                        // reinstate sort and pagination if cookie exists
                        var cookies = document.cookie.split(';');
                        for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
                                var cookie = cookies[ci].split('=');
                                if (cookie[0] == 'jTPS') {
                                        var commands = cookie[1].split(',');
                                        for (var cm = 0, cme = commands.length; cm < cme; cm++) {
                                                var command = commands[cm].split(':');
                                                if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
                                                } else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
                                                } else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .pageSelector:eq(' + parseInt(command[1]) + ')').click();
                                                }
                                        }
                                }
                        }

                        // bind mouseover for each tbody row and change cell (td) hover style
                        $('#demoTable tbody tr:not(.stubCell)').bind('mouseover mouseout',
                                function (e) {
                                        // hilight the row
                                        e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
                                }
                        );

                });


        </script>
        
        <style>
                
                #demoTable thead th {
                        white-space: nowrap;
                        overflow-x:hidden;
                        padding: 3px;
                }
                #demoTable tbody td {
                        padding: 3px;
                        text-align: center;
                }
                #demoTable{
                        margin-left:30px;
                        border: 1px solid #ccc;
                        
                        width: 700px;
                }
                
        </style>



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

.buttonR  {
                    background:url(images/button-reset.jpg) no-repeat left top;
                    width:100px;
                    word-spacing:-0.2px;
                    font-weight:bold;
                    color:#FFFFFF;
                    height:28px;
                    font-size:12px;
                    padding-bottom:3px;
                    cursor:pointer;
                    border-style:none;
                    cursor: pointer;
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

.mainTable { margin-left:30px;}
	.mainTable input { margin:0px 5px 0px 0px;font-size: 14px}
	.mainTable td{ padding:0 0 5px 5px;font-size: 14px}
	.mainTable th{ text-align:left; padding-top:5px;padding-bottom: 10px; font-size:14px;}
.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}



</style>

<% /*
    
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
<% 
   String userName=(String)request.getSession().getAttribute("userName");
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
      <li><a href="" class="selected" style="background:url(images/bucket-menu-link-hover-ok.jpg) no-repeat left top;">Chart Entered</a></li>
      <li><a href="" class="selected" style="background:url(images/bucket-menu-link-hover-ok.jpg) no-repeat left top;">Set Buffer</a></li>
      <li><a href="" class="selected">Set Remaining Umbrellas</a></li>
      <li><a href="" >Set Remaining Raw Materials</a></li>
      <li><a href="" >Required Raw Materials</a></li>
      
    </ul>
  </div>



   </div>
    <div class="middle-parent">
    	<div style="height: 50px; float:right;text-align: right">
                
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
               <li><a href="production_chart_entering" class="selected" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <h1 style="margin-left: 30px;padding-top: 30px">Verifying the Remaining in the Stock</h1>
                <br/>
                
      
      <form action="" id="remain">
          <span class="imp" style="display: block; margin-left: 30px;margin-bottom: 10px">
          Remaining Umbrella quantities in the stock will be automatically calculated using additional requests and
           the buffer levels witch are declared for the previous production chart.
           <br/>Any adjustments can be made to the remaining quantities of umbrellas in the stock before proceed.
      </span>
                            
                                <table id="demoTable" cellspacing="0" >
                                <thead>
                                        <tr>
                                                <th>Umbrella Code</th>
                                                <th>Forecast Remaining</th>
                                                <th>Actual Remaining</th>
                                        </tr>
                                </thead>
                                <tbody>

                                <%

                                    ResultSet rs_remain = (ResultSet) session.getAttribute("virtual_remaining_R");
                                    int cnt = 1;
                                    while (rs_remain.next()) {

                                        String um_code = rs_remain.getString("buffer_id");
                                        int pre_remain = rs_remain.getInt("remaining_quantity");
                                        if(cnt<15){
                                %>
                                <tr>
                                    <td><%=um_code%></td>
                                    <td><%=pre_remain%></td>
                                    <td><input type="text" id="<%=um_code%>" value="<%=pre_remain%>" ></input></td>
                                    
                                </tr>
                                    <%
                                        }else{
                                            
                                        
                                    
                                    %>
                                    <tr class="hideTR">
                                    <td><%=um_code%></td>
                                    <td><%=pre_remain%></td>
                                    <td><input type="text" id="<%=um_code%>" value="<%=pre_remain%>" ></input></td>
                                    
                                </tr>
                                <%
                                            }
                                        cnt++;
                                    }

                                %>
                                </tbody>
                                <tfoot class="nav">
                                        <tr>
                                                <td colspan=7>
                                                        <div class="pagination"></div>
                                                        <div class="paginationTitle">Page</div>
                                                        <div class="selectPerPage"></div>
                                                        <div class="status"></div>
                                                </td>
                                        </tr>
                                </tfoot>
                                </table>
                                <br/>
                                <br/>
                                
                                        <table class="mainTable" style="width: 700px">
                                            <tr>
                                                <td align="center">
                                                    <button class="buttonR" type="reset" id="reset">Reset</button>
                                                    <button class="button" type="button" id="continue" style="margin-left: 30px" onclick="new_remaining();">Continue</button>
                                                </td>

                                            </tr>

                                        </table>

                                    
                            
                        </form>
	
       <script type="text/javascript">
                                    function new_remaining(){
                                        var arr = "";
                                    var form1 = document.getElementById("buffer");
                                    inputs = document.getElementsByTagName('input');
                                    for (index = 0; index < inputs.length; ++index) {
                                        if(inputs[index].type == "text"){
                                            var umb = inputs[index].id;
                                            var qnt = inputs[index].value;
                                            var umb_qnt = umb+"-"+qnt;
                                            arr = arr+umb_qnt+",";

                                        }


                                     }
                                     window.open('vertual_innerhub_verify?reminings='+arr,'_self');
                                    }
                                    
                                </script> 
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                                <a href="oic_home_raj" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="machine_status" >Machine status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="oic_home_h.jsp" >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="production_chart_entering" class="selected">New Chart </a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="AdminTools_home_RC.jsp" >Administrative Tools</a>
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