var xmlhttp
function showBoxes(frm){
 
  
    
    var message = ""

   //For each checkbox see if it has been checked, record the value.
   for (i = 0; i < frm.checkbox.length; i++)
      if (frm.checkbox[i].checked){
        var message = message + frm.checkbox[i].value + "\n"
      }

   
   //alert(message);
   
   
   xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
  
   return;
  }

    var url="target_assignment2";
   
   
    url=url+"?q="+message;
   
    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("Get",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
     document.getElementById("txt").innerHTML=xmlhttp.responseText;
  
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


