/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */




function process_request(i){
   

   
   var param=document.getElementById("hide"+i).value;
   
  window.open('A_process_request?q='+param,'_self',false)
  

   
   
}


function new_row(t){
 

			var table = document.getElementById(t);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var colCount = table.rows[1].cells.length;

			for(var i=0; i<colCount; i++) {

				var newcell	= row.insertCell(i);

				newcell.innerHTML = table.rows[1].cells[i].innerHTML;
				//alert(newcell.childNodes);
				switch(newcell.childNodes[0].type) {
					case "text":
							newcell.childNodes[0].value = "";
							break;
					
					case "select-one":
							newcell.childNodes[0].selectedIndex = 0;
							break;
				}
			}
		}
    

function s(){
        var tabl = document.getElementById("mytable");
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
        
      
       window.open('change_mould?q='+s,'_self');
     
    }
    
    function del(){
        var table = document.getElementById("demoTable");
        var l = table.rows.length;
       
        if(l>2){
            table.deleteRow(l-1);
        }
    }
    
    
    
    function submit1(){
      
        
         var tab = document.getElementById("Table");
       
        //alert(tab.rows.length);
        
        var length=tab.rows.length;
        var i;
        var sum="";
        
        for(i=1;i<length;i++){
         
         var tr = tab.rows[i];
         
        var machine=tr.cells[0].firstChild.value;
        var mould = tr.cells[1].firstChild.value;
        var employee = tr.cells[2].firstChild.value;
         
        
            
            
        var result= machine+"-"+mould+"-"+employee+",";
        sum=sum+result;    
        }
       // alert(sum);
       
      window.open('operator_save?q='+sum,'_self');
    }
    
    
    
    
    
    function hourly_record(){
    
        var check;
        var mytable = document.getElementById("demoTable");
            
         
         var length=mytable.rows.length;
         var i=1;
         var sum="";
         
         for(i=1;i<length;i++){
         
         var tr = mytable.rows[i];
 
         var employee = tr.cells[0].firstChild.value;
         var mould = tr.cells[1].firstChild.value;
         var machine=tr.cells[2].firstChild.value;
         var dye=tr.cells[3].firstChild.value;
         var qty=tr.cells[4].firstChild.value;
         var emp=tr.cells[5].firstChild.value;
          
          if((dye==0)||(qty=="")){
              check=true;
              
          }
         
          
             var result= employee+"-"+mould+"-"+machine+"-"+dye+"-"+qty+"-"+emp+",";
             sum=sum+result;    
             
         
         }    
        
        if(check){
            document.getElementById("error").innerHTML="You should fill all the values"
        }
        
        else{
           window.open('hourly_save1?q='+sum,'_self');
        }
         
    //   
   
    
    }
    
    
    
   
  
   
   
   
   function update(){
        var mytable = document.getElementById("demoTable");
            
         
          var length=mytable.rows.length;
          var i=1;
          var sum="";
         
         for(i=1;i<length;i++){
         
         var tr = mytable.rows[i];
 
         var machine = tr.cells[0].firstChild.value;
         var mould = tr.cells[1].firstChild.value;
         var employee=tr.cells[2].firstChild.value;
        
      
 
            
        var result= machine+"-"+mould+"-"+employee+",";
        sum=sum+result;    
         }    
        
      
       
        
  window.open('update_assignment?q='+sum,'_self'); 
       
   }
   
   
   function update_data(a){
                
             
                
                 var machine=document.getElementById("machine"+a).value;
                 var mould=document.getElementById("mould"+a).value;
              
                 var emp = document.getElementById("emp"+a).value;
                 
                 
                 if(emp==0){
                     
                     document.getElementById("error").innerHTML="You should assign an employee for the machine!";
                    
                 }
              
               
               
               else{
               
                
                 var sum=(machine+"-"+mould+"-"+emp);
                 
               //  alert(sum);
                 window.open('operator_save?q='+sum,'_self');
                 
               } 
//                document.getElementById("machine"+a).style.backgroundColor = "orange";
//                document.getElementById("mould"+a).style.backgroundColor = "orange";
//                document.getElementById("empl"+a).style.backgroundColor = "orange";
//                 
//            document.getElementById("but"+a).disabled = 'true';
//                
               
               
        
            }