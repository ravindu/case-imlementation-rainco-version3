function additional_request(){
  
    var msg=document.getElementById("tinyeditor").value;
    var email=document.getElementById("receiver").value;
    var subject=document.getElementById("umbrella").value;
    

    
   xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }


   var str=msg+","+email+","+subject;
   var url="A_send_mail";
   url=url+"?q="+str;
 
    
   
    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("display_email").innerHTML=xmlhttp.responseText;
  //document.getElementById("continue").disabled=true;
 
 
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