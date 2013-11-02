<%-- 
    Document   : mainPage
    Created on : 14-Jul-2013, 17:31:45
    Author     : Ravi
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.db_con"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/jquery-ui_RC.css" />
<link rel="stylesheet" href="css/main.css"/>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>

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

<style type="text/css">
body
{
	background-color:white;
}

.mainTable { margin-left:0px;width:480px;}
	.mainTable input { margin:0px 5px 0px 0px;}
	.mainTable td{ padding:0 0 5px 5px;}
	.mainTable th{ text-align:left; padding-top:20px; font-size:19px;}
	
#tabs
{
	width:710px;
	height:810px;
	margin:0px 0px 0px 20px;
}
#tabs-1
{
	width:670px;
	height:810px;
}

#tabs-2
{
	width:670px;
	height:810px;
}

#tabs-3
{
	width:670px;
	height:810px;
}
#tabs-4
{
	width:670px;
	height:810px;
}
#tabs-5
{
	width:670px;
	height:810px;
}

.mainTable
{
	width:590px;
	margin:30px 0px 0px 0px;
}


</style>
<% 
  
 /* response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("userName")==null)
  {
  response.sendRedirect("LoginPage.jsp");
  }*/
  

%>

<script type="text/javascript">
    /*function enableCombobox(isChecked,idz)
    {
        document.getElementById(idz).disabled = isChecked ? "" : "disabled";
    }*/
    
    function addTotalMouldSSS()
     {
        var tabl = document.getElementById('tableMoulds');

        var l = tabl.rows.length;
        var i = 0;
        for (i = 0; i < l; i++ )
        {
            var tr = tabl.rows[i];
            var cll = tr.cells[0];
            if(cll.firstChild.checked)
            {
                var val = tr.cells[0].firstChild.value.toString();
                //alert(val);
                if(val==="rings")
                {
                    var code = $("#ring_selection option:selected").val();
                    var umb = document.getElementById('txt_umbId').value;
                    //alert(code);
                    var textV=document.getElementById('txt_No_Ring').value;
                    //alert(textV);
                    checkUmbMouldAdd(umb,code,textV,'MouldServlet_retrieveMould2');
                    //alert("function");
                    
                }
                
                if(val==="clips")
                {
                    var code = $("#clip_selection option:selected").val();
                    var umb = document.getElementById('txt_umbId').value;
                    //alert(code);
                    var textV=document.getElementById('txt_No_Clip').value;
                   // alert(textV);
                    checkUmbMouldAdd(umb,code,textV,'MouldServlet_retrieveMould2');
                   // alert("function");
                    
                }
                
                if(val==="handles")
                {
                    var code = $("#handle_selection option:selected").val();
                    var umb = document.getElementById('txt_umbId').value;
                    //alert(code);
                    var textV=document.getElementById('txt_No_Handle').value;
                    //alert(textV);
                    checkUmbMouldAdd(umb,code,textV,'MouldServlet_retrieveMould2');
                   
                    
                }
                
                if(val==="whistels")
                {
                    var code = $("#whistel_selection option:selected").val();
                    var umb = document.getElementById('txt_umbId').value;
                    //alert(code);
                    var textV=document.getElementById('txt_No_Clip').value;
                    //alert(textV);
                    checkUmbMouldAdd(umb,code,textV,'MouldServlet_retrieveMould2');
                    //alert("function");
                    
                }
                
                if(val==="others")
                {
                    var code = $("#other_selection option:selected").val();
                    var umb = document.getElementById('txt_umbId').value;
                    //alert(code);
                    var textV=document.getElementById('txt_No_Clip').value;
                    //alert(textV);
                    checkUmbMouldAdd(umb,code,textV,'MouldServlet_retrieveMould2');
                    //alert("function");
                    
                }
                
            }
        }
        
     }
    
    function clickaddMould()
    {
              var value = $("#whistel_selection option:selected").val();
              var value1 = $("#ring_selection option:selected").val();
              var value2 = $("#clip_selection option:selected").val();
              var value3 = $("#handle_selection option:selected").val();
              var value4 = $("#other_selection option:selected").val();
              var vall=document.getElementById('txt_mouldId').value;
              $("#btn_save").attr('disabled',false);
              $("#success_message").val(null);
             
              
              if(value==="newMouldW")
              {
                  
                  document.getElementById("whistel_selection").innerHTML += "<option value=\"" + vall+ "\">"+vall+"</option>";
                  $("option[value='"+vall+"']").attr('selected', 'selected');
                  //alert($("#whistel_selection option:selected").val());
                  enableSelect();
                  enableCheckbox();
                 
                  $("#whistel_selection").attr("disabled",true);
                  $("#whistel").attr("disabled",true);
                  $("#txt_No_Whistel").attr('disabled',true);
                  
                  document.getElementById("whistelMessage").style.color="green";
                  document.getElementById("whistelMessage").innerHTML="CREATED"; 
                  
              }
              
              if(value1==="newMouldR")
              {
                  document.getElementById("ring_selection").innerHTML += "<option value=\"" + vall+ "\">"+vall+"</option>";
                  $("option[value='"+vall+"']").attr('selected', 'selected');
                  enableCheckbox();
                  enableSelect();
                  
                  $("#ring_selection").attr("disabled",true);
                  $("#ring").attr("disabled",true);
                  $("#txt_No_Ring").attr('disabled',true);
                  //$("#whistel").attr('disabled',false);
                  //$("#clip").attr('disabled',false);
                  //$("#handle").attr('disabled',false);
                 // $("#otherR").attr('disabled',false);
                  document.getElementById("ringMessage").style.color="green";
                  document.getElementById("ringMessage").innerHTML="CREATED"; 
                  
                        
              }
              
              if(value2==="newMouldC")
              {
                document.getElementById("clip_selection").innerHTML += "<option value=\"" + vall+ "\">"+vall+"</option>";
                  $("option[value='"+vall+"']").attr('selected', 'selected');
                  $("#clip_selection").attr("disabled",true);
                  $("#clip").attr("disabled",true);
                  $("#txt_No_Clip").attr('disabled',true);
                  $("#ring").attr('disabled',false);
                  $("#whistel").attr('disabled',false);
                  $("#handle").attr('disabled',false);
                  $("#otherR").attr('disabled',false);
                  document.getElementById("clipMessage").style.color="green";
                  document.getElementById("clipMessage").innerHTML="CREATED"; 
                  
                        
              }
              
              if(value3==="newMouldH")
              {
                  document.getElementById("handle_selection").innerHTML += "<option value=\"" + vall+ "\">"+vall+"</option>";
                  $("option[value='"+vall+"']").attr('selected', 'selected');
                  
                  enableSelect();
                  enableCheckbox();
                  
                  $("#handle_selection").attr("disabled",true);
                  $("#handle").attr("disabled",true);
                  $("#txt_No_Handle").attr("disabled",true);
                        //$("#ring").attr('disabled',false);
                        //$("#clip").attr('disabled',false);
                        //$("#whistel").attr('disabled',false);
                        //$("#otherR").attr('disabled',false);
                  document.getElementById("handleMessage").style.color="green";
                  document.getElementById("handleMessage").innerHTML="CREATED"; 
                  
                        
              }
              
              if(value4==="newMouldO")
              {
                  document.getElementById("other_selection").innerHTML += "<option value=\"" + vall+ "\">"+vall+"</option>";
                  $("option[value='"+vall+"']").attr('selected', 'selected');
                  $("#other_selection").attr("disabled",true);
                  $("#other").attr("disabled",true);
                  $("#txt_No_Other").attr('disabled',true);
                  $("#ring").attr('disabled',false);
                        $("#clip").attr('disabled',false);
                        $("#handle").attr('disabled',false);
                        $("#whistel").attr('disabled',false);
                  document.getElementById("otherMessage").style.color="green";
                  document.getElementById("otherMessage").innerHTML="CREATED"; 
                  
                        
              }
       
              $('#div1').hide('slow');
    }
    
    function activateCheckBox(id)
    {
       $(id).keypress(function(){
           
       }) ;
    }
    
    
    
    $(document).ready(function () {
          $('select').change(function() 
          {
              var value = $("#whistel_selection option:selected").val();
              var value1 = $("#ring_selection option:selected").val();
              var value2 = $("#clip_selection option:selected").val();
              var value3 = $("#handle_selection option:selected").val();
              var value4 = $("#other_selection option:selected").val();
              var umbrellaID=$("#txt_umbId").val();
              $("#btn_save").attr('disabled',false);
              
              $("#txt_mouldName").val(null);
              $("#txt_runner").val(null);
              $("#txt_mouldCapa").val(null);
              $("#txt_items").val(null);
              
              if(value==="newMouldW" && $('#whistel').is(":checked"))
                  {
                        $('#div1').show('slow');
                        $("#txt_umbIDz").val(umbrellaID);
                        $("#btn_save").attr('disabled',true);
                        
                        dissableSelect();
                        
                        var mouldId=umbrellaID+"_whistel";
                        $("#txt_mouldId").val(mouldId);
                        $('#txt_quantity').val($('#txt_No_Whistel').val());
                        
                       dissableCheckbox();
                        
                        
                        
                  }
               else if (value1==="newMouldR" && $('#ring').is(":checked"))
                  {
                        $('#div1').show('slow');
                        $("#txt_umbIDz").val(umbrellaID);
                        $("#btn_save").attr('disabled',true);
                        
                       dissableSelect();
                        
                        var mouldId=umbrellaID+"_ring";
                        $("#txt_mouldId").val(mouldId);
                        $('#txt_quantity').val($('#txt_No_Ring').val());
                        
                        dissableCheckbox();
                  }
               else if (value2==="newMouldC" && $('#clip').is(":checked"))
                  {
                        $('#div1').show('slow');
                        $("#txt_umbIDz").val(umbrellaID);
                        
                        $("#btn_save").attr('disabled',true);
                        
                        dissableSelect();
                        
                        var mouldId=umbrellaID+"_clip";
                        $("#txt_mouldId").val(mouldId);
                        $('#txt_quantity').val($('#txt_No_Clip').val());
                        
                        dissableCheckbox();
                        
                  }
                else if (value3==="newMouldH" && $('#handle').is(":checked"))
                  {
                        $('#div1').show('slow');
                        $("#txt_umbIDz").val(umbrellaID);
                      
                        
                        $("#btn_save").attr('disabled',true);
                        
                       dissableSelect();
                       
                       var mouldId=umbrellaID+"_handle";
                        $("#txt_mouldId").val(mouldId);
                        $('#txt_quantity').val($('#txt_No_Handle').val());
                        
                        dissableCheckbox();
                  }
                else if(value4==="newMouldO" && $('#otherR').is(":checked"))
                {
                        $('#div1').show('slow');
                        $("#txt_umbIDz").val(umbrellaID);
                        
                        $("#btn_save").attr('disabled',true);
                        
                        dissableSelect();
                        
                        $("#txt_mouldId").val(null);
                        $('#txt_quantity').val($('#txt_No_Other').val());
                        
                        dissableCheckbox();
                }
                else{$('#div1').hide('slow');}
          });
      });
      
     $(document).ready(function () 
     {
         $('#btn_close').click(function () {
             $('#div1').hide('slow');
             var cmbValueW=$('#whistel_selection').val();
             var cmbValueC=$('#clip_selection').val();
             var cmbValueH=$('#handle_selection').val();
             var cmbValueR=$('#ring_selection').val();
             var cmbValueO=$('#other_selection').val();
             $("#btn_save").attr('disabled',false);
             
            $('#txt_umbIDz').val(null);
            $('#txt_mouldId').val(null);
            $('#txt_mouldName').val(null);
            $('#txt_runner').val(null);
            $('#txt_mouldCapa').val(null);
            $('#txt_items').val(null);
            
             if(cmbValueW==="newMouldW")
             {
             $("#whistel").prop('checked', false); 
             $('#whistel_selection').val("compulsary");
             //$("#whistel_selection").attr('disabled',true);
             $('#txt_No_Whistel').val(null);
                        $("#ring").attr('disabled',false);
                        $("#clip").attr('disabled',false);
                        $("#handle").attr('disabled',false);
                        $("#otherR").attr('disabled',false);
                        $("#whistel").attr('disabled',false);
             }
             
             if(cmbValueR==="newMouldR")
             {
             $("#ring").prop('checked', false); 
             $('#ring_selection').val("compulsary");
             $("#ring_selection").attr('disabled',true);
            // $("#txt_No_Ring").attr('disabled',true);
             $('#txt_No_Ring').val(null);
                        $("#ring").attr('disabled',false);
                        $("#clip").attr('disabled',false);
                        $("#handle").attr('disabled',false);
                        $("#otherR").attr('disabled',false);
                        $("#whistel").attr('disabled',false);
             }
             
             if(cmbValueC==="newMouldC")
             {
             $("#clip").prop('checked', false); 
             $('#clip_selection').val("compulsary");
             $("#clip_selection").attr('disabled',true);
            // $("#txt_No_Clip").attr('disabled',true);
             $('#txt_No_Clip').val(null);
                        $("#ring").attr('disabled',false);
                        $("#clip").attr('disabled',false);
                        $("#handle").attr('disabled',false);
                        $("#otherR").attr('disabled',false);
                        $("#whistel").attr('disabled',false);
             }
             
             if(cmbValueH==="newMouldH")
             {
             $("#handle").prop('checked', false); 
             $('#handle_selection').val("compulsary");
             $("#handle_selection").attr('disabled',true);
             //$("#txt_No_Handle").attr('disabled',true);
             $('#txt_No_Handle').val(null);
                        $("#ring").attr('disabled',false);
                        $("#clip").attr('disabled',false);
                        $("#handle").attr('disabled',false);
                        $("#otherR").attr('disabled',false);
                        $("#whistel").attr('disabled',false);
             }
             
             if(cmbValueO==="newMouldO")
             {
             $("#otherR").prop('checked', false); 
             $('#other_selection').val("compulsary");
             $("#other_selection").attr('disabled',true);
             //$("#txt_No_Other").attr('disabled',true);
             $('#txt_No_Other').val(null);
                        $("#ring").attr('disabled',false);
                        $("#clip").attr('disabled',false);
                        $("#handle").attr('disabled',false);
                        $("#otherR").attr('disabled',false);
                        $("#whistel").attr('disabled',false);
             }
             
          });
               
     });
     
     
    
</script>


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
      <li><a href="RawServlet_retrieveRaw">Raw materials settings</a></li>
      <li><a href="DyeServlet_retrieveDye">Dye code settings</a></li>
      <li><a href="MachineServlet_retrieveMachine">Machines settings</a></li>
      <li><a href="SparepartServlet_retrieve" >Spareparts settings</a></li>
      <li><a href="BranchServlet_retrieveBranch"  >Company branches setting</a></li>
      <li><a href="fillSelectFields"class="selected" >Umbrella settings</a></li>
      <li><a href="ActiveLog_retrieve" >Active log</a></li>
      
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
                <li style="padding-left: 0px"><a href="oic_home_raj">Home</a></li>
               <li><a href="first_view.jsp"  class="selected">Stock &<br/>Buffer</a></li>
               <li><a href="employee_rate" >Employee<br/>Target</a></li>
               <li><a href="machine_status" >Machine<br/>Status</a></li>
               <li><a href="oic_home_h.jsp" >Machine<br/> Maintenance</a></li>
               <li><a href="production_chart_entering" >New Chart<br/></a></li>
               <li style="border:none"><a href="AdminTools_home_RC.jsp" class="selected" >Administrative<br/>Tools</a></li>
            </ul>
          </div>
        </div>
        
        
      
      <div class="content-2">
          <div id="mainContend2" style="margin: 33px 0px 30px 7px">
              
              <div id="tabs">
<ul>
<li><a href="#tabs-1">Add new umbrella </a></li>
<li><a href="#tabs-2">Edit/Update umbrella details</a></li>
<li><a href="#tabs-3">Edit/Update mould details</a></li>
<li><a href="#tabs-4">Delete umbrella</a></li>
<li><a href="#tabs-5">Delete mould</a></li>
</ul>
<div id="tabs-1">
                     
<form action=""  method="post">
		<h2>Add new Umbrella</h2>
                <table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="157">Umbrella id</td>
                        <td width="243"><input type="text" name="txt_umbid" id="txt_umbId" class="formfeild" maxlength="4" /></td>
                        <!--<td id="okk" style="width:170px"></td>-->
                        <td width="170"><input type="text" id="txt_okk" class="formfeild"  style="border: none;"/></td>
		</tr>
                <tr>
			<td></td>
                        <td colspan="2"><input type="button" name="btn_searchUmb" class="button" value="Check availability" onclick="checkUmbValidation('txt_umbId','MouldServlet_retrieveMould2');validationBeforeSave('txt_okk');"/></td>
		</tr>
		
		<tr valign="top">
			<td>Umbrella colour</td>
                        <td colspan="2"><select class="formfeild" id="colour_selection">
                                <option value="colour">colour</option>
                                <option value="black">black</option>
                                <option value="spray">spray</option>
                            </select>
                        </td>
		</tr>
               </table> 
            </form> 
                <br/>
                <h2>Select/Create umbrella parts and relevent moulds</h2>
                <form action=""  method="post">
                <table border="0" class="mainTable" cellpadding="0" cellspacing="0" id="tableMoulds">
                    <tr valign="top">
                        <td width="100"><h3 style="color:#b1440f"><b>Mould type</b></h3></td>
                        <td width="100"><h3 style="color:#b1440f"><b>No of items</b></h3></td>
                        <td width="200" colspan="2"><h3 style="color:#b1440f"><b>Mould list</b></h3></td>
                        
                </tr>
                
                <tr valign="top">
                    <td><input type="checkbox" id="ring" value="rings" onchange="enableCombobox(this.checked,'ring_selection');"/> Rings</td>
                    <td><input type="text" class="formfeild" id="txt_No_Ring" style="width:70px" maxlength="1" onblur="MouldQtyCheck('txt_No_Ring','ring_selection')" /></td>
                    <td>
                   <select class="formfeild" id="ring_selection" disabled="disabled">
                        <option value="compulsary" selected="selected">select ring mould</option>
                        <option value="newMouldR">Create ring mould</option>
                   <%
                        ResultSet rs=(ResultSet)request.getSession().getAttribute("result1");
                    %>
                    <%
                        String variableR=null;
                        while(rs.next())
                        {
                            String ring=rs.getString("mould_code");
                            String []y=ring.split("_");
                            if(y[1].equals("ring"))
                            {
                                variableR=ring;
                            
                    %>
                        <option value="<%=variableR%>"><%=variableR%></option>
                    <%
                            }}
                    %>
                        
                  </select>  
                 </td>
                 <td id="ringMessage"style="width: 120px"></td>
                </tr>
                <tr valign="top">
                 <td><input type="checkbox" id="clip" value="clips" onchange="enableCombobox(this.checked,'clip_selection');"/> Clips</td>
                 <td><input type="text" class="formfeild" id="txt_No_Clip" style="width:70px" maxlength="1" onblur="MouldQtyCheck('txt_No_Clip','clip_selection')" /></td>
                 <td>
                   <select class="formfeild" id="clip_selection" disabled="disabled">
                        <option value="compulsary" selected="selected">select clip mould</option>
                        <option value="newMouldC">Create clip mould</option>
                   
                    <%
                        ResultSet rs1=(ResultSet)request.getSession().getAttribute("result2");
                    %>
                        <%
                        String variableC=null;
                        while(rs1.next())
                        {
                            String clip=rs1.getString("mould_code");
                            String []yc=clip.split("_");
                            if(yc[1].equals("clip"))
                            {
                                variableC=clip;
                            
                    %>
                        <option value="<%=variableC%>"><%=variableC%></option>
                    <%
                            }}
                    %>
			
		</select>  
                     
                 </td>
                 <td id="clipMessage"></td>
                </tr>
                <tr valign="top">
                 <td><input type="checkbox" id="handle" value="handles" onchange="enableCombobox(this.checked,'handle_selection');"/> Handles</td>
                 <td><input type="text" class="formfeild" id="txt_No_Handle" style="width:70px" maxlength="1" onblur="MouldQtyCheck('txt_No_Handle','handle_selection')" /></td>
                 <td>
                     <select class="formfeild" id="handle_selection" disabled="disabled" >
                        <option value="compulsary" selected="selected">select handle mould</option>
                        <option value="newMouldH">Create handle mould</option>
		   <%
                        
                        ResultSet rs2=(ResultSet)request.getSession().getAttribute("result3");
                    %>
                    <%
                        String variableH=null;
                        while(rs2.next())
                        {
                            String handle=rs2.getString("mould_code");
                            String []y=handle.split("_");
                            if(y[1].equals("handle"))
                            {
                                variableH=handle;
                            
                    %>
                        <option value="<%=variableH%>"><%=variableH%></option>
                    <%
                            }}
                    %>
			
                    
		</select>  
                     
                 </td>
                 <td id="handleMessage" style="width: 120px"></td>
                </tr>
                <tr valign="top">
                    <td><input type="checkbox" id="whistel" value="whistels" onclick="enableCombobox(this.checked,'whistel_selection');"/> Whistel</td>
                    <td><input type="text" class="formfeild" id="txt_No_Whistel" style="width:70px" maxlength="1" onblur="MouldQtyCheck('txt_No_Whistel','whistel_selection')" /></td>
                    <td>
                     <select class="formfeild" id="whistel_selection" disabled="disabled" /> 
                        <option value="compulsary" selected="selected">select whistel mould</option>
                        <option value="newMouldW">Create whistel mould</option>
                    <%
                        
                        ResultSet rs3=(ResultSet)request.getSession().getAttribute("result4");
                    %>
                    <%
                        String variableW=null;
                        while(rs3.next())
                        {
                            String whistel=rs3.getString("mould_code");
                            String []y=whistel.split("_");
                            if(y[1].equals("whistel"))
                            {
                                variableW=whistel;
                            
                    %>
                        <option value="<%=variableW%>"><%=variableW%></option>
                    <%
                            }}
                    %>
			
		</select>
                   <td id="whistelMessage" style="width: 120px"></td>  
                 
                 <!--<td id="whistelMessage"></td>-->
                </tr>
                <tr>
                    <td><input type="checkbox" id="otherR" value="others" onclick="enableCombobox(this.checked,'other_selection');"/> Other</td>
                    <td><input type="text" class="formfeild" id="txt_No_Other" style="width:70px" maxlength="1" onblur="MouldQtyCheck('txt_No_Other','other_selection')"/></td>
                    <td><select class="formfeild" id="other_selection" disabled="disabled" >
                        <option value="compulsary" selected="selected">select mould creation step</option>
                        <option value="newMouldO">Create new mould</option>
                        <%
                        
                        ResultSet rs4=(ResultSet)request.getSession().getAttribute("result5");
                    %>
                    <%
                        String variableO=null;
                        while(rs4.next())
                        {
                            String clip=rs4.getString("mould_code");
                            String []y=clip.split("_");
                            if(!(y[1].equals("clip") || y[1].equals("handle") || y[1].equals("ring") || y[1].equals("whistel")))
                            {
                                variableO=clip;
                            
                    %>
                        <option value="<%=variableO%>"><%=variableO%></option>
                    <%
                            }}
                    %>
                        </select></td>
                        
                </tr>
                <td id="otherMessage" style="width: 120px"></td>
                    
                </table>
             </form>
                    
            <div id="div1" style="width: 620px;height:335px;background-color: #f5f5f5;display: none;margin: 15px 0px 0px 0px">
               <form action=""  method="post" name="form2">
                <h2>Create new mould to umbrella</h2>
                <table border="0" class="mainTable" cellpadding="0" cellspacing="0">
               <tr valign="top">
                <td width="157">Umbrella id</td>
                <td colspan="2" width="243"><input type="text" name="txt_umbID" id="txt_umbIDz" class="formfeild" readonly/></td>
                
               </tr>
		<tr valign="top">
			<td width="157">Mould id</td>
                        <td colspan="2" width="243"><input type="text" name="txt_mouldid" id="txt_mouldId" class="formfeild" /></td>
		</tr>
		<tr valign="top">
			<td>No of items</td>
                        <td colspan="2"><input type="text" name="txt_quantity" id="txt_quantity" class="formfeild" readonly /></td>
		</tr>
		<tr valign="top">
			<td>Mould name</td>
			<td><input type="text" name="txt_mould_name" id="txt_mouldName" class="formfeild" /></td>
                        <td id="CreatemouldName" style="width:150px"></td>
		</tr>
                
                <tr valign="top">
                    <td colspan="3"><h2 style="color:#b1440f">New mould features</h2></td>
		  
		</tr>
                <tr valign="top">
			<td width="157">Runner wastage</td>
                        <td width="243"><input type="text" name="txt_runner" id="txt_runner" class="formfeild" onblur="checkMouldCreation('txt_runner','CreatemoulRunner')" /></td>
                  <td id="CreatemoulRunner" style="width:150px"></td>
		</tr>
		
		<tr valign="top">
			<td>Mould capacity</td>
			<td><input type="text" name="txt_mould_capa" id="txt_mouldCapa" class="formfeild" onblur="checkMouldCreation('txt_mouldCapa','CreatemouldCapa')" /></td>
                        <td id="CreatemouldCapa" style="width:150px"></td>
                    </tr>
                <tr valign="top">
			<td>Items per Kg</td>
			<td><input type="text" name="txt_items" id="txt_items" class="formfeild" onblur="checkMouldCreation('txt_items','CreatemouldItems')" /></td>
                        <td id="CreatemouldItems" style="width:150px"></td>
		</tr>
                <tr>
                        <td></td>
                        <td><input type="button" id="btn_addnew_mould667" class="button" value="Add new mould" onclick="callAjaxAddMould('txt_mouldId','txt_mouldName','txt_runner','txt_mouldCapa','txt_items','MouldServlet','success_message');clickaddMould();ToActiveLog_Add('txt_mouldId','ActiveLogServlet','<%=userName%>','save_message','<%="mould"%>')" /></td>
                        <td id="success_message"></td>
		</tr>
                <tr>
                    <td></td>
                    <td><input type="button" id="btn_close" class="button" value="close"/></td>
                </tr>
                
               </table>
               </form>
          </div>
                        <input type="button" id="btn_save"  class="button" style="margin: 15px 0px 0px 230px" value="Save data" onclick="callAjaxAddUmbrella('txt_umbId','colour_selection','UmbrellaServlet','save_success');addTotalMouldSSS();ToActiveLog_Add('txt_umbId','ActiveLogServlet','<%=userName%>','save_message','<%="umbrella"%>')" disabled="disabled"/>
         
         <div id="save_success" style="margin: 15px 0px 0px 230px"></div>
     </div>
       
     <div id="tabs-2">
	<form action=""  method="post">
		<h2>Edit and update Umbrella</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select the umbrella</td>
		<td>
                    <select class="formfeild" id="umbrella_edit">
                        <option value="compulsary" selected="selected">Please select a branch</option>
			 <%
                        
                        ResultSet rs_edit2=(ResultSet)request.getSession().getAttribute("edit1");
                        %>
                        <%
                        String variableEM=null;
                        while(rs_edit2.next())
                        {
                          variableEM=rs_edit2.getString("umbrella_code");
                    %>
                        <option value="<%=variableEM%>"><%=variableEM%></option>
                    <%
                            }
                    %>
			
		</select>
		</td>
		</tr>
		
		<tr valign="top" style="height:3px">
		</tr>
		
		<tr>
			<td></td>
			<td><input type="button" name="btn_find_umbrella" class="button" value="Find umbrella" onclick="callAjaxUmbrellaSelect('umbrella_edit','UmbrellaServlet','txt_umbCodeEdit')" /></td>
		</tr>
		
		<tr valign="top" style="height:30px">
		</tr>
		
		<tr valign="top">
			<td>Umbrella code</td>
			<td><input type="text" name="txt_umbCodeEdit" id="txt_umbCodeEdit" class="formfeild" readonly="true" /></td>
		</tr>
		
		<tr valign="top">
			<td>Colour</td>
			<td>
                            <select class="formfeild" id="Editcolour_selection">
                                <option value="colour">colour</option>
                                <option value="black">black</option>
                                <option value="spray">spray</option>
                            </select>
                        </td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="button" name="btn_update_umbrella" class="button" value="Save & Update umbrella details" onclick="callAjaxUmbrella_update('txt_umbCodeEdit','Editcolour_selection','UmbrellaServlet','update_messageE');ToActiveLog_Update('umbrella_edit','ActiveLogServlet','<%=userName%>','update_message','<%="umbrella"%>')"/></td>
		</tr>
                <tr>
                    <td></td>
                    <td id="update_messageE"><h2></h2></td>
                </tr>
		</table> 
	</form>
	</div>
                    
        <div id="tabs-3">
	<form action=""  method="post">
		<h2>Edit and update mould</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select the mould</td>
		<td>
                    <select class="formfeild" id="mould_edit">
                        <option value="compulsary" selected="selected">Please select a mould</option>
			 <%
                        
                        ResultSet UpdateM=(ResultSet)request.getSession().getAttribute("EMU");
                        %>
                        <%
                        String x1=null;
                        while(UpdateM.next())
                        {
                          x1=UpdateM.getString("mould_code");
                    %>
                        <option value="<%=x1%>"><%=x1%></option>
                    <%
                            }
                    %>
			
		</select>
		</td>
		</tr>
		
		<tr valign="top" style="height:3px">
		</tr>
		
		<tr>
			<td></td>
			<td><input type="button" name="btn_find_mould" class="button" value="Find mould" onclick="callAjaxMouldSelect('mould_edit','MouldServlet')" /></td>
		</tr>
		
		<tr valign="top" style="height:30px">
		</tr>
		
		<tr valign="top">
			<td>Mould code</td>
			<td><input type="text" name="txt_mouldIdEditId" id="txt_mouldIdEditId" class="formfeild" readonly="true" /></td>
		</tr>
		<tr valign="top">
			<td>Mould name</td>
			<td><input type="text" name="txt_mouldIdEditName" id="txt_mouldIdEditName" class="formfeild" /></td>
		</tr>
		<tr valign="top">
			<td>Runner wastage</td>
			<td><input type="text" name="txt_mouldRunnerEdit" id="txt_mouldRunnerEdit" class="formfeild"/></td>
		</tr>
		<tr valign="top">
			<td>Mould capacity</td>
			<td><input type="text" name="txt_mouldCapaEdit" id="txt_mouldCapaEdit" class="formfeild"/></td>
		</tr>
                <tr valign="top">
			<td>Items per mould</td>
			<td><input type="text" name="txt_mouldItemEdit" id="txt_mouldItemEdit" class="formfeild"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" name="btn_update_mould" class="button" value="Save & Update mould details" onclick="callAjaxUpdateMould('txt_mouldIdEditId','txt_mouldIdEditName','txt_mouldRunnerEdit','txt_mouldCapaEdit','txt_mouldItemEdit','MouldServlet','update_messageM');ToActiveLog_Update('mould_edit','ActiveLogServlet','<%=userName%>','update_messageM','<%="dye"%>')"/></td>
		</tr>
                <tr>
                    <td></td>
                    <td id="update_messageM"><h2></h2></td>
                </tr>
		</table> 
	</form>
	</div>            
                    
         <div id="tabs-4">
	<form action=""  method="post">
		<h2>Delete umbrella</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select umbrella</td>
		<td>
                    <select class="formfeild" id="Umbrella_selectionDelete">
                      <option value="compulsary" selected="selected">Please select umbrella code</option>
			<%
                        
                        ResultSet DeleteU=(ResultSet)request.getSession().getAttribute("edit2");
                        %>
                        <%
                        String x2=null;
                        while(DeleteU.next())
                        {
                          x2=DeleteU.getString("umbrella_code");
                    %>
                        <option value="<%=x2%>"><%=x2%></option>
                    <%
                            }
                    %>
			
		</select>
		</td>
                <td></td>
		</tr>
		
		<tr valign="top" style="height:3px">
		</tr>
		
		<tr>
			<td></td>
                        <td><input type="button" name="btn_deletebranch" class="button" value="Delete umbrella" onclick="callAjaxUmbrella_delete('Umbrella_selectionDelete','UmbrellaServlet','delete_message');callAjaxMouldUmb('Umbrella_selectionDelete','UmbrellaServlet','delete_message');ToActiveLog_Delete('Umbrella_selectionDelete','ActiveLogServlet','<%=userName%>','delete_message','<%="umbrella"%>')"/></td>
		</tr>
		<tr>
                    <td></td>
                    <td id="delete_message"><h2></h2></td>
                </tr>
		</table> 
	</form>
	</div>
           
        <div id="tabs-5">
	<form action=""  method="post">
		<h2>Delete mould</h2>
		<table border="0" class="mainTable" cellpadding="0" cellspacing="0">
		<tr valign="top">
		<td>Select mould</td>
		<td>
                    <select class="formfeild" id="Mould_selectionDelete">
                      <option value="compulsary" selected="selected">Please select mould code</option>
			<%
                            ResultSet DeleteM=(ResultSet)request.getSession().getAttribute("EMD");
                        %>
                        <%
                        String x3=null;
                        while(DeleteM.next())
                        {
                          x3=DeleteM.getString("mould_code");
                    %>
                        <option value="<%=x3%>"><%=x3%></option>
                    <%
                            }
                    %>
			
		</select>
		</td>
                <td></td>
		</tr>
		
		<tr valign="top" style="height:3px">
		</tr>
		
		<tr>
			<td></td>
                        <td><input type="button" name="btn_deletemould" class="button" value="Delete mould" onclick="callAjaxMould_delete('Mould_selectionDelete','MouldServlet','delete_messageM');callAjaxMouldUmb_delete('Mould_selectionDelete','MouldServlet','delete_messageM');ToActiveLog_Delete('Mould_selectionDelete','ActiveLogServlet','<%=userName%>','delete_messageM','<%="mould"%>')"/></td>
		</tr>
		<tr>
                    <td></td>
                    <td id="delete_messageM"><h2></h2></td>
                </tr>
		</table> 
	</form>
	</div>            
                    
</div>
              
          </div>
      </div>
	  
	  
      <div class="content-3">
            <div class="footer-div">
              <div class="footer-links">
                 <a href="oic_home_raj"   >Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="first_view.jsp"  >Stock & Buffer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="employee_rate" >Employee Target</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="machine_status" >Machine Status</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="oic_home_h.jsp"  >Machine Maintenance</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="Production_chart.jsp" >New Chart</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="AdminTools_home_RC.jsp" class="selected">Administrative Tools</a>
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
