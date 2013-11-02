

<%@page import="bean_entity.performance_helper"%>
<%@page import="java.util.ArrayList"%>
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



form span.imp{ color:#FF0000;}

 .mainTable { margin-left:30px;}
                .mainTable input { margin:0px 5px 0px 0px;font-size: 14px}
                .mainTable td{ padding:0 0 5px 5px;font-size: 14px}
                .mainTable th{ text-align:left; padding-top:5px;padding-bottom: 10px; font-size:14px;}
                .buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}




</style>


<script language="JavaScript" type="text/javascript" src="js/jquery - Copy.js"></script>
        <script language="JavaScript" type="text/javascript" src="js/jTPS.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jTPS.css"></link>
        
        <script>

                $(document).ready(function () {
                
                        $('#demoTable').jTPS( {perPages:[],scrollStep:1,scrollDelay:30,
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
                       
                        border: 1px solid #ccc;
                        
                        width: 700px;
                }
                #demoTable tbody td input{
                    text-align: center;
                }
                
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
   


   </div>
    <div class="middle-parent">
    	
        <div style="height: 50px; float:right;text-align: right">
                
              <p style="margin:10px 10px 0px 0px;color:#edb156; font-size: 13px"><b>You log as</b><label style="color: #643B0F;margin: 10px 55px 0px 15px;font-size: 13px;font-weight: bold"><%=userName%></label><a href="logout.jsp" style="color: white">Logout</a></p>
              
         </div> 
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
               <li style="padding-left:0px;"><a href="oic_home_raj">Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" class="selected">Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="Production_chart.jsp" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 
      <div style="padding-left: 30px">
          
     <h1>Employee Performance Rate</h1>
     
     <br/><br/>
          
     <%
        
        ArrayList<performance_helper> performance=new ArrayList<performance_helper>();
        performance=(ArrayList) request.getSession().getAttribute("data");
        
    
        
        
        
        out.print("<table id='demoTable' cellspacing='0'>");
        out.print("<thead>");
        
        out.print("<tr>");
        out.print("<th>");
        out.print("Employee");
        out.print("</th>");
        
        
        
        out.print("<th>");
        out.print("Hours worked");
        out.print("</th>");
        
        
        
        
        
        
        out.print("<th>");
        out.print("Items produced");
        out.print("</th>");
        
        
        
        out.print("<th>");
        out.print("Should produce in next hour");
        out.print("</th>");
        
        
        out.print("</tr>");
        out.print("</thead>");
        out.print("<tbody>");
         
        for(int i=0;i<performance.size();i++){
        
        out.print("<tr>");
         
          
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' value='"+performance.get(i).getEmployee()+"' readonly>");
        out.print("</td>");
         
         
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' value='"+performance.get(i).getHours()+"' readonly>");
        out.print("</td>");
         
   
         
         
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' value='"+performance.get(i).getProduced()+"' readonly>");
        out.print("</td>");
        
        
            
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' value='"+performance.get(i).getAddiotional()+"' readonly>");
        out.print("</td>");
        
        
         
         out.print("</tr>");
         
         }
         
         
         
         
        out.print("</tbody>"); 
        out.print("</table>");
        %>
      </div> 
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                                <a href="oic_home_raj" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="employee_rate" class="selected" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="machine_status" >Machine status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="oic_home_h.jsp" >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="Production_chart.jsp" >New Chart </a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
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