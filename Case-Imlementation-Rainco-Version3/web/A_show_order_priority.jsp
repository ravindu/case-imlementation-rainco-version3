


<%@page import="bean_entity.employee_id"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>

<!-- Example jQuery code (JavaScript)  -->
<script type="text/javascript">

$(document).ready(function(){

	// Get items
	function getItems(exampleNr)
	{
		var columns = [];

		$(exampleNr + ' ul.sortable-list').each(function(){
			columns.push($(this).sortable('toArray').join(','));				
		});

		return columns.join('|');
	}

	

	// Render items
	function renderItems(items)
	{
		var html = '';
	
		var columns = items.split('|');
		
		for ( var c in columns )
		{
			html += '<div class="column left';

			if ( c == 0 )
			{
				html += ' first';
			}

			html += '"><ul class="sortable-list">';

			if ( columns[c] != '' )
			{
				var items = columns[c].split(',');

				for ( var i in items )
				{
					html += '<li class="sortable-item" id="' + items[i] + '">Sortable item ' + items[i] + '</li>';
				}
			}

			html += '</ul></div>';
		}

		//$('#example-2-4-renderarea').html(html);
	}

	// Example 2.1: Get items
	$('#example-2-1 .sortable-list').sortable({
		connectWith: '#example-2-1 .sortable-list'
	});

	$('#btn-get').click(function(){
            
                var con=confirm("Are you really want to change the order priority?");
            
            
                if(con==true){
                param=getItems('#example-2-1');
                
                window.open('save_order_priority?q='+param,'_self');
              }
                
              else{
                    
                    alert("Priority order not changed!");
                    
              }
                
	});


	// Example 2.2: Save items
	
	
});

</script>


<link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />




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


.buttonR:hover {
                    background:url(images/button-reset-hover.jpg) no-repeat left top;
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

form span.imp{ color:#FF0000;}

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}



</style>
    
    <style type="text/css">
        table.table2{
    font-family: Georgia, serif;
    font-size: 12px;
    font-style: normal;
    font-weight: normal;
    letter-spacing: -1px;
    line-height: 1.2em;
    border-collapse:collapse;
    text-align:center;
}
.table2 thead th, .table2 tfoot td{
    padding:20px 10px 20px 10px;
    color:#fff;
    font-size: 14px;
    background-color:#222;
    font-weight:normal;
    border-right:1px dotted #666;
    border-top:3px solid #666;
    -moz-box-shadow:0px -1px 4px #000;
    -webkit-box-shadow:0px -1px 4px #000;
    box-shadow:0px -1px 4px #000;
    text-shadow:1px 1px 1px #000;
    width: 100px;
}
.table2 tfoot th{
    padding:10px;
    font-size:18px;
    text-transform:uppercase;
    color:#888;
}
.table2 tfoot td{
    font-size:36px;
    color:#EF870E;
    border-top:none;
    border-bottom:3px solid #666;
    -moz-box-shadow:0px 1px 4px #000;
    -webkit-box-shadow:0px 1px 4px #000;
    box-shadow:0px 1px 4px #000;
}
.table2 thead th:empty{
    background:transparent;
    -moz-box-shadow:none;
    -webkit-box-shadow:none;
    box-shadow:none;
}
/*.table2 thead :nth-last-child(1){
    border-right:none;
}
.table2 thead :first-child,
.table2 tbody :nth-last-child(1){
    border:none;
}*/
.table2 tbody th{
    text-align:right;
    padding:10px;
    color:#333;
    text-shadow:1px 1px 1px #ccc;
    background-color:#f9f9f9;
}
.table2 tbody td{
    padding:10px;
    background-color:#f0f0f0;
    border-right:1px dotted #999;
    text-shadow:-1px 1px 1px #fff;
    text-transform:uppercase;
    color:#333;
}
.table2 tbody span.check::before{
    content : url(../images/check1.png)
}

.right-triangle {
   width: 0;
   height: 0;
   border-left: 100px solid red;
   border-top: 50px solid transparent;
   border-bottom: 50px solid transparent;
}
        
.space{
    
    border: solid #000000;
    width:100px;
    float: right;
    margin-right: 40px;
    
}       
        
    </style>
    <style type="text/css">
        
        .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            border: 1px solid #cccccc;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
               -moz-border-radius: 4px;
                    border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
               -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
          }

          .btn:hover,
          .btn:focus,
          .btn:active,
          .btn.active,
          .btn.disabled,
          .btn[disabled] {
            color: #333333;
            background-color: #e6e6e6;
            *background-color: #d9d9d9;
          }

          .btn:active,
          .btn.active {
            background-color: #cccccc \9;
          }

          .btn:first-child {
            *margin-left: 0;
          }

          .btn:hover,
          .btn:focus {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
            -webkit-transition: background-position 0.1s linear;
               -moz-transition: background-position 0.1s linear;
                 -o-transition: background-position 0.1s linear;
                    transition: background-position 0.1s linear;
          }

          .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
          }

          .btn.active,
          .btn:active {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
               -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
                    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
          }

          .btn.disabled,
          .btn[disabled] {
            cursor: default;
            background-image: none;
            opacity: 0.65;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
               -moz-box-shadow: none;
                    box-shadow: none;
          }

        .btn-success {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #5bb75b;
            background-color: #51a351;
            background-image: -moz-linear-gradient(top, #62c462, #51a351);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#51a351));
            background-image: -webkit-linear-gradient(top, #62c462, #51a351);
            background-image: -o-linear-gradient(top, #62c462, #51a351);
            background-image: linear-gradient(to bottom, #62c462, #51a351);
            background-repeat: repeat-x;
            border-color: #51a351 #51a351 #387038;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
          }

          .btn-success:hover,
          .btn-success:focus,
          .btn-success:active,
          .btn-success.active,
          .btn-success.disabled,
          .btn-success[disabled] {
            color: #ffffff;
            background-color: #51a351;
            *background-color: #499249;
          }

          .btn-success:active,
          .btn-success.active {
            background-color: #408140 \9;
          }
          
          .btn-primary {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #006dcc;
            *background-color: #0044cc;
            background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
            background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
            background-image: -o-linear-gradient(top, #0088cc, #0044cc);
            background-image: linear-gradient(to bottom, #0088cc, #0044cc);
            background-repeat: repeat-x;
            border-color: #0044cc #0044cc #002a80;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
          }

          .btn-primary:hover,
          .btn-primary:focus,
          .btn-primary:active,
          .btn-primary.active,
          .btn-primary.disabled,
          .btn-primary[disabled] {
            color: #ffffff;
            background-color: #0044cc;
            *background-color: #003bb3;
          }

          .btn-primary:active,
          .btn-primary.active {
            background-color: #003399 \9;
          }
          
          .btn-warning {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #faa732;
            *background-color: #f89406;
            background-image: -moz-linear-gradient(top, #fbb450, #f89406);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
            background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
            background-image: -o-linear-gradient(top, #fbb450, #f89406);
            background-image: linear-gradient(to bottom, #fbb450, #f89406);
            background-repeat: repeat-x;
            border-color: #f89406 #f89406 #ad6704;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
          }

          .btn-warning:hover,
          .btn-warning:focus,
          .btn-warning:active,
          .btn-warning.active,
          .btn-warning.disabled,
          .btn-warning[disabled] {
            color: #ffffff;
            background-color: #f89406;
            *background-color: #df8505;
          }

          .btn-warning:active,
          .btn-warning.active {
            background-color: #c67605 \9;
          }

        
    </style>
    
    
<%
                String userName = (String) request.getSession().getAttribute("userName");
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
     
       <li><a href="first_view.jsp"  >Current Stock Level</a></li>
       <li><a href="available_stock_graph.jsp" >Umbrella Priorities</a></li>
       <li><a href="order_priority" class="selected" >Mould Priority Chart</a></li>
       <li><a href="summary" > Summary</a></li>

        
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
              <li style="padding-left:0px;"><a href="oic_home_raj" >Home</a></li>
              <li><a href="first_view.jsp" class="selected" >Stock &<br/>Buffer</a></li>
              <li><a href="employee_rate" >Employee<br/>Target</a></li>
              <li><a href="machine_status_selection.jsp" >Machine<br/>Status</a></li>
              <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
              <li><a href="Production_chart.jsp" >New Chart<br/></a></li>
              <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
          <div style="padding-left: 50px">
          
      <br /> <br /><br /> 	
      
      
          <%
    
   
    %>
    <div id="utilize" style="float: right;margin-right: 50px">
    <h1>Machine Utilization</h1><br/>
    <%
    
       
        
    ArrayList<bean_entity.employee_id> utilize=new ArrayList<employee_id>();
    utilize=(ArrayList)request.getSession().getAttribute("utilize");
    
    if(utilize.size()!=0){
       
       out.print("<table class='table2'>");
       out.print("<thead>");
       out.print("<tr>");
       
       
       
       
       out.print("<th scope='col'>");
       out.print("Mould Code");
       out.print("</th>");
       
       out.print("<th scope='col'>");
       out.print("Machine Id");
       out.print("</th>");
       
       out.print("</tr scope='col'>");
       out.print("</thead>");
       out.print("</tbody>");
       
       
      
       
       for(int i=0;i<utilize.size();i++){
           out.print("<tr>");

           out.print("<td>");
           out.print(utilize.get(i).getType());
           out.print("</td>");
           
           out.print("<td>");
           out.print(utilize.get(i).getEmployee());
           out.print("</td>");
           
           out.print("</tr>");
       }
       
       
      
       out.print("</tbody>");
       out.print("</table>");
        
    
    }
    
    
    
    %>
    
    
    
    </div >
    
    <div style="position: absolute;margin-left: 260px;margin-top: 150px" >
        <input type="button" class="btn"  value="Start Utilization" onclick="utilize()" />
      </div><br/>
      
      <div style="width: 100px;margin-top: 170px;position: absolute;margin-left: 260px" >
          <input type="button" class="btn btn-success"  value="Start Machines" onclick="start_machines()" />
      </div>
       
    
    
    <div style="float: left; width:280px;">
        <h1>Mould Priority</h1>
        
        <div id="center-wrapper" >

	<div id="dhe-article-info">
		
		<div id="dhe-step-navigation">
			
			<div class="dhe-clearer">&nbsp;</div>
		</div>
	</div>	


		<div class="dhe-example-section-content">

			<!-- BEGIN: XHTML for example 2.1 -->

			<div id="example-2-1">


				<div class="column left first">

					<ul class="sortable-list">
                                         <%
                                         
                                            
                           ArrayList order= new ArrayList();
                           order= (ArrayList ) request.getSession().getAttribute("order_priority");
        
                          String array_list_to_string=order.toString().replace("[", ",").replace("]", ",");
       
                          String [] split_array=array_list_to_string.split(",");
    
    
    
                                          for(int i=1;i<split_array.length;i++){
                                              String mould_array[]=split_array[i].split("_");
                                              
                                              out.print("<li id="+split_array[i]+" class='sortable-item'>"+split_array[i]+"</li>");
                                              
                                              
                                              
                                          }
                                         
                                         %>
                                            
                                                
            			</ul>

				</div>

				
			</div>

			<div class="clearer">&nbsp;</div>

			<!-- END: XHTML for example 2.1 -->

		</div>
	</div>
                                         <br/><br/>
                                         <p><input type="submit"  id="btn-get" class="btn btn-warning" value="Change Order" /></p>
        <p style="display: inline"><input type="reset" class="buttonR" value="Reset" onClick="window.location.reload()"></p>                                 
      
                                              
                                         
       </div>

       
                                         
     <script type="text/javascript">
           
  function utilize(){
            
    xmlhttp=GetXmlHttpObject();
 

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="utilization_algo";
   

    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("utilize").innerHTML=xmlhttp.responseText;
 // alert(xmlhttp.responseText);
  
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
           
           
           
   function start_machines(){
       
       
       
      window.open('A_start_machines','_self');  
     
     
   }        
           
       </script>    
                                         
                                         
	
		<div class="dhe-example-section-content">

			<!-- BEGIN: XHTML for example 2.4 -->

			
			<div class="clearer">&nbsp;</div>

			<!-- END: XHTML for example 2.4 -->

		</div> 
          </div>
      </div>
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
             <a href="oic_home_raj" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             <a href="first_view.jsp" class="selected" >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
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