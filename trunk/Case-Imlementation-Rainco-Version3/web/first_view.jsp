
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


      
        <script src="js/functions_page.js"></script>
          <script src="js/A_test.js"></script>
        
      
	
		
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	
		
		<script>
            $(document).ready(function(){
            $("button").click(function(){
            alert($("div").scrollLeft()+" px");
  });
});
</script>
		
		

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
               

                .top-menu ul li {
                    margin:0px;
                    padding:0px;
                    float:left;
                    padding:0px 24px 0px 24px;
                    border-right:1px solid #5c4e42;
                    text-align:center;

                }

                span.imp{ color:#FF0000;}
                
              
                

                .mainTable { margin-left:30px;}
                .mainTable input { margin:0px 5px 0px 0px;}
                .mainTable td{ padding:0 0 5px 5px;}
                .mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
                .buttonStyle{ width:100px; padding:5px 0px; border:none; border:#000 1px solid; margin:10px 10px 20px 10px; cursor:pointer;}

                
                
                          .my_button{
	position: relative;
        float: left;
    color: rgba(255,255,255,1);
    text-decoration: none;
    background-color: rgba(215, 127, 44, 0.9);
    font-family: 'Yanone Kaffeesatz';

    font-size: 1.2em;
    display: block;
    padding: 4px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;

-webkit-box-shadow: 0px 9px 0px rgba(192,192,192,192), 0px 6px 4px rgba(0,0,0,.7);

  
margin: 10px;
	width: 85px;
	text-align: center;
	
	-webkit-transition: all .1s ease;
	-moz-transition: all .1s ease;
	-ms-transition: all .1s ease;
	-o-transition: all .1s ease;
	transition: all .1s ease;
}

.my_button:active {
    -webkit-box-shadow: 0px 3px 0px rgba(222,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
    -moz-box-shadow: 0px 3px 0px rgba(222,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
    box-shadow: 0px 3px 0px rgba(222,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
  
    top: 6px;
}
   

.para{
       font-family: Garamond;
      font-size: 18px;
       
     
}
 .list{
               
                  margin-left: 100px;
                  font-family: Garamond;
                  font-size: 16px;
                  /*background-color: #eee;*/
                  background-color:#BEBEBE;
                  width: 600px;
                  height: 8px;  
                 
            }
            
 .content-2{
                    
                  
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
                            <li><a href="first_view.jsp" class="selected" >Current Stock Level</a></li>
                            <li><a href="available_stock_graph.jsp" >Umbrella Priorities</a></li>
                            <li><a href="order_priority" >Mould Priority Chart</a></li>
                            <li><a href="summary" > Summary</a></li>

                        </ul>
                    </div>
                    <div class="left-inner">
                        <div class="testimonials-main" style="padding-top:15px;">
                            

                        </div>
                    </div>
                    
                    <div class="left-inner">
                        
                        

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



                    <div class="content-2" >
                        <div style="margin-left: 30px">
                        <br /> <br />
                        <h1>Current Stock Level for the Umbrellas</h1><br/>




                        <span class="imp">Click on the graph to view umbrella codes and click on each to view the corresponding mould quantities </span>




                        <br /> <br />
             
        <div style="border:1px;width:700px;height:520px;overflow:auto">
                      
                  <img src="new_graph" onclick="test();" >
		
        </div>		
	
	
                        

                        <div id="txt"></div>
                            <div id="sub_chart"></div>




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