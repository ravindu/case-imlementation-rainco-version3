<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.db_con"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



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

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
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
                        text-align: left;
                }
                #demoTable tbody td {
                        padding: 3px;
                        text-align: center;
                }
                #demoTable{
                       
                        border: 1px solid #ccc;
                        
                        
                }
                #demoTable tbody td input{
                    text-align: center;
                }
                
        </style>    


</head>
<body onload="curr_date();">
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
              <li><a href="hourly_measure" >Employee <br/> Performance</a></li>
             
              <li><a href="RawMaterial_consumption.jsp"  >Raw Material<br/>Consumption </a></li>
              <li><a href="Dye_consumption.jsp" >Dye Usage</a></li>
              <li style="border:none; padding-right:0px;"><a href="Runner_waste.jsp" class="selected" >Runner Wastage</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
          <br><br><br />  	
     
       <form action="" method="post">
           <div style="padding-left: 30px">
            <h1>Runner Wastage</h1><br><br>
            <table >
            <tr>
            <td> <label>Raw material Code :</label>&nbsp;</td>
            <td>
                
                <select name="code" id="r_m_code" class="formfeild" onchange="addrow(); setdefault();" >
                    <option>--Select--</option>
                    <%
                    ResultSet rs = db_con.search("select * from raw_material where raw_material_code like '%_crush'");

                    while(rs.next())
                    {
                        String raw_code=rs.getString("raw_material_code");

                        //db_con.change("insert into runner_waste(raw_material_code) values('"+cod+"')");
                    %>   
                    <option><%=raw_code%></option>
                    <%
                    }
                    %>   
            
                </select></td>
           
            </tr>
            
            <tr>
                <td> <label>Date :</label>&nbsp;</td>
                <td><input id="date_id" type="text"  class="formfeild"/>&nbsp;</td>
                <td> &nbsp;</td>
            </table>
           
            <br>
            
                <table border="1" id="demoTable">
                    <thead>
                <tr>
                    <th style="width: 120px">Raw material code</th><th style="width: 270px"><span style="margin-left: 100px">Quantity(Kg)</span></th>
            </tr>
                    </thead>
                    
            </table><br/><br/><br/>
            
            <input  type="button" value="Delete Row"  class="button" name="delete"  onclick="deleteLastRow();"/> 
            
            <input  type="button" value="Save" class="button" name="save"  onclick="send(date_id.value);"/>  
           
            </div>
            <script>
                function curr_date() {      
                    var currentDate = new Date();
                    var day = currentDate.getDate();
                    var month = currentDate.getMonth() + 1;
                    var year = currentDate.getFullYear();
                    var my_date = day+"-"+month+"-"+year;
                    document.getElementById("date_id").value = my_date;

                }
            </script>
            
            <script>
                function setdefault(){
                    document.getElementById('r_m_code').selectedIndex = 0;
                }
            </script>
                    
                    
            <script>
                
                function nly(myfield, e, dec)
                    {
                    var key;
                    var keychar;

                    if (window.event)
                    key = window.event.keyCode;
                    else if (e)
                    key = e.which;
                    else
                    return true;
                    keychar = String.fromCharCode(key);

                    // control keys
                    if ((key==null) || (key==0) || (key==8) || 
                        (key==9) || (key==13) || (key==27) || (key==109) )
                    return true;

                    // numbers
                    else if ((("0123456789.").indexOf(keychar) > -1))
                    return true;

                    // decimal point jump
                    else if (dec && (keychar == "."))
                    {
                    myfield.form.elements[dec].focus();
                    return false;
                    }
                    else
                    return false;
                    } 

                function addrow(){

                    var dropdown = document.getElementById("r_m_code");
                    var raw_mat = dropdown.options[dropdown.selectedIndex].value;

                    var table = document.getElementById("demoTable");
                    var raw_count = table.rows.length;
                    var iteration = raw_count-1;
                    //alert(raw_count);
                    var duplicate=1;
                    for(i=1; i<raw_count; i++){
                        if(table.rows[i].cells[0].firstChild.value==raw_mat){
                             duplicate=0;
                             alert("Duplicate value");
                             break;
                        }
                        else{
                            //alert("Insert value");
                        }
                    }
                        
                    if(duplicate==0){
                        //alert("Duplicate value");
                    }
                    else{

                        var new_row = table.insertRow(raw_count);//to insert single raw
                        //var col_count = tabl.rows[0].cells.length; // to get the number of colums from the first row

                        var cellname = new_row.insertCell(0);
                        var el_0= document.createElement('input');
                        el_0.type = "text";
                        el_0.value = raw_mat;
                        el_0.id = 'name'+iteration;
                        el_0.style.border = 0;
                        el_0.style.background = 'initial';
                        
                        //cellname.innerHTML=raw_mat;
                        cellname.appendChild(el_0);


                        var cellquantity = new_row.insertCell(1);
                        var el_1 = document.createElement('input');
                        el_1.id = 'r_m_qty'+iteration;
                        el_1.type = "text";
                        el_1.style.width = '270px';
                        el_1.style.textAlign = "right";
                        el_1.setAttribute('onKeyPress','return nly(this, event)');
                        cellquantity.appendChild(el_1);

                    }
                }
            </script>

            <script>
                
                function deleteLastRow()
                {
                    var table = document.getElementById("demoTable");
                    var lastRow = table.rows.length;
                    if( lastRow != 1 )
                        //alert("deleted");
                        table.deleteRow(lastRow-1);
                    
                }
                   
                
            </script>
            
            <script>
              
                function send(d_id){
                //alert("IN SEND"); 
                var date= d_id;
                //alert(date);
                var table = document.getElementById("demoTable");
                var raw_count = table.rows.length;
                var i = 1;
                var total_value = "";
               
                for (i = 1; i < raw_count; i++ )
                {
                    var cell0 = table.rows[i].cells[0].firstChild.value;
                    var cell1 = table.rows[i].cells[1].firstChild.value;
                    //alert(cell0+"-"+cell1);
                    var raw_value= cell0+"-"+cell1;
                    total_value= total_value+raw_value+",";
                }
                // alert(total_value); 
                var all= date+":"+total_value;
                //alert(all);
                document.location.href = "Runner_waste?parameter1="+all;
              
                }
            </script>
              
        </form>
                    
	
        
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
               <a href="Supervisor_home.jsp"  >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
               <a href="assign_operator" >Operator Assign</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="hourly_measure"  >Employee Performance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             
              <a href="RawMaterial_consumption.jsp" >Raw Material</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="Dye_consumption.jsp" >Dye Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="Runner_waste.jsp" class="selected" >Runner Wastage</a> 
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