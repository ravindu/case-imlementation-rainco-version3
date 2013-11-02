/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author HP
 */
public class machine_helper {

    public int getQty() {
        return qty;
    }
    
    private String machine_id;
    private String status;
    int qty;
    int total_qty;
    int completed;
    
    

    public machine_helper(String machine_id, int qty, int total_qty, int completed) {
        this.machine_id = machine_id;
        this.qty = qty;
        this.total_qty = total_qty;
        this.completed = completed;
    }
  

    public machine_helper(String machine_id, int qty) {
        this.machine_id = machine_id;
        this.qty = qty;
    }

    public int getTotal_qty() {
        return total_qty;
    }

    public int getCompleted() {
        return completed;
    }

    public machine_helper(String machine_id, String status) {
        this.machine_id = machine_id;
        this.status = status;
    }

    public machine_helper(String machine_id) {
         this.machine_id = machine_id;
    }

    public String getMachine_id() {
        return machine_id;
    }

    public String getStatus() {
        return status;
    }
    
    
    
    
    
}
