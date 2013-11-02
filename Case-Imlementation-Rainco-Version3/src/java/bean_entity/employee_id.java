/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author HP
 */
public class employee_id {

    public String getType() {
        return type;
    }
    
    private String employee;

    public employee_id(String employee, String type) {
        this.employee = employee;
        this.type = type;
    }
    private String type;

    public employee_id(String employee) {
        this.employee = employee;
    }

    public String getEmployee() {
        return employee;
    }
    
    
    
    
    
}
