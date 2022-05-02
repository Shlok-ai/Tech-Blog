package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
    public static Connection con;
    private static Object out;
    public static Connection getConnection(){
    
       try{
           if(con==null){
               
             //load the driver
             Class.forName("com.mysql.jdbc.Driver");
              
             
             //create a connection
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "123456789");
//             if(con.isClosed())
//                 System.out.println("No connection");
//                 else
//                 System.out.println("Done with connection");
//                 
             
//             Statement statement = con.createStatement();
//            String query = "CREATE TABLE student (Id INTEGER, Name CHAR(50));";
//            statement.executeUpdate(query);
         

               
           }      
         }catch(Exception e){
             e.printStackTrace();
       }
        return con;
    }
}
