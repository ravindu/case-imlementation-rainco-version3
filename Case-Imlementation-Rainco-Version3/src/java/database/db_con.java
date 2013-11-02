/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class db_con {
    
    public static Connection conn;
     public static Connection getconn(){
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rainco","root","123");
           

        }
        catch (Exception e) {

            System.out.println(e);
        }
       return conn; //return the connection type
    }

      public static void submit(String s)
     {
        if(conn==null){
            getconn();//make the connection
        }
        try {
          conn.createStatement().executeUpdate(s);
        } catch (Exception e) {

        }

    }

        public static void change(String s)
        {
        if(conn==null){
            getconn();//make the connection
        }
        try {
          conn.createStatement().executeUpdate(s);
        } catch (Exception e) {

        }

    }


      public static ResultSet search(String s)throws SQLException{
        if(conn==null)
        {
            getconn();
        }
        ResultSet rs=conn.createStatement().executeQuery(s);//look is this sql statement,choose sql statement
        return rs;
    }

    
}
