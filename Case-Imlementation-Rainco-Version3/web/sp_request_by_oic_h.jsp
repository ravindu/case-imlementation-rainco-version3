
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.db_con"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% 
    
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("userName")==null)
  {
  response.sendRedirect("LoginPage.jsp");
  }
  

%>
    <script type="text/javascript">
      function fun1()
      {
         var table = document.getElementById("table_1");
         cells = table.getElementsByTagName('tr');

         for (var i=0,len=cells.length; i<len; i++)
         {
            cells[i].onclick = function()
            {
             addNewRow(this.innerHTML);             
            }
         }            
      }
      
      function init() 
      {
          fun1();
      }
      window.onload = init;  
            
      function addNewRow(value)
      {
        var my_value = value.split("<td>");
        var my_value2 = my_value[1].split("<");
        var my_value3 = my_value[2].split("<");
        var my_value4 = my_value[3].split("<");
          
         // alert(my_value2[0]);
          alert(my_value3[0]); 
        //  alert(my_value4[0]);
        
        var tbl = document.getElementById('new');
        var lastRow = tbl.rows.length;
        var a = 1;
        // check the row has been duplicated or not
            
            for(var j=3 ; j <= lastRow ; j++)
            {           
               if(document.getElementById("id"+j).value === my_value3[0])
                  {
                   a = 0;
                   break;
                  }
               
               else
                  {
                   a = 1;
                  }
            }
        if(a === 1)
        {
        var iteration = lastRow+1;    
        var row = tbl.insertRow(lastRow);
        
        
        //add column 1
        var cellname = row.insertCell(0);
        var el1 = document.createElement('input');
        el1.type = 'text';
        el1.name = 'txt_name' + iteration;
        el1.id = 'name' + iteration;
        el1.size = '20';
        el1.maxLength = '20';
        el1.style = 'border: 0px';
        el1.value = my_value2[0];
        cellname.appendChild(el1);

        //add column 2
        var cellid = row.insertCell(1);
        var el2 = document.createElement('input');
        el2.type = 'text';
        el2.name = 'txt_id' + iteration;
        el2.id = 'id' + iteration;
        el2.size = '20';
        el2.maxLength = '20';
        el2.style = 'border: 0px';
        el2.value = my_value3[0];
        cellid.appendChild(el2); 
        
        //add column 3
        var cellquantity = row.insertCell(2);
        var el3 = document.createElement('input');
        el3.type = 'text';
        el3.name = 'txt_quan' + iteration;
        el3.id = 'quan' + iteration;
        el3.size = '20';
        el3.maxLength = '20';
        el3.style = 'border: 0px';
        el3.value = "";
        cellquantity.appendChild(el3); 
        
        //add column 4
        var cellout = row.insertCell(3);
        var el4 = document.createElement('input');
        el4.type = 'text';
        el4.name = 'txt_out' + iteration;
        el4.id = 'out' + iteration;
        el4.size = '25';
        el4.maxLength = '20';
        el4.style = 'border: 0px';
        cellout.appendChild(el4); 
       }
       else
           alert("Duplicate Row");
      }
      
      
      function dellRow()
        { 
          var x=document.getElementById("new");
          if(x.rows.length>2)
          {
          var lastRow = x.rows.length-1;//get the table
     	  x.deleteRow(lastRow);//delete the last row
          }       
   	}
      
    /*-----below functions are used to calculate values to request from outside-----*/
 
      function addvalue()
      {
          var tbl = document.getElementById('new');
          var lastRow_new = tbl.rows.length;
          
          var table = document.getElementById("table_1");
          var lastRow_old = table.rows.length;

         for (var i=0 ; i<lastRow_old; i++)
         {
            for(var c=3 ; c <= lastRow_new ; c++)
            {           
                //var col3 = document.getElementById("quan"+c).value;
                //alert(col3);
                if(table.rows[i].cells[1].innerHTML === document.getElementById("id"+c).value)
                {
                    alert("yes");
                    var val = document.getElementById("quan"+c).value - table.rows[i].cells[2].innerHTML;
                    //tbl.rows[c-1].cells[3].innerHTML = val;
                    
                    if(val<0)
                    tbl.rows[c-1].cells[3].innerHTML = "0";
                    else
                      tbl.rows[c-1].cells[3].innerHTML = val;
                } 
             }          
         }
       }
        
      function save()
      {
          alert("in save");
          var save_tbl = document.getElementById('new');
          var save_lastRow = save_tbl.rows.length;
          var save_rw = "";
          for(var n=3 ; n <= save_lastRow ; n++)
          {
              var column1 = document.getElementById("name"+n).value;
              //alert(column1);
              var column2 = document.getElementById("id"+n).value;
              //alert(column2);
              var column3 = document.getElementById("quan"+n).value;
              //alert(column3);
              var column4 = save_tbl.rows[n-1].cells[3].innerHTML;
              //alert(column4);
              var rw_collect = column1+"-"+column2+"-"+column3+"-"+column4;
              save_rw = save_rw+rw_collect+",";
          }
          alert(save_rw);
          document.location.href = "sp_request_by_oic_h?param1="+save_rw;
      }

    </script>        
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



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

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}



</style>


<title>Request Spare Parts By OIC</title>
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
        <li><a href="report_to_machine_operator_by_oic.jsp" >Report for Maintenance</a></li>
        <li><a href="sp_request_by_oic_h.jsp" >Request Spare Parts</a></li>
        
     
    </ul>
  </div>
<div class="left-inner">
   <div class="testimonials-main" style="padding-top:15px;">
      <div class="testimonials-1"></div>
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
              <p style="margin:10px 10px 0px 0px;color:#edb156; font-size: 13px"><b>You log as</b><label style="color: #643B0F;margin: 10px 55px 0px 15px;font-size: 13px;font-weight: bold"><%=userName%></label><a href="logout.jsp" style="color: white">Logout</a></p>
              
            </div> 
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
               <li><a href="HomePage_RC.jsp" style="padding-left:0px;" >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" class="selected" >Machine<br/> Maintenance</a></li>
               <li><a href="production_chart_entering" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
 
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
      


      <h2 align="center">Request Spare Parts</h2>
<table border="0" style="margin:30px 0px 0px 20px">
    <tr> 
  <%      
      File l_Directory = new File("pdf");
            
            
      File[] list = l_Directory.listFiles();
       for(int i= 0;i< list.length;i++)
       {
            String s =  list[i].getName();               
  %>   
      <tr> 
      <th width="100px" height="30px" >
          <a target="_blank" href="pdf/<%=s%>">See PDF</a></th>
      <th width="150px" height="30px" style="color:#FF0033"><input type="text" size="20" readonly="readonly" value="" style="color:blue"/></th>
      </tr>
  <%
       }
  %>


</table>

<h2 style="margin:20px 0px 0px 20px;font:'Times New Roman', Times, serif">SpareParts Datasheet</h2>

<table id="table_1" border="1" style="margin:20px 0px 0px 20px" width="450">

<th width="173" >Sparepart Name</th>
<th width="181" >Sparepart Id</th>
<th width="173">Current Quantity</th>

        <%
    ResultSet rs = db_con.search("select * from spare_parts,spare_parts_stock where spare_parts.spare_part_id = spare_parts_stock.spare_part_id");
        while(rs.next())
        {
            String name = rs.getString("spare_part_name");
            String id = rs.getString("spare_part_id");
            String quantity = rs.getString("quantity");
        %>
        <tr >
            	<td><%=name%></td>
                <td><%=id%></td>
                <td><%=quantity%></td>
                
        </tr>
        <%
           }
        %>
        
</table>
<h2 style="margin:20px 0px 0px 20px;font:'Times New Roman', Times, serif">Sparepart Request Table</h2>

<table id="new" border="1" style="margin:20px 0px 0px 20px" width="500">
<tr>
<th>Spare Part Name</th>
<th>Spare Part Id</th>
<th>Quantity</th>
<th>Request from outside</th>
</tr>
   
<tr>
<td><input id="name2"  name="txt_name2" type="text" size="25" maxlength="20" style="border:0px" /></td>
<td><input id="id2" name="txt_id2" type="text" size="25" maxlength="20" style="border:0px" /></td>
<td><input id="quan2"  name="txt_quan2" type="text" size="25" maxlength="20" style="border:0px" /></td>
<td><input id="out2" name="txt_out2" type="text" size="25" maxlength="20" style="border:0px" /></td>
</tr>
</table> <br><br> 

<table>
<tr>
    <td><input type="button" onClick="save();"value="Request Spareparts" class="button"/></td>
    <td><input type="button" onClick="dellRow();" value="Delete Row" id="del" class="button" /></td>
    <td><input type="button" onClick="addvalue();" value="Check" id="check" class="button" /></td>
</tr>
        
</table> 
        
      </div>
       <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href="HomePage_RC.jsp" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="oic_home_h.jsp" class="selected" >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href="AdminTools_home_RC.jsp"  >Administrative Tools</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu4</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu5</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              <a href=""  >Menu6</a> 
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