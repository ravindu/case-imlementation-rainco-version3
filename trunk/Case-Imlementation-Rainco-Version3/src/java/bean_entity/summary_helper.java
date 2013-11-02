/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author HP
 */
public class summary_helper {
    
    private String buffer;
    private int qty;
    private  int remaining;

    public summary_helper() {
    }
    
    

    public summary_helper(String buffer, int qty, int remaining) {
        this.buffer = buffer;
        this.qty = qty;
        this.remaining = remaining;
    }
    
    
    

    public void setBuffer(String buffer) {
        this.buffer = buffer;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setRemaining(int remaining) {
        this.remaining = remaining;
    }

    public String getBuffer() {
        return buffer;
    }

    public int getQty() {
        return qty;
    }

    public int getRemaining() {
        return remaining;
    }
    
    
    
}
