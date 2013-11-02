/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var xmlhttp
function measure(){
    
   alert();
        var tabl = document.getElementById("measure");
        //alert( tabl.rows.length);
        var l = tabl.rows.length;
        var i = 1;
        var s = "";
        
        for (i = 1; i < l; i++ )
        {
        var tr = tabl.rows[i];
        
        var cel0 = tr.cells[0].firstChild.value;
        var cel1 = tr.cells[1].firstChild.value;
        var cel2 = tr.cells[2].firstChild.value;
        var cel3 = tr.cells[3].firstChild.value;
        var cel4 = tr.cells[4].firstChild.value;
        var r = cel0+"-"+cel1+"-"+cel2+"-"+cel3+"-"+cel4+",";
        s=s+r;
    
        }
        
        
        alert(s);
    
    
    
    
  xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="hourly_production";
    url=url+"?q="+s;
   
    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("txt").innerHTML=xmlhttp.responseText;
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