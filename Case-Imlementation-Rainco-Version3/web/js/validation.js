/*Administrative validations*/
function dissableCheckbox()
{
    $("#ring").attr('disabled',true);
    $("#clip").attr('disabled',true);
    $("#handle").attr('disabled',true);
    $("#whistel").attr('disabled',true);
    $("#otherR").attr('disabled',true);
}   

function enableCheckbox()
{
    $("#ring").attr('disabled',false);
    $("#clip").attr('disabled',false);
    $("#handle").attr('disabled',false);
    $("#whistel").attr('disabled',false);
    $("#otherR").attr('disabled',false);
}

function dissableSelect()
{
    $("#whistel_selection").attr('disabled',true);
    $("#handle_selection").attr('disabled',true);
    $("#ring_selection").attr('disabled',true);
    $("#clip_selection").attr('disabled',true);
    $("#other_selection").attr('disabled',true);
}

function enableSelect()
{
    $("#whistel_selection").attr('disabled',false);
    $("#handle_selection").attr('disabled',false);
    $("#ring_selection").attr('disabled',false);
    $("#clip_selection").attr('disabled',false);
    $("#other_selection").attr('disabled',false);
}

function ClearAddNewFieldsbranch(para1,para2,para3,para4)
{
    var val=document.getElementById(para1).value.toString();
    var nextval=parseInt(val)+1;
    document.getElementById(para1).value="";
    document.getElementById(para1).value=nextval;
    document.getElementById(para2).value="";
    document.getElementById(para3).innerHTML="";
    document.getElementById(para4).innerHTML="";
    $("#btn_clear_branch").attr("disabled",true);
}

function ClearAddNew(para1,para2,para3,para4,para5)
{
    document.getElementById(para1).value="";
    document.getElementById(para2).value="";
    document.getElementById(para3).innerHTML="";
    document.getElementById(para4).innerHTML="";
    document.getElementById(para5).innerHTML="";
    
    
}

function ClearAddNewSp(para1,para2,para3,para4)
{
    var code=document.getElementById(para1).value;
    var arrayz=code.split("_");
    var number=parseInt(arrayz[1].toString())+1;
    var nextID=arrayz[0].toString()+"_"+number;
    document.getElementById(para1).value=nextID;
    
    document.getElementById(para2).value="";
    document.getElementById(para3).innerHTML="";
     document.getElementById(para4).innerHTML="";
    
}

function ClearAddNewMachine(para1,para2,para3,para4,para5,para6,para7,para8)
{
   var code=document.getElementById(para1).value;
   var arrayz=code.split("_");
   var number=parseInt(arrayz[1].toString())+1;
   var nextID=arrayz[0].toString()+"_"+number;
   document.getElementById(para1).value=nextID;
   
    document.getElementById(para2).value="";
    document.getElementById(para3).value="";
    document.getElementById(para4).value="";
    document.getElementById(para5).innerHTML="";
    document.getElementById(para6).value="";
    document.getElementById(para7).value="";
    document.getElementById(para8).innerHTML="";
    $("#btn_clear_MachineAdd").attr("disabled",true);
    
}

function ClearUpdate_Edit(para1,para2,para3,para4)
{
    document.getElementById(para1).value="";
    document.getElementById(para2).value="";
    document.getElementById(para3).innerHTML="";
    document.getElementById(para4).selectedIndex=0;
}

function ClearUpdate_EditMachine(para1,para2,para3,para4,para5)
{
    document.getElementById(para1).value="";
    document.getElementById(para2).value="";
    document.getElementById(para3).value="";
    document.getElementById(para5).innerHTML="";
    document.getElementById(para4).selectedIndex=0;
}

function ClearDelete(para1,para2)
{
    document.getElementById(para1).innerHTML="";
    document.getElementById(para2).selectedIndex=0;
}

function validationBeforeSave(para1)
{
    var valueInner=document.getElementById(para1).value;
    if(valueInner==="Enter Umbrella code")
    {
        dissableCheckbox();
        $("#btn_save").attr("disabled",true);
    }
    if(para1==="error")
    {
        dissableCheckbox();
        $("#btn_save").attr("disabled",true);
    }
    if(para1==="ok")
    {
        enableCheckbox();
        $("#btn_save").attr("disabled",false);
    }
    
}

//dyecode
function checkDyeCodeError(para1,resultId)
{
    var code=document.getElementById(para1).value.toString();
    if(isNaN(code)===true || code.length!==4)
    {
        document.getElementById(resultId).innerHTML="Enter 4 digit number";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_dye2").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_dye2").attr("disabled",false);
    }
}

function checkDyeNameError(para1,resultId)
{
    var code=document.getElementById(para1).value.toString();
    if(isNaN(code)===false)
    {
        document.getElementById(resultId).innerHTML="Enter dye name";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_dye2").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_dye2").attr("disabled",false);
    }
}
//branch
function checkbranchName(para1,para2,resultId)
{
    document.getElementById(para2).disabled=false;
    var code=document.getElementById(para1).value;
    if(isNaN(code)===false || code===null || code==="")
    {
        document.getElementById(resultId).innerHTML="Enter branch name";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_branch12").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_branch12").attr("disabled",false);
    }
}

//raw material
function changeToUpper(para1,resultId)
{
    var code=document.getElementById(para1).value;
    if(isNaN(code)===false || code===null || code==="")
    {
        document.getElementById(resultId).innerHTML="Enter 4 letter code";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_material12").attr("disabled",true);
        
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_material12").attr("disabled",false);
        
    }
}

function checkRawName(para1,resultId)
{
    var code=document.getElementById(para1).value;
    if(isNaN(code)===false || code===null || code==="")
    {
        document.getElementById(resultId).innerHTML="Enter proper name";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_material12").attr("disabled",true);
        
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_material12").attr("disabled",false);
        
    }
}
//sparepart
function checkSpartPart(para1,resultId)
{
    var code=document.getElementById(para1).value;
    if(isNaN(code)===false)
    {
        document.getElementById(resultId).innerHTML="Enter proper name";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnewSpare12").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnewSpare12").attr("disabled",false);
    }
}
//machine
function CheckMachineValue_Int(para1,resultId)
{
    var code=document.getElementById(para1).value.toString();
    if(isNaN(code)===true ||code===null || code==="")
    {
        document.getElementById(resultId).innerHTML="This should be a number";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_machinne123").attr("disabled",true);
        $("#btn_clear_MachineAdd").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_machinne123").attr("disabled",false);
        $("#btn_clear_MachineAdd").attr("disabled",false);
    }
}
//umbrella settings
function MouldQtyCheck(para1,para2)
{
    var code=document.getElementById(para1).value;
    if(isNaN(code)===true)
    {
        document.getElementById(para1).style.backgroundColor='red';
        document.getElementById(para2).disabled=true;
    }
    else
    {
        document.getElementById(para1).style.backgroundColor='white';
        document.getElementById(para2).disabled=false;
    }
}

function checkMouldCreation(para1,resultId)
{
    var code=document.getElementById(para1).value.toString();
    if(isNaN(code)===true)
    {
        document.getElementById(resultId).innerHTML="Need a numeric value";
        document.getElementById(resultId).style.color="red";
        $("#btn_addnew_mould667").attr("disabled",true);
        $("#btn_save").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_addnew_mould667").attr("disabled",false);
        $("#btn_save").attr("disabled",false);
    }
}
//dye
function EnableFindDyeButton(para1,para2)
{
    document.getElementById(para1).disabled=false;
    document.getElementById(para2).disabled=false;
}

//validate employee registration-Name
function checkEmpDetailsName(para1,resultId)
{
   var variable=document.getElementById(para1).value;
   if(isNaN(variable)===false || variable===null || variable==="")
    {
        document.getElementById(resultId).innerHTML="Enter full name";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
    
}

//validate employee registration-Address
function checkEmpDetailsAddress(para1,resultId)
{
   var variableAdd1=document.getElementById(para1).value;
   if(variableAdd1===""||variableAdd1===null || isNaN(variableAdd1)===false)
    {
        document.getElementById(resultId).innerHTML="Enter Address";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
   else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
    
}

//validate employee registration-City
function checkEmpDetailsCity(para1,resultId)
{
   var variableAdd2=document.getElementById(para1).value;
   if(variableAdd2===""||variableAdd2===null|| isNaN(variableAdd2)===false)
    {
        document.getElementById(resultId).innerHTML="Enter City";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
    
}

//validate employee registration-NIC
function checkEmpDetailsNIC(para1,resultId)
{
   var variableNIC=document.getElementById(para1).value;
   var arrayLastValue=variableNIC[9];
   if(arrayLastValue!=="V" || (isNaN(variableNIC[0])===true ||isNaN(variableNIC[1])===true||isNaN(variableNIC[2])===true ||isNaN(variableNIC[3])===true||isNaN(variableNIC[4])===true ||isNaN(variableNIC[5])===true||isNaN(variableNIC[6])===true ||isNaN(variableNIC[7])===true||isNaN(variableNIC[8])===true))
    {
        document.getElementById(resultId).innerHTML="Enter NIC correctly";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
    
}

//validate employee registration-Phone
function checkEmpDetailsPhone(para1,resultId)
{
   var variablePhone=document.getElementById(para1).value;
   if(isNaN(variablePhone)===true)
    {
        document.getElementById(resultId).innerHTML="Enter Phone correctly";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
    
}

//validate employee registration-Email
function checkEmpDetailsEmail(para1,resultId)
{
   var variableemail=document.getElementById(para1).value;
   
   if(variableemail===null || variableemail===""|| isNaN(variableemail)===false)
    {
        document.getElementById(resultId).innerHTML="Enter email correctly";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
    
}

//validate employee registration-Date
function checkEmpDetailsDate(para1,resultId)
{
   var variableDate=document.getElementById(para1).value;
   if(variableDate===""||variableDate===null)
    {
        document.getElementById(resultId).innerHTML="Pickup join date";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
}   

//validate employee registration-user
function checkEmpDetailsUser(para1,resultId)
{
   var variableUser=document.getElementById(para1).value;
   if(variableUser===""||variableUser===null || isNaN(variableUser)===false)
    {
        document.getElementById(resultId).innerHTML="Enter UserName";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
} 

//validate employee registration-password
function checkEmpDetailsPass(para1,resultId)
{
   alert(document.getElementById("user").innerHTML)
    var variablePass=document.getElementById(para1).value;
   if(variablePass===""||variablePass===null)
    {
        document.getElementById(resultId).innerHTML="Password Required";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
} 

//validate employee registration-Confirmpassword
function checkEmpDetailsConfirmPass(para1,para2,resultId)
{
   var variablePass=document.getElementById(para1).value;
   var variableConPass=document.getElementById(para2).value;
   if(variableConPass===""||variableConPass===null || variableConPass!==variablePass)
    {
        document.getElementById(resultId).innerHTML="Password not match";
        document.getElementById(resultId).style.color="red";
        $("#btn_saveEmp").attr("disabled",true);
    }
    else
    {
        document.getElementById(resultId).innerHTML="";
        $("#btn_saveEmp").attr("disabled",false);
    }
}

function dissableOtherStuff()
{
    var messageValue=document.getElementById("user").innerHTML.toString();
    if(messageValue==="error")
    {
        $("#btn_saveEmp").attr("disabled",true);
        
    }
    if(messageValue==="ok")
    {
        $("#btn_saveEmp").attr("disabled",false);
        
    }
}

function enableEmpdetele()
{
    $("#btn_searchEmp").attr("disabled",true);
    $("#btn_deleteEmp").attr("disabled",true);
}