/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author HP
 */
public class employee_evaluation_helper {
    
    private int rate;
    private String name;
    private String employee_id;

    public employee_evaluation_helper(int rate, String name,String employee_id) {
        this.rate = rate;
        this.name = name;
         this.employee_id = employee_id;
        
        
    }

    public int getRate() {
        return rate;
    }

    public String getName() {
        return name;
    }

    public String getEmployee_id() {
        return employee_id;
    }
    
    
    
}
