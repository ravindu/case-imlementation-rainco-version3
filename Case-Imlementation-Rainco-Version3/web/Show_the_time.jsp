
<%@page import="bean_entity.NotComplete_algoBean"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" type="text/css" href="css/main.css"></link>
<link rel="stylesheet" type="text/css" href="css/AlgoTable_RC.css"></link>



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

h1 {
	font-size:18px;
	font-weight: bold;
	color: #edb156;
	text-transform:none;
	margin:0px;
	padding:0px;
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
        
      
    </ul>
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
               <li style="padding-left:0px;"><a href="oic_home_raj"  class="selected"  >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="production_chart_entering" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
 
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
      <br /> <br /><br /> 
      <h1 style="color: #edb156;font-size:18px;font-weight: bold;text-transform:none;margin:0px 0px 0px 20px">Total Time(Hours) for finish each moulds in each machines according to utilization</h1>
      
	<%
            List<NotComplete_algoBean> OutputList=(List<NotComplete_algoBean>)request.getSession().getAttribute("objectList");
            
            
        %>
        <div class="datagrid" style="margin:30px 0px 0px 20px">
        <table id="demoTable" cellspacing="0" >
                                <thead>
                                        <tr>
                                                <th>Machine Code</th>
                                                <th>Mould Code</th>
                                                <th>Total Quantity</th>
                                                <th>Total KGs</th>
                                                <th>Total Hours</th>
                                        </tr>
                                </thead>
                                <tbody>
                      
                  <% 
                        
                        for(int i=0;i<OutputList.size();i++)
                        { %>
                        
                        <tr class="alt">
                          <td><%=OutputList.get(i).getMachineCode()%></td>
                          <td><%=OutputList.get(i).getMouldCode()%></td>
                          <td><%=OutputList.get(i).getQuantity()%></td>
                          <td><%=OutputList.get(i).getTotal_kgs()%></td>
                          <td><%=OutputList.get(i).getTotal_hrs()%></td>
                          

                      </tr>

                  <%} %>
                                </tbody>
                                <tfoot>
                                    <tr><td colspan="5"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr>
                                </tfoot>
                  </table>
        
        </div>
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                  <a href="oic_home_raj"  class="selected" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="machine_status" >Machine Status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="oic_home_h.jsp"  >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="production_chart_entering" >New Chart</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
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