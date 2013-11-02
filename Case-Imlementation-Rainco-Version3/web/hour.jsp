
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="bean_entity.array_dye"%>
<%@page import="bean_entity.array_mould"%>
<%@page import="bean_entity.machine_id"%>
<%@page import="bean_entity.employee_id"%>
<%@page import="bean_entity.machine_count"%>

<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <script language="javascript" src="js/add_row.js"></script>
     </head>   
   <body> 
       <form name="perform" action="" method="" id="perform">

<%

   
 
    
      
    
    ArrayList<employee_id> employee=new ArrayList<employee_id>();
    employee=(ArrayList)request.getSession().getAttribute("employee");
    
    
    ArrayList<machine_id> machine=new ArrayList<machine_id>();
    machine=(ArrayList<machine_id>)request.getSession().getAttribute("machine");
    
    
    ArrayList<array_mould> mould=new ArrayList<array_mould>();
    mould=(ArrayList<array_mould>)request.getSession().getAttribute("mould");
    
    
    
    ArrayList<array_dye> dye=new ArrayList<array_dye>();
    dye=(ArrayList<array_dye>)request.getSession().getAttribute("dye");
    
    
    
    DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
    out.print("Date:    "+df.format(new java.util.Date()));
    
    
  
    
    
    
    out.print("<table border='1' name='mytable' id='mytable'>");
    
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
    out.print("Quantity");
    out.print("</th>");
    
    
    
    out.print("</tr>");
    
    
    
    
    
    
   
    out.print("<tr id = 'row_1'>");
    
    
    out.print("<td>");
    out.print("<select name='employee_name'>");
    out.print("<option value='0'>select employee</option>");
    for(int x1=0;x1<employee.size();x1++){
   
    out.print("<option value='"+employee.get(x1).getEmployee()+"'>" +employee.get(x1).getEmployee()+ "</option>");
    
    }
    
    out.print("</select>");
    out.print("</td>");
    
    
    
    
    out.print("<td>");
    out.print("<select name='mould_name'>");
    out.print("<option value='0'>select mould</option>");
    for(int x2=0;x2<mould.size();x2++){
   
    out.print("<option value='"+mould.get(x2).getMould()+"'>" +mould.get(x2).getMould()+ "</option>");
    
    }
    
    out.print("</select>");
    out.print("</td>");
    
    
    
    
    out.print("<td>");
    out.print("<select name='machine_id'>");
    out.print("<option value='0'>select machine</option>");
    for(int x3=0;x3<machine.size();x3++){
   
    out.print("<option value='"+machine.get(x3).getMachine()+"'>" +machine.get(x3).getMachine()+ "</option>");
    
    }
    
    out.print("</select>");
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
    out.print("<input type='text'  id='quantity' name='quantity' value=''>");
    out.print("</td>");
    
    out.print("</tr>");
    
   
   
    out.print("</table>");
    
    
 
             
     
                
  

%>


<input type="button" name="" value="add" onclick="new_row('mytable')">
<button type="button" onclick="del();">delete last row</button>


<button onclick="s()" type="button">click</button>


</form>
<script type="text/javascript">
    
    
</script>

</body>
</html>

<%

   // out.print(request.getParameter("quantity"));
    




%>