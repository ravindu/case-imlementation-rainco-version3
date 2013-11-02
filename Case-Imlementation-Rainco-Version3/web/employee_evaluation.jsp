<%-- 
    Document   : employee_evaluation
    Created on : 22-Aug-2013, 13:27:23
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-1.4.2.min.js"></script>
	<script src="js/03.js"></script>
       
        <link rel="stylesheet" href="css/employee_bar.css">
	<link rel="stylesheet" href="css/03.css">
        
        
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
                        
                        width: 540px;
                }
                #demoTable tbody td input{
                    text-align: center;
                }
                
        </style>
        
        <title>JSP Page</title>
    </head>
  
       <%
       
       ArrayList<bean_entity.employee_evaluation_helper> final_string=new ArrayList();
       final_string=(ArrayList)request.getSession().getAttribute("collection");
       
       String mould_code=(String)request.getSession().getAttribute("mould");
       
       %>
       
     	<body>
		
            <div id="wrapper">
			<div class="chart">
				<h2>Employee Performances for the Mould <% out.print(mould_code); %></h2>
				<table id="data-table" border="1" cellpadding="10" cellspacing="0" >
					<caption>Performance Rates</caption>
                                        <thead>
						<tr>
							<td>&nbsp;</td>
                                                        
                                                        <%
                                                        for(int i=0;i<final_string.size();i++){
                                                            
                                                         String id=final_string.get(i).getEmployee_id();
                                                         out.print("<th scope='col'>"+id+"</th>");
                                                        }
                                                        %>
                                                    
                                                        
						</tr>
					</thead>
					<tbody>
                                            <tr>
                                                    <th scope="row">Employees</th>
                                                    
                                                    <%
                                                    for(int x=0;x<final_string.size();x++){
                                                    
                                                        int rate=final_string.get(x).getRate();
                                                        
                                                        out.print("<td>"+rate+"</td>");
                                                    
                                                    }
                                                    
                                                    
                                                    %>
                                                    
							
							
					
							
						</tr>		
						
					</tbody>
				</table>
                                  
                                                    
			</div>
                                                    
                      <br/><br/>                              
                                                                                            
                      <table id="demoTable" cellspacing="0" >
                          <thead>
                    <tr><th>Employee ID</th>
                    <th>Employee Name</th></tr>
                          </thead>
                          <tbody>
                    
                      <%
                      
                      for(int y=0;y<final_string.size();y++){
                      
                      out.print("<tr>");    
                          
                      out.print("<td>");
                      out.print("<input type='text' style='border: 0;background: initial' value='"+final_string.get(y).getEmployee_id()+"'>");
                      out.print("</td>");
                      
                      
                      out.print("<td>");
                      out.print("<input type='text' style='border: 0;background: initial' value='"+final_string.get(y).getName()+"'>");
                      out.print("</td>");
                      
                      
                      out.print("</tr>");
                      
                      }
                      
                      
                      
                      
                      %>  
                        
                          </tbody>  
                </table> 
                      <br/><br/> <br/><br/> 
		</div>
		
		<!-- JavaScript at the bottom for fast page loading -->
		
		<!-- Grab jQuery from Google -->
		
                
                
                
                
	</body>
</html>