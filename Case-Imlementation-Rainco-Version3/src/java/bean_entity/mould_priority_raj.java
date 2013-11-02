/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author Rajitha
 */
public class mould_priority_raj {
    private String mould;
    private double priority;

    public mould_priority_raj(String mould, double priority) {
        this.mould = mould;
        this.priority = priority;
    }

    public String getMould() {
        return mould;
    }

    public void setMould(String mould) {
        this.mould = mould;
    }

    public double getPriority() {
        return priority;
    }

    public void setPriority(double priority) {
        this.priority = priority;
    }
    
    
}
