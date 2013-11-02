package database;







import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */
public class db_connect {
   

    
    public static  Connection conn;
   //  public static void main(String[] args) throws Exception {
  
    
  public static Connection getconn(){
    try{
       Class.forName( "com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rainco","root","123");
    }
    
    catch(Exception e){
    
    }
       
       return conn;
  }
  
  
  public static ResultSet data(String query) throws SQLException{
        if (conn==null){
            getconn();
        
        }
   
        return conn.createStatement().executeQuery(query);
   }         
    
  
   public static  int getData(String val ) throws SQLException{
//            Statement st;
//            st=conn.createStatement();
//            
           if(conn==null){
              getconn(); 
           }
              
           //st.executeUpdate(val);
           return conn.createStatement().executeUpdate(val);
          
     }

   
  
  
  public String arrayListToString(ArrayList arlist, String delimiter) {
    StringBuilder arlstTostr = new StringBuilder();
    if (arlist.size() > 0) {
        arlstTostr.append(arlist.get(0));
        for (int i=1; i<arlist.size(); i++) {
            arlstTostr.append(delimiter);
            arlstTostr.append(arlist.get(i));
        }
    }
    return arlstTostr.toString();
}
  
  
 
} 

 