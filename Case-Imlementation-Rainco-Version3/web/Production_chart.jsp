<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.db_con"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style_popup.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="js/vpb_script.js"></script>


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
   <body onload="curr_date();" >
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
        <li><a href="Production_chart.jsp" class="selected">New Chart</a></li>
      <li><a href="A_new_additional_request" >Additional Requests</a></li>
      
    </ul>
  </div>



   </div>
    <div class="middle-parent">
    	
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
              <li style="padding-left:0px;"><a href="oic_home_raj"    >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="Production_chart.jsp" class="selected">New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /> 	
      
	
     
      <form action="" method="post">
          
  	
        <h1 align="center">Production Chart (OIC)</h1><br>
            <div style="padding-left: 30px">
	<table  border="0"> 
  	<tr>
            <% 
            String production_num = "";
                //comment the below for testing
                ResultSet pro_num;
            
                pro_num = (ResultSet) db_con.search("SELECT current_production.productionId from current_production");
                while (pro_num.next()) {                    
                    production_num = pro_num.getString("productionId");
                
                }
                
               
                int production_num1  = Integer.parseInt(production_num);
                production_num1++;
                production_num = String.valueOf(production_num1);
            
            %>
            <td> <label>Order Number :</label>&nbsp;</td>
            <td><input id="order_no" type="text" class="formfeild" readonly ="readonly" value="<%=production_num%>"/>&nbsp;</td>
            <td>&nbsp;</td>
  	</tr>
 	<tr>
            <td><label>Date :</label>&nbsp;</td>
            <td><input id="date_id" readonly ="readonly" name="date_name" type="text" class="formfeild"/>&nbsp;</td>
  	</tr>
  	<tr>
            <td colspan="3">&nbsp;</td>
  	</tr>
        </table>
    
             <script>
                    function curr_date() {      
                        var currentDate = new Date();
                        var day = currentDate.getDate();
                        var month = currentDate.getMonth() + 1;
                        var year = currentDate.getFullYear();
                        var my_date = day+"-"+month+"-"+year;
                        document.getElementById("date_id").value = my_date;
                       
                    }
                    
                    
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
                    else if ((("0123456789-").indexOf(keychar) > -1))
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
            </script>
            
            
            
            
            
            
            
            
            
            
            <div style="overflow: auto;">
                <table border="1" id='demoTable' cellspacing='0' >
                <thead>
              <tr>
                  <th rowspan="2" align="center" >Item</th>
                 <% 
                ResultSet rs1 = db_con.search("select * from branch");
                int count=0;
                while(rs1.next())
                {
                    count++;
                }
                //out.println(count);
                 %>
            
    		<th colspan="<%=count%>" align="center">Branches</th>
              
    		<th rowspan="2" align="center">Quantity</th>
            </tr>
              
              
            <tr>
            <%
            ResultSet rs2 = db_con.search("select * from branch");
             
            while(rs2.next())
            {
                String branch=rs2.getString("branch_name");
              
            %>
                                 
                <th><%=branch%></th>
               
            <%
                }//end of while
            %>
            </tr>  
            </thead>  
            <tbody>
            
            <%
            ResultSet rs3 = db_con.search("select * from umbrella");
            while(rs3.next())
            {
                
                String umb_code=rs3.getString("umbrella_code");
                //int quantity=rs.getInt("quantity");
                
            %>
            <tr >
                <td><%=umb_code%></td>
                
            <% 
            ResultSet rs4 = db_con.search("select * from branch");
           
            while(rs4.next())
            {  
                String branch=rs4.getString("branch_id");
                
            %>
                <td><input type="text" id="<%=umb_code%>_<%=branch%>" value="" onKeyPress="return nly(this, event);"/></td>
            <%
            }
            %>
                <td><input type="text" id="total_<%=umb_code%>" value="" onKeyPress="return nly(this, event);"/></td>
           
             </tr> 
            <%
                }//end of while
            %>
            
           
            <tr>
                <td colspan="<%=count+1%>" ></td>
                <td><input type="text" id="total_quantity" value="" /></td>
            </tr>
            </tbody>
        </table>
            </div>
                
        <br>
        <input name="sum" type="button" class="button" value="Get Total Quantity" onclick="calc();" />
        
        <input name="send" type="button" class="button" value="send" onClick="vpb_show_login_box();" />
        
        
        
        
        
            </div>
            <div style="width:400px; margin-top:50px;" align="center">


            

            </div>       
                
                
  	<script type="text/javascript">
              
                function calc(){
                   
                    var table = document.getElementById("demoTable");
                    var row_count = table.rows.length-1;
                    var col_count = table.rows[2].cells.length-1;
                    
                    var count = 0,c=0, tot=0;
                    for (count = 2;count<row_count;count++){
                        var raw_tot=0; 
                        for(c = 1; c<col_count; c++){
                            
                            var cell = table.rows[count].cells[c].firstChild.value;//get textbox value for send to database
                            var cell_id = table.rows[count].cells[c].firstChild.id;
                            var x = cell_id.split("_",2);
                            //alert(x);
                            if(cell[0]==null){
                                cell= 0 ;
                              // alert("null"); 
                              //alert(cell);
                            }
                                                       
                            raw_tot=(+raw_tot)+(+cell);
                        } 
                            //alert(x[0]); 
                            //alert("total_"+x[0]); 
                            document.getElementById("total_"+x[0]+"").value = raw_tot;
                            tot=tot+raw_tot;
                        }
                        //alert(tot);
                        document.getElementById("total_quantity").value = tot;
                    
                } 
         </script>
        
         
  	<script type="text/javascript">
              var xmlhttp
                function save(){
                    


                    
                    xmlhttp=GetXmlHttpObject();
                    var un = document.getElementById("usernames").value;
                    var pw = document.getElementById("passs").value;
                    
                     if (xmlhttp==null)
                     {
                      alert ("Your browser does not support Ajax HTTP");
                      return;
                     }

                       var url="user_verification_chart";
                       url=url+"?user="+un;
                       url=url+"&pass="+pw;

                       xmlhttp.onreadystatechange=getOutput;
                       xmlhttp.open("GET",url,true);
                       
                       xmlhttp.send(null);







                    
                }
                
                function getOutput()
                {
                  if (xmlhttp.readyState==4)
                  {
                  //document.getElementById("result").innerHTML=xmlhttp.responseText;
                  
                  var sts = xmlhttp.responseText;
                 if(sts == "ok"){
                 var tab = document.getElementById("demoTable");
                    var row_count = tab.rows.length-1;
                    var col_count = tab.rows[2].cells.length-1;
                    
                    var count = 0,c=0;
                    var raw_values="";
                    for (count = 2;count<row_count;count++){
                        for(c = 1; c<col_count; c++){
                            
                            var cell = tab.rows[count].cells[c].firstChild.value;//get textbox value for send to database
                            var cell_id = tab.rows[count].cells[c].firstChild.id;
                            var x = cell_id.split("_",2);
                            
                            var um_code = x[0];//get umcode for send to database
                            var branch = x[1];//get branch for send to database
                            
                            
                            
                            var x=cell+"-"+um_code+"-"+branch;
                           
                            raw_values=raw_values+x+","
                        } 
                        var order = document.getElementById("date_id").value;
                        order=order+":"+raw_values
                        
                        window.open('production_chart_entering?parameter1='+order,'_self');
                     }
                     
                 }
                 if(sts == "no")
                     document.getElementById("msg").innerHTML = "Incorrect Username/Password Combination";
                     //
                  }
                } 
                
                function GetXmlHttpObject()
                {
                    if (window.XMLHttpRequest)
                    {
                       return new XMLHttpRequest();
                    }
                    if (window.ActiveXObject)
                    {
                      return new ActiveXObject("Microsoft.XMLHTTP");
                    }
                 return null;
                }
                
        </script>
             
    </form>
        
      </div>
                <div id="vpb_login_pop_up_box" class="vpb_signup_pop_up_box">
                <div align="left" style="font-family:Verdana, Geneva, sans-serif; font-size:16px; font-weight:bold;">Authentication Required</div><br clear="all">
                    <div align="left" style="font-family:Verdana, Geneva, sans-serif; font-size:11px">To exit this login box, click on the cancel button</div><br clear="all">
                     <div align="left" style="font-family:Verdana, Geneva, sans-serif; font-size:11px;;color: red" id="msg"></div><br clear="all"><br clear="all">       
                            
                <div style="width:100px; padding-top:10px;margin-left:10px;float:left;" align="left">Your Username:</div>
                <div style="width:300px;float:left;" align="left"><input type="text" id="usernames" name="usernames" value="" class="vpb_textAreaBoxInputs"></div><br clear="all"><br clear="all">

                <div style="width:100px; padding-top:10px;margin-left:10px;float:left;" align="left">Your Password:</div>
                <div style="width:300px;float:left;" align="left"><input type="password" id="passs" name="passs" value="" class="vpb_textAreaBoxInputs"></div><br clear="all"><br clear="all">

                <div style="width:100px; padding-top:10px;margin-left:10px;float:left;" align="left">&nbsp;</div>
                <div style="width:300px;float:left;" align="left">

                <a href="javascript:void(0);" class="vpb_general_button" onClick="save();">Login</a>

                <a href="javascript:void(0);" class="vpb_general_button" onClick="vpb_hide_popup_boxes();">Cancel</a>
                </div>

                <br clear="all"><br clear="all">
                </div>
                
                
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                    <a href="oic_home_raj"   >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="machine_status" >Machine Status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="oic_home_h.jsp"  >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="Production_chart.jsp" class="selected">New Chart</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="AdminTools_home_RC.jsp">Administrative Tools</a>
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