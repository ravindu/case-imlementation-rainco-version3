/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function send(str){
    
    if(str==0){
        
        document.getElementById("result").innerHTML="You should select a mould";
    }
   else{ 
    window.open('employee_evaluation?q='+str);
   }
     
}