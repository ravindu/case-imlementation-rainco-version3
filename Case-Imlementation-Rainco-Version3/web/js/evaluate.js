/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var xmlhttp;
function a(str){
  

  xmlhttp=GetXmlHttpObject();
  
  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }
    var combine=str;

    var url="employee_evaluation";
    url=url+"?q="+combine;
   
    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("result").innerHTML=xmlhttp.responseText;
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

