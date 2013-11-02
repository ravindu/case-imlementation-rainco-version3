/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import java.util.Date;

/**
 *
 * @author HP
 */
public class additional_request {
    
    Date date;
    private String umbrella;
    private String branch;
    private int quantity;
    private  int request_id;

    public additional_request(Date date, String umbrella, String branch, int quantity,int request_id) {
        this.date = date;
        this.umbrella = umbrella;
        this.branch = branch;
        this.quantity = quantity;
        this.request_id=request_id;
        
    }

    public Date getDate() {
        return date;
    }

    public String getUmbrella() {
        return umbrella;
    }

    public String getBranch() {
        return branch;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getRequest_id() {
        return request_id;
    }

    
    
    
}
