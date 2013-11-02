/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author HP
 */
public class performance_helper {
    
    private String employee;
    private float hours;
    private float should;
    private float produced;
    private float addiotional;

    public performance_helper(String employee, float hours, float should, float produced, float addiotional) {
        this.employee = employee;
        this.hours = hours;
        this.should = should;
        this.produced = produced;
        this.addiotional = addiotional;
    }

    public String getEmployee() {
        return employee;
    }

    public float getHours() {
        return hours;
    }

    public float getShould() {
        return should;
    }

    public float getProduced() {
        return produced;
    }

    public float getAddiotional() {
        return addiotional;
    }
    
    
    
    
    
    
}
