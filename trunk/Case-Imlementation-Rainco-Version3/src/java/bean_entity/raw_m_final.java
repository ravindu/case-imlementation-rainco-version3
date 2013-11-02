/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

/**
 *
 * @author Rajitha
 */
public class raw_m_final {
    
    private String rm;
    private String col;
    private double total;
    private double runner_w;

    public raw_m_final(String rm,String col, double total, double runner_w) {
        this.rm = rm;
        this.total = total;
        this.runner_w = runner_w;
        this.col = col;
    }

    public String getRm() {
        return rm;
    }

    public String getCol() {
        return col;
    }

    public double getTotal() {
        return total;
    }

    public double getRunner_w() {
        return runner_w;
    }
    
    
    
}
