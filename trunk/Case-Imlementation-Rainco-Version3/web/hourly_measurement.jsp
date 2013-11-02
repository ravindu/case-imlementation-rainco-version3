

<%@page import="bean_entity.operator_assignment"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script language="javascript" src="js/add_row.js"></script>
      <script language="javascript" src="js/measure.js"></script>  


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

 .mainTable { margin-left:15px;}
                .mainTable input { margin:0px 1px 0px 0px;font-size: 14px}
                .mainTable td{ padding:0 0 2px 2px;font-size: 14px}
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
       <li><a href="hourly_measure"class="selected" >Hourly Employee Performance</a></li>
      <li><a href="hour"  >Change Mould</a></li>
      
      
    </ul>
  </div>
<div class="left-inner">
   
</div>

   </div>
    <div class="middle-parent">
    	
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
              <li style="padding-left:0px;"><a href="Supervisor_home" >Home</a></li>
               <li><a href="assign_operator" >Operator<br/>Assigning</a></li>
              <li><a href="hourly_measure" class="selected">Employee <br/> Performance</a></li>
             
              <li><a href="RawMaterial_consumption.jsp" >Raw Material<br/>Consumption </a></li>
              <li><a href="Dye_consumption.jsp" >Dye Usage</a></li>
              <li style="border:none; padding-right:0px;"><a href="Runner_waste.jsp"  >Runner Wastage</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
     
      <div style="padding-left: 30px">
      
     <h1>Hourly Employee Performance</h1>    
     <br/><br/>
          

<form>
    
<%
        
        ArrayList<operator_assignment> measurement=new ArrayList<operator_assignment>();
        measurement=(ArrayList<operator_assignment>)request.getSession().getAttribute("measure");
        
        
        
        ArrayList dye_code=new ArrayList();
        dye_code=(ArrayList)request.getSession().getAttribute("dye");
        
        
        
        out.print("<table id='demoTable' cellspacing='0'>");
        out.print("<thead>");
        out.print("<tr>");
        
        out.print("<th>");
        out.print("Employee Name");
        out.print("</th>");
       
    
        out.print("<th>");
        out.print("Mould");
        out.print("</th>");
    
    
        out.print("<th>");
        out.print("Machine");
        out.print("</th>");
    
        out.print("<th>");
        out.print("Dye Code");
        out.print("</th>");
    
        out.print("<th>");
        out.print("Quantity(Kg)");
        out.print("</th>");
    
        out.print("<th>");
      
        out.print("</th>"); 
        
        out.print("</tr>");
        out.print("</thead>");
        out.print("<tbody>");
        for(int i=0;i<measurement.size();i++){
        
       
            
            
        out.print("<tr>");  
        
        
       
       
      
        
        
        
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' name='employee' id='employee' value='"+measurement.get(i).getEmployee_id()+"' readonly>");
        out.print("</td>");
            
      
        
        
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' name='mould' id='mould' value='"+measurement.get(i).getMould_code()+"' readonly>");
        out.print("</td>");
        
        
        out.print("<td>");
        out.print("<input type='text' style='border: 0;background: initial' name='machine'  id='machine' value='"+measurement.get(i).getMachine_code()+"' readonly>");
        out.print("</td>");
        
        
        out.print("<td>");
        out.print("<select name='dye_code'>");
        out.print("<option value='0'>select dye</option>");
        
        for(int x4=0;x4<dye_code.size();x4++){
   
            out.print("<option value='"+dye_code.get(x4)+"'>" +dye_code.get(x4)+"</option>");
    
         }
    
        out.print("</select>");
        out.print("</td>");
        
        
        out.print("<td>");
        out.print("<input type='text' name='qty' id='qty' value=''>Kg");
        out.print("</td>");
        
        
         out.print("<td style='visibility:hidden'>");
         out.print("<input type='hidden' name='emp' id='emp' value='"+measurement.get(i).getId()+"'>");
         out.print("</td>");
       
       
         
         
        out.print("</tr>");
      
        
       
        
        
        }
        
        
        
       
        out.print("</tbody>");
        out.print("</table>");
        
        
        
        %>
        <br/> <br/>
        <input type="button" value="Save Data" onclick="hourly_record()" class="button">
        <div id="error"></div>
        <div id="txt"></div>
        
	</form>
        
        </div>
      </div>
       <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
               <a href="Supervisor_home.jsp"  >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
               <a href="assign_operator" >Operator Assign</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="hourly_measure"  class="selected">Employee Performance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             
              <a href="RawMaterial_consumption.jsp" >Raw Material</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="Dye_consumption.jsp" >Dye Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="Runner_waste.jsp"  >Runner Wastage</a>  
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