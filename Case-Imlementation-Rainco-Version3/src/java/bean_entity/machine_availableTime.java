/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import java.util.Comparator;

/**
 *
 * @author Rajitha
 */
public class machine_availableTime implements Comparable<machine_availableTime> {
    
    private String machine;
    private double available_time;

    public machine_availableTime(String machine, double available_time) {
        this.machine = machine;
        this.available_time = available_time;
    }

    public String getMachine() {
        return machine;
    }

    public double getAvailable_time() {
        return available_time;
    }

    public void setMachine(String machine) {
        this.machine = machine;
    }

    public void setAvailable_time(double available_time) {
        this.available_time = available_time;
    }
    
    
        public static Comparator<machine_availableTime> machineTimeComparator 
                          = new Comparator<machine_availableTime>() {
 
	    public int compare(machine_availableTime m1, machine_availableTime m2) {
 
	      double avbT1 = m1.getAvailable_time();
	      double avbT2 = m2.getAvailable_time();
 
	      //ascending order
	      return Double.valueOf(avbT1).compareTo(avbT2);
 
	      //descending order
	      //return fruitName2.compareTo(fruitName1);
	    }
 
	};

    @Override
    public int compareTo(machine_availableTime o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
    
}