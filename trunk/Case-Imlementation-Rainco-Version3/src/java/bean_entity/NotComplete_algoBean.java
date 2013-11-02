/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author Ravindu
 */
public class NotComplete_algoBean {
    
    private String machineCode;
    private String mouldCode;
    private int quantity;
    private double total_kgs;
    private double total_hrs;

    public NotComplete_algoBean(String machineCode, String mouldCode, int quantity, double total_kgs, double total_hrs) {
        this.machineCode = machineCode;
        this.mouldCode = mouldCode;
        this.quantity = quantity;
        this.total_kgs = total_kgs;
        this.total_hrs = total_hrs;
    }
    
    

    public String getMachineCode() {
        return machineCode;
    }

    public void setMachineCode(String machineCode) {
        this.machineCode = machineCode;
    }

    public String getMouldCode() {
        return mouldCode;
    }

    public void setMouldCode(String mouldCode) {
        this.mouldCode = mouldCode;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal_kgs() {
        return total_kgs;
    }

    public void setTotal_kgs(double total_kgs) {
        this.total_kgs = total_kgs;
    }

    public double getTotal_hrs() {
        return total_hrs;
    }

    public void setTotal_hrs(double total_hrs) {
        this.total_hrs = total_hrs;
    }
    
    
}
