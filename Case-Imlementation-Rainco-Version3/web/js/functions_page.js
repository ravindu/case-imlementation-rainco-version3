/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function send_page(param){
    
   // window.open('NewServlet?q='+param,'_self',false)
    window.open('mould_quantity?q='+param,resizable=1,width=20, height=20);
}



function send_DM(parameter){
    
   // window.open('NewServlet?q='+param,'_self',false)
    window.open('NewServlet?q='+parameter,resizable=1,width=20, height=20);
}


function a(_row){
   


var table=document.getElementById("me");

  for(var i=0;i<cols.length;i++)  {
    var _temp=document.getElementById("s"+_row+cols[i]).innerHTML;
    document.getElementById("f"+cols[i]).value=_temp;
  }
}







function continue_page(id,deci){
    
 
  
  var param=id+","+deci;  
window.open('A_email_structure?q='+param,'_self',false)
  
//  
//   xmlhttp=GetXmlHttpObject();
//
// if (xmlhttp==null)
//  {
//  alert ("Your browser does not support Ajax HTTP");
//   return;
//  }
//
//    var url="A_email_structure";
//    url=url+"?q="+param;
//
//   
//   xmlhttp.onreadystatechange=getOutput;
//    xmlhttp.open("GET",url,true);
//    xmlhttp.send(null);
//}
//
//function getOutput()
//{
//  if (xmlhttp.readyState==4)
//  {
// document.getElementById("display_email").innerHTML=xmlhttp.responseText;
//  }
//}
//
//function GetXmlHttpObject()
//{
//    if (window.XMLHttpRequest)
//    {
//       return new XMLHttpRequest();
//    }
//    if (window.ActiveXObject)
//    {
//      return new ActiveXObject("Microsoft.XMLHTTP");
//    }
// return null;
  
    
}




function process_request(i){
    
 
  
  var param=document.getElementById("hide"+i).value;
 // window.open('A_email_structure?q='+param,'_self',false)
  
  
   xmlhttp=GetXmlHttpObject();

 if (xmlhttp==null)
  {
  alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="A_process_request";
    url=url+"?q="+param;

   
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