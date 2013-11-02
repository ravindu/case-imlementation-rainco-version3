

<%@page import="bean_entity.array_dye"%>
<%@page import="java.text.DateFormat"%>
<%@page import="bean_entity.array_mould"%>
<%@page import="bean_entity.machine_id"%>
<%@page import="bean_entity.employee_id"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


 <script language="javascript" src="js/add_row.js"></script>
 
 <script language="javascript" src="js/production.js"></script>
<script type="text/javascript"> 


function sum(){
   var tabl = document.getElementById("mytable");
        //alert( tabl.rows.length);
        var l = tabl.rows.length;
        var i = 1;
        var s = "";
        
        for (i = 1; i < l; i++ )
        {
        var tr = tabl.rows[i];
        
        var cel0 = tr.cells[0].firstChild.value;
        var cel1 = tr.cells[1].firstChild.value;
        var cel2 = tr.cells[2].firstChild.value;
        var cel3 = tr.cells[3].firstChild.value;
        var cel4 = tr.cells[4].firstChild.value;
        var r = cel0+"-"+cel1+"-"+cel2+"-"+cel3+"-"+cel4+",";
        s=s+r;
        }
        
        window.open('hourly_production?q='+s,'_self');
}


</script>

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
	width:180px;
}



form span.imp{ color:#FF0000;}

.mainTable { margin-left:30px;}
                .mainTable input { margin:0px 0px 5px 20px;font-size: 14px}
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
               
                
                .cover{
                    
                    margin-left: 10px;
                    margin-top: 30px;
                    height: 500px;
                    width: 720px;
                    border: solid #000000 .1em;
                    padding-left: 20px;
                    padding-top: 50px;
                    
                    
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
       <li><a href="hourly_measure" >Hourly Employee Performance</a></li>
      <li><a href="hour" class="selected" >Change Mould</a></li>
      
      
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
          
       
          <div style="margin-top: 50px; margin-left: 30px;">   
      <h1>Change Moulds of Break-down Machineries</h1>
    </div>
      
      <div class="cover">   
      <%

   
 
    
      
    

    ArrayList<employee_id> employee=new ArrayList<employee_id>();
    employee=(ArrayList)request.getSession().getAttribute("employee");
    
    
    ArrayList<machine_id> machine=new ArrayList<machine_id>();
    machine=(ArrayList<machine_id>)request.getSession().getAttribute("machine");
    
    
    ArrayList<array_mould> mould=new ArrayList<array_mould>();
    mould=(ArrayList<array_mould>)request.getSession().getAttribute("mould");
    
    
    
    ArrayList<array_dye> dye=new ArrayList<array_dye>();
    dye=(ArrayList<array_dye>)request.getSession().getAttribute("dye");
    
    
    
   // DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
    //out.print("Date:    "+df.format(new java.util.Date()));
    
    
    out.print("<br/>");
    out.print("<br/>");
    
    
    out.print("<table id='demoTable' cellspacing='0'>");
    out.print("<thead>");
    out.print("<tr>");
    
    out.print("<th>");
    out.print("Employee");
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
    out.print("Quantity (Kg)");
    out.print("</th>");
    
    
    
    out.print("</tr>");
    out.print("</thead>");
    
    
    
   out.print("<tbody>");
    
   
    out.print("<tr id = 'row_1'>");
    
    
    out.print("<td>");
  
    for(int x1=0;x1<employee.size();x1++){
   
  
    
        out.print("<input type='text' name='employee_name' id='employee_name' value='"+employee.get(x1).getEmployee()+"' >");
        
        
    }
    
  
    out.print("</td>");
    
    
    
    
    out.print("<td>");
  
    for(int x2=0;x2<mould.size();x2++){
   
 
        out.print("<input type='text' name='mould_name' id='mould_name' value='"+mould.get(x2).getMould()+"' >");
        
    
    }
    
 
    out.print("</td>");
    
    
    
    
    out.print("<td>");
  
    for(int x3=0;x3<machine.size();x3++){
   
 
         out.print("<input type='text' name='machine_id' id='machine_id' value='"+machine.get(x3).getMachine()+"' >");
    
    }
    
 
    out.print("</td>");
    
    
    
    
    
    out.print("<td>");
    out.print("<select name='dye_code'>");
     out.print("<option value='0'>select dye</option>");
    for(int x4=0;x4<dye.size();x4++){
   
    out.print("<option value='"+dye.get(x4).getDye()+"'>" +dye.get(x4).getDye()+"</option>");
    
    }
    
    out.print("</select>");
    out.print("</td>");
    
    
    
    
    out.print("<td>");
    out.print("<input type='text'  id='quantity' name='quantity' value=''> Kg");
    out.print("</td>");
    
    out.print("</tr>");
    
   out.print("</tbody>");
   
    out.print("</table>");
    
    
 
             
     
                
  

%>

<br/><br/><br/><br/>



<div style="margin-left: 70px;">

<input type="button" name="" value="Add New Row" onclick="new_row('demoTable')" class="button">
    <button type="button" onclick="del();" class="button">Delete Last Row</button>


<button onclick="product();" type="button" class="button">Save</button>

<div id="txt"></div>
</div>

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