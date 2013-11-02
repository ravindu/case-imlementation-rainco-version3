/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author HP
 */
public class operator_assignment {
    
    private String mould_code;
    private String machine_code;
    private String employee_id;
    private String id;
    
    

    public operator_assignment(String machine_code, String mould_code,String id) {
        this.mould_code = mould_code;
        this.machine_code = machine_code;
    }

     public operator_assignment(String machine_code,String mould_code, String employee_id,String id) {
        this.mould_code = mould_code;
        this.machine_code = machine_code;
        this.employee_id = employee_id;
        this.id = id;
       
        
    }

    public operator_assignment(String machine_code,String mould_code ) {
        this.mould_code = mould_code;
        this.machine_code = machine_code;
    }
    
    public String getMould_code() {
        return mould_code;
    }

    public String getId() {
        return id;
    }

    public String getMachine_code() {
        return machine_code;
    }

   

    public String getEmployee_id() {
        return employee_id;
    }
    
    
    
    
    
}
