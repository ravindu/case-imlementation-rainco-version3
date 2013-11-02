/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlhttp
function view_performance(){
    
 alert(document.getElementById("YetAnotherDate").value+""+document.getElementById("ADate").value);
 xmlhttp=GetXmlHttpObject();
 if(str==""){
     
   
     
 }


  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

   // var url="NewServlet";
  //  url=url+"?q="+str;

    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("result").innerHTML=xmlhttp.responseText;
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


