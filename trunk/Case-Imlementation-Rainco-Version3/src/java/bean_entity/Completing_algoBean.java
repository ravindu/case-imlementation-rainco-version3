/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author Sajee
 */
public class Completing_algoBean {
    
    private String machine;
    private String mould;
    private double quantity;
    private double kilograms;
    private double hours;
    
    public Completing_algoBean(String Machine,String Mould,double Quantity,double Kilograms,double Hours)
    {
         this.machine=Machine;
         this.mould=Mould;
         this.quantity=Quantity;
         this.kilograms=Kilograms;
         this.hours=Hours;
    }

    public String getMachine() {
        return machine;
    }

    public void setMachine(String machine) {
        this.machine = machine;
    }

    public String getMould() {
        return mould;
    }

    public void setMould(String mould) {
        this.mould = mould;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getKilograms() {
        return kilograms;
    }

    public void setKilograms(double kilograms) {
        this.kilograms = kilograms;
    }

    public double getHours() {
        return hours;
    }

    public void setHours(double hours) {
        this.hours = hours;
    }
    
    
}
