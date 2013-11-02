var xmlhttp

function test(str)
{

 xmlhttp=GetXmlHttpObject();
 


  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="test";
    url=url+"?q="+str;

    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  //document.getElementById("result").innerHTML=xmlhttp.responseText;
    //alert(xmlhttp.responseText);
    
    if((xmlhttp.responseText)=="me"){
        
        document.getElementById("txt").innerHTML="success";
        
        document.getElementById("txt").style.color = "red";
    }
  else{
      
       document.getElementById("txt").innerHTML="false";
        
        document.getElementById("txt").style.color = "green";
  }
  
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



