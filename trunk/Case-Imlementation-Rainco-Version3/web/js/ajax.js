var imported = document.createElement('script');
imported.src = 'js/validation.js';
document.head.appendChild(imported);


//add data to database
function callAjaxAddnew(para1,para2,servletcode,resultid)
{
    var code = document.getElementById(para1).value;
    var name = document.getElementById(para2).value;
    var v="false";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&name="+name+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
           document.getElementById(resultid).innerHTML = xmlhttp.responseText;
           $("#btn_clear_branch").attr("disabled",false);
           $("#btn_clear_SpAdd").attr("disabled",false);
         }
    }
}

function callAjaxAddnewDye(para1,para2,servletcode,resultid)
{
    var code = document.getElementById(para1).value;
    if(isNaN(code)===true)
    {
        document.getElementById("checkDye").style.color="red";
        document.getElementById("checkDye").innerHTML="Enter 4 digit number"
        return;
    }
    else{
    
    var name = document.getElementById(para2).value;
    var v="false";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&name="+name+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
           document.getElementById(resultid).innerHTML = xmlhttp.responseText;
           $("#btn_clear_branch").attr("disabled",false);
         }
    }}
}

//update database
function callAjaxupdate(para1,para2,servletcode,resultid)
{
    var code = document.getElementById(para1).value;
    var name = document.getElementById(para2).value;
    var v="update";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&name="+name+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green"; 
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}



//update machine
function callAjaxUpdateMachine(para1,para2,para3,para4,servletcode,resultid)
{
    var val = document.getElementById(para1);
    var code=val.options[val.selectedIndex].value;
    var htime = document.getElementById(para2).value;
    if(isNaN(htime)===true)
    {
       document.getElementById("checkEHtime").style.color="red";
       document.getElementById("checkEHtime").innerHTML="Enter value in minutes"
       return; 
    }
    var rtime = document.getElementById(para3).value;
    if(isNaN(rtime)===true)
    {
       document.getElementById("checkERtime").style.color="red";
       document.getElementById("checkERtime").innerHTML="Enter value in seconds"
       return; 
    }
    var elec = document.getElementById(para4).value;
    if(isNaN(elec)===true)
    {
       document.getElementById("checkEEtime").style.color="red";
       document.getElementById("checkEEtime").innerHTML="Enter value in Killovot"
       return; 
    }
    var v="update";
   
                
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?id="+code+"&htime="+htime+"&rtime="+rtime+"&elec="+elec+"&status="+v, true);
    //
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}

//add data to database
function callAjaxMachine(para1,para2,para3,para4,servletcode,resultid)
{
   
    var code=$("#txt_machine_id1").val();

    var htime = document.getElementById(para2).value;
    if(isNaN(htime)===true)
    {
       document.getElementById("checkHtime").style.color="red";
       document.getElementById("checkHtime").innerHTML="Enter value in minutes"
       return; 
    }
    var rtime = document.getElementById(para3).value;
    if(isNaN(rtime)===true)
    {
       document.getElementById("checkRtime").style.color="red";
       document.getElementById("checkRtime").innerHTML="Enter value in seconds"
       return; 
    }
    var elec = document.getElementById(para4).value;
    if(isNaN(elec)===true)
    {
       document.getElementById("checkEtime").style.color="red";
       document.getElementById("checkEtime").innerHTML="Enter value in Killovot"
       return; 
    }
    var v="addMachine";
                
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?id="+code+"&htime="+htime+"&rtime="+rtime+"&elec="+elec+"&status="+v, true);
  
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById('checkEtime').innerHTML="";
           document.getElementById('checkRtime').innerHTML="";
           document.getElementById('checkHtime').innerHTML="";
           
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
            $("#btn_clear_MachineAdd").attr("disabled",false);
         }
    }
}


//serach from database
function callAjaxDyeSelect(para1,servletcode,txtid,txtname)
{
       
        var val = document.getElementById(para1);
        var id = val.options[val.selectedIndex].value;
        var v="true";
    
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?id="+id+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            var xx = xmlhttp.responseText;
            
            document.getElementById(txtid).value=id;
            document.getElementById(txtname).value=xx;
         }
    }
    
}

//search machine from database
function callAjaxMachineSelect(para1,servletcode,txthtime,txtrtime,txtelec)
{
    
        var val = document.getElementById(para1);
        var id = val.options[val.selectedIndex].value;
        var v="SelectMachine";
    
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?id="+id+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            var xx = xmlhttp.responseText;
           var results=xx.split(":");
           
            document.getElementById('txt_Emachine_htime').value=results[0];
            document.getElementById('txt_Emachine_rtime').value=results[1];
            document.getElementById('txt_Epower_con').value=results[2];
         }
    }
    
}

//delete from database
function callAjaxDeleteSelect(para1,servletcode,resultid)
{
    var result=confirm("Are you want delete this item");
    if(result===true)
    {
       var val = document.getElementById(para1);
       var code = val.options[val.selectedIndex].value;
       var v="delete";
    
       var xmlhttp = new XMLHttpRequest();
       xmlhttp.open("post", servletcode+"?code="+code+"&status="+v, true);
       xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML ="Delete successfull" ;
            
         }
         else
         {
             document.getElementById(resultid).innerHTML ="";
         }
    } 
        
    }
    if(result===false)
    {
        alert("press cancel");
        document.getElementById(resultid).innerHTML = "User canceled delete";
    }
    
    
    
    
}

function callAjaxAddMould(para1,para2,para3,para4,para5,servletcode,resultid)
{
    var code = document.getElementById(para1).value;
    var name = document.getElementById(para2).value;
    var runner = document.getElementById(para3).value;
    var capa = document.getElementById(para4).value;
    var items = document.getElementById(para5).value;
    var v="addmould";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code1="+code+"&name1="+name+"&runner1="+runner+"&capa1="+capa+"&items1="+items+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
    
}
function callAjaxmould_for_umbrella(para1,para2,para3,servletcode,resultid)
{
    var Umbcode = document.getElementById(para1).value;
    var mouldCode = document.getElementById(para2).value;
    var qty=document.getElementById(para3).value;
    var v="MouldUmbrella";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?Umbcode="+Umbcode+"&mouCode="+mouldCode+"&quantity="+qty+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).innerHTML = xmlhttp.responseText;
           //document.getElementById(para1).value=null;
           //document.getElementById(para2).value=null;
           //document.getElementById(para3).value=null;
         }
    }
    
}

function callAjaxAddUmbrella(para1,para2,servletcode,resultid)
{
    var Umbcode = document.getElementById(para1).value;
    var val = document.getElementById(para2);
    var color = val.options[val.selectedIndex].value;
    //alert(color);
    var v="addUmbrella";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?Umbcode="+Umbcode+"&colour="+color+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
    
}

function callAjaxUmbrella_update(para1,para2,servletcode,resultid)
{
    var code = document.getElementById(para1).value;
    var val = document.getElementById(para2);
    var colour = val.options[val.selectedIndex].value;
    alert(colour);
    var v="update";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&colour="+colour+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}

function callAjaxUmbrellaSelect(para1,servletcode,para2)
{
    
        var val = document.getElementById(para1);
        var code = val.options[val.selectedIndex].value;
        var v="select";
    
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            var xx = xmlhttp.responseText;
            document.getElementById(para2).value=code;
           if(xx==="black")
            {
               $("#Editcolour_selection").val("black"); 
               $("#Editcolour_selection option:selected").attr("selected", "selected");
            }
            else if(xx==="colour")
            {
               $("#Editcolour_selection").val("colour");
               $("#Editcolour_selection option:selected").attr("selected", "selected");
            }
            else if(xx==="spray")
            {
               $("#Editcolour_selection").val("spray"); 
               $("#Editcolour_selection option:selected").attr("selected", "selected");
            }
         }
    }
    
}

function callAjaxUmbrella_delete(para1,servletcode,resultid)
{
    var val = document.getElementById(para1);
    var code = val.options[val.selectedIndex].value;
    var v="delete";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}

function callAjaxUpdateMould(para1,para2,para3,para4,para5,servletcode,resultid)
{
    var code = document.getElementById(para1).value;
    var name = document.getElementById(para2).value;
    var runner = document.getElementById(para3).value;
    var capa = document.getElementById(para4).value;
    var items = document.getElementById(para5).value;
    var v="updateMould";
   
                
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&name="+name+"&runner="+runner+"&capa="+capa+"&items="+items+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}

function callAjaxMouldSelect(para1,servletcode)
{
    
        var val = document.getElementById(para1);
        var id = val.options[val.selectedIndex].value;
        var v="selectMould";
    
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?Mid="+id+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            var xx = xmlhttp.responseText;
            var array1=xx.split(":");
            document.getElementById('txt_mouldIdEditId').value=id;
            document.getElementById('txt_mouldIdEditName').value=array1[0];
            document.getElementById('txt_mouldRunnerEdit').value=array1[1];
            document.getElementById('txt_mouldCapaEdit').value=array1[2];
            document.getElementById('txt_mouldItemEdit').value=array1[3];
            
         }
    }
    
}

function callAjaxMould_delete(para1,servletcode,resultid)
{
    var val = document.getElementById(para1);
    var code = val.options[val.selectedIndex].value;
    var v="MouldDelete";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}

function callAjaxMouldUmb_delete(para1,servletcode,resultid)
{
    var val = document.getElementById(para1);
    var code = val.options[val.selectedIndex].value;
    var v="UMBMouldDelete";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}



function checkUmbValidation(para1,servletcode)
{
    var Umbcode = document.getElementById(para1).value;
    if(Umbcode===null || Umbcode==="")
    {
        document.getElementById("txt_okk").value="Enter Umbrella code";
        document.getElementById("txt_okk").style.color="Blue";
        return;
    }
    var v="checkUmbCode";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?Umbcode="+Umbcode+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
                   var val=xmlhttp.responseText.toString();
                   document.getElementById("txt_okk").value=val;
                   document.getElementById("txt_okk").style.color="Blue";
                   validationBeforeSave(val);
               
                }
           
    }
    
}
//add mounld umbrella togather
function checkUmbMouldAdd(para1,para2,para3,servletcode)
{
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?Ucode="+para1+"&Mcode="+para2+"&qty="+para3, true);
    
    xmlhttp.send();
    //alert("send data");            
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           //alert("checkking pass");
           var xx = xmlhttp.responseText;
           //alert(xx);
           
         }
    }
   
}

//active log add data
function ToActiveLog_Add(para1,servletcode,para2,resultid,para3)
{
    var code=document.getElementById(para1).value;
    var user=para2;
    var type=para3;
    var description="Added new "+code;
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    
    var hour = today.getHours();
    var min = today.getMinutes();
    
    var Ntime=hour+"."+min;
    var Tdate=dd+"-"+mm+"-"+yyyy;
    var v="add_activelog";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?date="+Tdate+"&time="+Ntime+"&des="+description+"&user="+user+"&type="+type+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
    
}

//updaate active log
function ToActiveLog_Update(para1,servletcode,para2,resultid,para3)
{
    var code=document.getElementById(para1);
    var val = code.options[code.selectedIndex].value;
    var user=para2;
    var type=para3;
    var description="Updated current "+val+" details";
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    
    var hour = today.getHours();
    var min = today.getMinutes();
    
    var Ntime=hour+"."+min;
    var Tdate=dd+"-"+mm+"-"+yyyy;
    var v="update_activelog";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?date="+Tdate+"&time="+Ntime+"&des="+description+"&user="+user+"&type="+type+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
    
}

//delete active log
function ToActiveLog_Delete(para1,servletcode,para2,resultid,para3)
{
    var code=document.getElementById(para1);
    var val = code.options[code.selectedIndex].value;
    var user=para2;
    var type=para3;
    var description="deleted "+val;
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    
    var hour = today.getHours();
    var min = today.getMinutes();
    
    var Ntime=hour+"."+min;
    var Tdate=dd+"-"+mm+"-"+yyyy;
    var v="delete_activelog";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?date="+Tdate+"&time="+Ntime+"&des="+description+"&user="+user+"&type="+type+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
           document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
    
}

function callNewUser(para1,servletcode,resultid)
{
    var val = document.getElementById(para1);
    var code = val.options[val.selectedIndex].value;
    var v="addUser";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?code="+code+"&status="+v, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}
//Save employee details
function save_EmpDetails(para0,para1,para2,para3,para4,para5,para6,para7,para8,para9,para10,servletcode,resultid)
{
    var id=document.getElementById(para0).value;
    alert(id);
    var name=document.getElementById(para1).value;
    alert(name);
    var address1=document.getElementById(para2).value;
    var address2=document.getElementById(para3).value;
    var fullAddress=address1+","+address2;
    alert(fullAddress);
    var nic=document.getElementById(para4).value;
    alert(nic);
    var phoneNo=document.getElementById(para5).value;
    alert(phoneNo);
    var email=document.getElementById(para6).value;
    alert(email);
    var joinDate=document.getElementById(para7).value;
    alert(joinDate);
    var cmb_box=document.getElementById(para8);
    var designation=cmb_box.options[cmb_box.selectedIndex].value;
    alert(designation);
    var userName=document.getElementById(para9).value;
    alert(userName);
    var password=document.getElementById(para10).value;
    alert(password);
    
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?id="+id+"&name="+name+"&fullAddress="+fullAddress+"&nic="+nic+"&phone="+phoneNo+"&email="+email+"&jDate="+joinDate+"&desig="+designation, true);
    xmlhttp.send();
    alert("send");
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
}
//Check username is valid or not
function checkUsernameValidation(para1,servletcode)
{
    var User = document.getElementById(para1).value;
    var result="";
    if(User===null || User==="")
    {
        document.getElementById("user").style.color="red";
        document.getElementById("user").innerHTML ="Enter a username";
        return;
    }
    var status="checkUserName";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?User="+User+"&status="+status, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
                 result=xmlhttp.responseText.toString();
                 document.getElementById("user").style.color="blue";
                 document.getElementById("user").innerHTML = result;
         }
           
    }
    
}

//Select employee details from database
function SearchEmpDetails(para1,servletcode)
{
        alert("ok");
        var cmb_box = document.getElementById(para1);
        var nic = cmb_box.options[cmb_box.selectedIndex].value;
        alert(nic);
        var status="SearchEMP";
    
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?nic="+nic+"&status="+status, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            var xx = xmlhttp.responseText;
           var results=xx.split(":");
           alert(results[0].toString());
           alert(results[2].toString());
            //document.getElementById('txt_EmpID').value=results[0];
           // document.getElementById('txt_EmpName').value=results[1];
            //.getElementById('txt_joinDate').value=results[2];
            //.getElementById('txt_EmpaccType').value=results[3];
         }
    }
    
}

//delete employee from database
function DeleteEmpDetails(para1,servletcode,resultid)
{
    var emp_id = document.getElementById(para1).value;
    var status="delete";
    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("post", servletcode+"?id="+emp_id+"&status="+status, true);
    xmlhttp.send();
                
    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.status === 200 && xmlhttp.readyState===4)
         {
            document.getElementById(resultid).style.color="green";
            document.getElementById(resultid).innerHTML = xmlhttp.responseText;
         }
    }
    
}


