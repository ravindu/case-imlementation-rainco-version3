var xmlhttp

function sub_chart(str)
{

 xmlhttp=GetXmlHttpObject();
 if(str==""){
     
  //  alert("aaa");
     
 }


  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="NewServlet";
    url=url+"?q="+str;

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


//
//function a(){
//    //window.open('NewServlet?q='+param,'_self',false);
//alert();
//
//}