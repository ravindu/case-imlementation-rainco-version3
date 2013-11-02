/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 var xmlhttp

function request(){ 
 
var umbrella=document.getElementById("umbrella").value;
var branch=document.getElementById("branch").value;
var qty=document.getElementById("qty").value;


 xmlhttp=GetXmlHttpObject();
 

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var str=umbrella+","+branch+","+qty;
    var url="A_new_insert_request";
    url=url+"?q="+str;

    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("request_table").innerHTML=xmlhttp.responseText;
 
  
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

