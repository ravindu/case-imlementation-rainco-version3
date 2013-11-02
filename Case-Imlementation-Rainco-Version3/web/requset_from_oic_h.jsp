
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
<script type="text/javascript" language="javascript">
 function addNewRow()
 {
        var tbl = document.getElementById('table_1');
        var lastRow = tbl.rows.length;
        var iteration = lastRow+1;
        var row = tbl.insertRow(lastRow);
        
        //add name column
        var cellname = row.insertCell(0);
        var el1 = document.createElement('input');
        el1.type = 'text';
        el1.name = 'txt_Name' + iteration;
        el1.id = 'name' + iteration;
        el1.size = '25';
        el1.maxLength = '20';
        el1.style = 'border: 0px';
        cellname.appendChild(el1);

        //add quantity column
        var cellquantity = row.insertCell(1);
        var el2 = document.createElement('input');
        el2.type = 'text';
        el2.name = 'txt_Quantity' + iteration;
        el2.id = 'quantity' + iteration;
        el2.size = '25';
        el2.maxLength = '20';
        el2.style = 'border: 0px';
        cellquantity.appendChild(el2);
        
 }

        function dellRow()
    		{ 
                  var x=document.getElementById("table_1");
                  if(x.rows.length>2){
                  var lastRow = x.rows.length-1;//get the table
      		  x.deleteRow(lastRow);//delete the last row
                  }
                  
   		}
        
    </script>
    <script>
      function pdf_add(req_id,mn_id)
      {
          var id = req_id.value;
          var m_id = mn_id.value;
   
          var tbl = document.getElementById('table_1');
          var lastRow = tbl.rows.length;
          var rw = "";
          for(var c=2 ; c <= lastRow ; c++)
          {
              var col1 = document.getElementById("name"+c).value;
              var col2 = document.getElementById("quantity"+c).value;
              var rw1 = col1+"-"+col2;
              rw = rw+rw1+",";
          }
         // alert(rw);
          //alert(id);
         // alert(m_id);
          
          document.location.href = "mnt_request_oic_pdf_h?param1="+rw+"&param3="+id+"&param4="+m_id+"";
          
          
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


<title>Maintenance Request To OIC</title>
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
      <li><a href="maintenance_operator_home_h.jsp" >Home</a></li>
      
    </ul>
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
              <p style="margin:10px 10px 0px 0px;color:#edb156; font-size: 13px"><b>You log as</b><label style="color: #643B0F;margin: 10px 55px 0px 15px;font-size: 13px;font-weight: bold"><%=userName%></label><a href="logout.jsp" style="color: white">Logout</a></p>
              
            </div> 
        
        
        <div class="middle-header">
          <div class="top-menu">
            <ul>
               <li><a href="maintenance_operator_home_h.jsp" style="padding-left:0px;" >Home</a></li>
               
 
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 	
      <h2 align="center">Request Spare Parts From OIC</h2><br/>
<form action="mnt_request_oic_pdf_h" method="post" name="Report">
   
<table class="mainTable" border="0">
  <tr>
    <td><label>Request ID</label></td>
    <%
         db_con r=new db_con();
         ResultSet req=r.search("select * from spare_parts_operator");    
    %>
    <td><input name="txt_Req_ID" id="txt_Req_ID" type="text" class="formfeild" readonly
    <%      
         int max = 0;
         int count = 0;
         while(req.next())
         {
           count++;
           String x=req.getString(1);
           int a = Integer.parseInt(x);
                if(max<a)
                {
                  max = a;
                }
          }
          if(count==0)
             {
                String value="2000";      
    %>
          value="<%=value%>"
    <%
             }
          else
          {
                max = max + 1;
    %>
          value="<%=max%>"
    <%
          }
    %>
              
    
    /></td>
  </tr>
  <tr>
    <td><label>Maintenance ID</label></td>
    <td><input name="txt_Mn_ID" id="txt_Mn_ID" type="text" class="formfeild" readonly
    <%
       ResultSet rss1=(ResultSet)request.getSession().getAttribute("result2");
   
        if(rss1!=null)
        {
          while(rss1.next())
              {
                  String m_id = rss1.getString(1);
                  String reason = rss1.getString(4);
                  
    %>
    value="<%=m_id%>">   
    </td>
  </tr>
  <tr>
    <td><label>Operator ID</label></td>
    <td><input name="txt_Op_ID" type="text" class="formfeild" /></td>
  </tr>
  <tr>
    <td><label>Reason</label></td>
    <td><textarea name="Reason" cols="40" rows="20"> <%=reason%> </textarea></td>
  </tr>
  <%
              }
        }
        else
        {
    %>
            <h1> NO Data</h1>
        
    <%
        }
    %> 
  <br /><br />
  <table id ="table_1" width="450" border="1">
  <br /><br />
  <tr>
    <th>Spare Part Name</th>
    <th>Quantity</th>
  </tr>
  <tr>
    <td><input id="name2"  name="txt_Name" type="text" size="25" maxlength="20" style="border:0px" /></td>
    <td><input id="quantity2" name="txt_Quantity" type="text" size="25" maxlength="20" style="border:0px" /></td>
  </tr>
  
</table><br>

  <tr>
    <td><input type="button" onClick="addNewRow()" value="Add New Row" id="Add_New_Row" class="button" /></td>
    <td><input type="button" onClick="dellRow();" value="Delete Row" id="del" class="button" /></td>
  </tr>
    <tr>
        <td><input type="button" onClick="pdf_add(txt_Req_ID,txt_Mn_ID);" value="Create PDF" id="pdf" class="button" /></td>
    </tr>
    
</table>

</form> 
  	
        
        
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
              <a href=maintenance_operator_home_h.jsp"  >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             
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