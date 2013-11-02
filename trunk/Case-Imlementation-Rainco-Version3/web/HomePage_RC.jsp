<%-- 
    Document   : mainPage
    Created on : 14-Jul-2013, 17:31:45
    Author     : Ravi
--%>

<%@page import="bean_entity.machine_helper"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
div.uline{
    width: 700px;
    margin-left: 30px;
    height: 1px;
    background-color: #643B0F;
    border-radius: 0.7;
}


form span.imp{ color:#FF0000;}

.mainTable { margin-left:0px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
.buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}

div.green_box{
    height: 5px;
    width: 20px;
    border: 1px;
    
    border-radius: 15px;
}
div.img_box{
    height: 50px;
    width: 100px;
    border: 1px;
    background-repeat: no-repeat;overflow: hidden;
    
    
}

</style>


<script type="text/javascript">
   function a(x){
     document.getElementById("mould"+x+"").style.visibility="visible";
     document.getElementById("mould"+x+"").style.backgroundColor="#fcefa1";
     document.getElementById("mould"+x+"").style.opacity = "0.7";
     
  }
  
  
  function c(x){
      document.getElementById("mould"+x+"").style.visibility="hidden"; 
      
      
  }
  
  
  
    </script>

<style type="text/css">



div#container { margin-left: 120px; padding: 0; text-align: left; top: 80px; width: 600px; }

/*	BULLET GRAPH */
div.box-wrap { position: relative; width: 600px; height: 21px; top: 0; left: 0; margin: 0; padding: 0; }

/*	CHANGE THE WIDTH AND BACKGROUND COLORS AS NEEDED */
div.box1 { position: absolute; height: 20px; width: 600px; left: 0; background-color: #CCC; z-index: 1; font-size: 0; border-radius: 7px;opacity: 0.7  }
div.box3 { position: absolute; height: 16px;width: 0px; left: 60%; background-color:  #643B0F; z-index: 3; font-size: 0; }

/* RED LINE */


/* ONE SEGMENT ONLY */
div.actual { position: absolute; height: 8px; left: 0px; top: 6px; background-color: darkorange; font-size: 0; z-index: 2; font-size: 0;border-radius: 7px;opacity: 0.7 }

/* TWO SEGMENTS */
div.actualMAX { position: absolute; height: 8px; left: 0px; top: 6px; background-color: #70a1d8; font-size: 0; z-index: 5; font-size: 0; }
div.actualPART { position: absolute; height: 8px; left: 0px; top: 6px; background-color: #0a50a1; font-size: 0; z-index: 5; font-size: 0; }

div.mylabel { 
	position: relative; 
	height: 20px; 
	width: 80px; 
	left: -90px; 
	top: 2px; 
	
	z-index: 7; 
	font-size: 0;
	color: #000000; 
	font: 10pt Arial, sans-serif; 
	text-align: left; 
}

div.scale-tb1 {
	padding: 0; 
	margin: 0;
	font-size: 0;
	width: 600px;
	border: 0;	
	position: relative; 
	top: 10px; 
	left: 0px; 
	border-top: 1px solid #8f8f8f; 
}


/*	SCALE MARKS */
div.sc21 { position: absolute; height: 7px; width: 1px; left: 0px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc22 { position: absolute; height: 7px; width: 1px; left: 39px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc23 { position: absolute; height: 7px; width: 1px; left: 79px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc24 { position: absolute; height: 7px; width: 1px; left: 119px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc25 { position: absolute; height: 7px; width: 1px; left: 159px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc26 { position: absolute; height: 7px; width: 1px; left: 199px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }

div.sc31 { position: absolute; height: 7px; width: 1px; left: 239px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc32 { position: absolute; height: 7px; width: 1px; left: 279px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc33 { position: absolute; height: 7px; width: 1px; left: 319px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc34 { position: absolute; height: 7px; width: 1px; left: 359px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc35 { position: absolute; height: 7px; width: 1px; left: 399px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }
div.sc36 { position: absolute; height: 7px; width: 1px; left: 439px; top: 0px; background-color: #8f8f8f; z-index: 7; font-size: 0; }


/*	SCALE TEXT */
div.cap21 { position: absolute; top: 40px; left: -2px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap22 { position: absolute; top: 40px; left: 35px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap23 { position: absolute; top: 40px; left: 71px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap24 { position: absolute; top: 40px; left: 112px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap25 { position: absolute; top: 40px; left: 152px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap26 { position: absolute; top: 40px; left: 191px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }

div.cap31 { position: absolute; top: 40px; left: 220px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap32 { position: absolute; top: 40px; left: 250px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap33 { position: absolute; top: 40px; left: 280px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap34 { position: absolute; top: 40px; left: 310px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap35 { position: absolute; top: 40px; left: 152px; width: 15px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
div.cap36 { position: absolute; top: 40px; left: 191px; width: 150px; font: 8pt Arial, sans-serif; text-align: center; color: #575757; }
</style>



<% 
    
 /* response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("userName")==null)
  {
  response.sendRedirect("LoginPage.jsp");
  }
  */

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
        <a href="" target="_self">Go Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    <div class="light-brown-twelve-font" style="font-weight:bold;"> view message <a href="#" class="orange-twelve-link">click here</a>. <br /> <br />
   
    
    
    </div>
   
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
               <li style="padding-left:0px;"><a href="oic_home_raj"  class="selected"  >Home</a></li>
               <li><a href="first_view.jsp"  >Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="Production_chart.jsp" >New Chart<br/></a></li>
               <li style="border:none; padding-right:0px;"><a href="AdminTools_home_RC.jsp" >Administrative<br/>Tools</a></li>
 
            </ul>
          </div>
        </div>
        
        
            
        
      
      <div class="content-2">
          <%

                                    ResultSet machines = (ResultSet) session.getAttribute("Machine_status");
                                    ResultSet machines_cnt = (ResultSet) session.getAttribute("Machine_count");
                                    int count = 0;
                                    while (machines_cnt.next()) {
                                        count = machines_cnt.getInt("count(machine_id)");
                                    }
                                    
                                    
                                    String mach[][] = new String[count][2];
                                    int i = 0;
                                    
                                    while (machines.next()) {

                                        String mach_id = machines.getString("machine_id");
                                        String status = machines.getString("status");
                                        mach[i][0] = mach_id;
                                        mach[i][1] = status;
                                        i++;
                                        
                                        
                                    }
                                    
                                %>
                                <br/><br/>
                                <h1 style="margin-left: 30px">Machine Status</h1>
                                <div class="uline"></div>
                                <br/>
                                <table style="width: 100%" border ="0">
                                    <tr>
                                        <td style="vertical-align: top;width: 33%">
                                
                                            <table class="mainTable">
                                            <%


                                                int row_cnt= (int) Math.round((double)count/3+0.4);

                                                for(int x =0;x<row_cnt;x++){
                                                    %>
                                                    <tr>
                                                        <td style="width: 100px;" align="center">
                                                            <%
                                                            String col = "";
                                                            if(mach[x][1].equals("available")){
                                                                col = "gold";
                                                            }
                                                            if(mach[x][1].equals("break_down")){
                                                                col = "#FF0000";
                                                            }
                                                            if(mach[x][1].equals("on")){
                                                                col = "#0F6";
                                                            }
                                                            
                                                            %>
                                                            
                                                            <div class="green_box" style="background-color: <% out.print(col); %>"></div></td>
                                                        <td><%
                                                            out.print(mach[x][0]);
                                                            %>
                                                            </td>


                                                    </tr>
                                                    <%
                                                }

                                            %>
                                            </table>
                                        </td>
                                        <td style="vertical-align: top;width: 33%">
                                            <table class="mainTable">
                                            <%




                                                for(int x =row_cnt;x<2*row_cnt;x++){
                                                    %>
                                                    <tr>
                                                        <td style="width: 100px;" align="center">
                                                            <%
                                                            String col = "";
                                                            if(mach[x][1].equals("available")){
                                                                col = "gold";
                                                            }
                                                            if(mach[x][1].equals("break_down")){
                                                                col = "#FF0000";
                                                            }
                                                            if(mach[x][1].equals("on")){
                                                                col = "#0F6";
                                                            }
                                                            
                                                            %>
                                                            <div class="green_box" style="background-color: <% out.print(col); %>"></div></td>
                                                        <td><%
                                                            out.print(mach[x][0]);
                                                            %>
                                                            </td>


                                                    </tr>
                                                    <%
                                                }

                                            %>
                                            </table>
                                        </td>
                                        <td style="vertical-align: top;width: 33%">
                                            <table class="mainTable">
                                            <%




                                                for(int x =2*row_cnt;x<count;x++){
                                                    %>
                                                    <tr>
                                                        <td style="width: 100px;" align="center">
                                                            <%
                                                            String col = "";
                                                            if(mach[x][1].equals("available")){
                                                                col = "gold";
                                                            }
                                                            if(mach[x][1].equals("break_down")){
                                                                col = "#FF0000";
                                                            }
                                                            if(mach[x][1].equals("on")){
                                                                col = "#0F6";
                                                            }
                                                            
                                                            %>
                                                            
                                                            <div class="green_box" style="background-color: <% out.print(col); %>"></div></td>
                                                        <td><%
                                                            out.print(mach[x][0]);
                                                            %>
                                                            </td>


                                                    </tr>
                                                    <%
                                                }

                                            %>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center" style="padding-top: 10px">
                                            <div class="green_box" style="background-color: #0F6;display: inline-block;margin-bottom: 2px;margin-right: 10px"></div>Running
                                            <div class="green_box" style="background-color: gold;display: inline-block;margin-left: 50px;margin-bottom: 2px;margin-right: 10px"></div>Available
                                            <div class="green_box" style="background-color: #FF0000;display: inline-block;margin-left: 50px;margin-bottom: 2px;margin-right: 10px"></div>Break down
                                        </td>
                                    </tr>
                                </table>
                                            

                                            
                                            
                                            
                                                 
      <%

ArrayList<machine_helper> mould_and_quantity=new ArrayList();
mould_and_quantity=(ArrayList)request.getSession().getAttribute("mould_qty");

%>
	
<br/><br/>
<h1 style="margin-left: 30px">Production Progress</h1>
<div class="uline"></div>
<br/><br/>
<div id="container">

    
<%for(int n=0;n<mould_and_quantity.size();n++){%>    
    

<div class="box-wrap"  onmouseover="a(<%out.print(n);%>)" onmouseout="c(<%out.print(n);%>)">
        <div class="box1" ></div>
	
        <div class="box3" ><input type="text" id="mould<%out.print(n);%>" value="completed:<%out.print(mould_and_quantity.get(n).getQty());%> target:<%out.print(mould_and_quantity.get(n).getTotal_qty());%>"  style="width: 200px; visibility: hidden;background-color: initial;border: 0px;text-align: center"></div>

        
        <div class="actual" style="width: <%out.print(mould_and_quantity.get(n).getCompleted());%>px" ></div>
        <div class="mylabel"><%out.print(mould_and_quantity.get(n).getMachine_id());%></div>

</div>

	<p style="height: 10px;"></p>  
        
        
        
       
        
        
<%}%>    







	
	

    



</div><!-- container -->		                                       
                                            
                                            
                                            
                                            
                                            
                                            
                                            
      <% 
      ResultSet employees = (ResultSet) session.getAttribute("employee_data");
      int emp_cnt = 0;
      while(employees.next()){
          emp_cnt++;
      }
      
      String emp_detail[][] = new String[emp_cnt][2];
                                    int p = 0;
                                    employees.beforeFirst();
                                    while (employees.next()) {

                                        String emp_name = employees.getString("employee.employee_name");
                                        String role = employees.getString("employee.employee_type");
                                        //out.print(emp_name);
                                        emp_detail[p][0] = emp_name;
                                        emp_detail[p][1] = role;
                                        p++;
                                        
                                        
                                    }
      
      %>
      <br/><br/><br/>
      <h1 style="margin-left: 30px">Work Force</h1>
      <div class="uline"></div>
      <br/>
      <table style="width: 100%;margin-left: 30px" border ="0">
          <tr>
          <td style="vertical-align: top;width: 33%">
              <table border ="0" class="mainTable">
                  <%
                    int row_cnt_emp=(int)Math.round((float)emp_cnt/3+0.4);
                    for(int x =0;x<row_cnt_emp;x++){
                  %>
                  <tr>
                      <td>
                          <%
                            
                            String pic = "";
                            if(emp_detail[x][1].equals("Foreman")){
                            pic = "images/mechanic_icon_1.png";
                            }
                            if(emp_detail[x][1].equals("machine operator")){
                            pic = "images/people-operator_1.png";
                            }
                            if(emp_detail[x][1].equals("mould supervisor")){
                            pic = "images/Supervisor_11.png";
                            }
                            
                            %>
                          <div class="img_box" style="background-image: url(<%out.print(pic);%>)"></div>
                      </td>
                      <td><%out.print(emp_detail[x][0]);%></td>
                  </tr>
                  <%
                    }
                  %>
                  
              </table>
              
          </td>
          <td style="vertical-align: top;width: 33%">
              <table border ="0" class="mainTable">
                  <%
                    
                    for(int x =row_cnt_emp;x<2*row_cnt_emp;x++){
                  %>
                  <tr>
                      <td>
                          <%
                            
                            String pic = "";
                            if(emp_detail[x][1].equals("Foreman")){
                            pic = "images/mechanic_icon_1.png";
                            }
                            if(emp_detail[x][1].equals("machine operator")){
                            pic = "images/people-operator_1.png";
                            }
                            if(emp_detail[x][1].equals("mould supervisor")){
                            pic = "images/Supervisor_11.png";
                            }
                            
                            %>
                          <div class="img_box" style="background-image: url(<%out.print(pic);%>)"></div>
                          
                      </td>
                      <td><%out.print(emp_detail[x][0]);%></td>
                  </tr>
                  <%
                    }
                  %>
                  
              </table>
              
          </td>
          <td style="vertical-align: top;width: 33%">
              <table border ="0" class="mainTable">
                  <%
                    
                    for(int x =2*row_cnt_emp;x<emp_cnt;x++){
                  %>
                  <tr>
                      <td>
                          <%
                            
                            String pic = "";
                            if(emp_detail[x][1].equals("Foreman")){
                            pic = "images/mechanic_icon_1.png";
                            }
                            if(emp_detail[x][1].equals("machine operator")){
                            pic = "images/people-operator_1.png";
                            }
                            if(emp_detail[x][1].equals("mould supervisor")){
                            pic = "images/Supervisor_11.png";
                            }
                            
                            %>
                          <div class="img_box" style="background-image: url(<%out.print(pic);%>)"></div>
                          
                      </td>
                      <td><%out.print(emp_detail[x][0]);%></td>
                  </tr>
                  <%
                    }
                  %>
                  
              </table>
              
          </td>
          </tr>
          <tr>
              <td colspan="3" style="text-align: center">
                  <div class="img_box" style="background-image: url(images/Supervisor_11.png) ;display: inline-table;padding-top: 50px;text-align: left">Supervisor</div>
                  <div class="img_box" style="background-image: url(images/mechanic_icon_1.png) ;display: inline-table;;padding-top: 50px;text-align: left">Mechanic</div>
                  <div class="img_box" style="background-image: url(images/people-operator_1.png) ;display: inline-table;;padding-top: 50px;text-align: left">Operator</div>
              </td>
              
              
          </tr>
      </table>
                                         
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
      </div>
	  
	  
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                  <a href="oic_home_raj"  class="selected" >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="machine_status" >Machine Status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="oic_home_h.jsp"  >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="Production_chart.jsp" >New Chart</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
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
