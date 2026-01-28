
package abc;

import java.sql.*;

/**
 *
 * @author panch
 */
public class Abc {

    
    public static void main(String[] args) {
      
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        String dname="jdbc:mysql://localhost:3306/practical";
        String uname="root";
        String pass="";
        
        Connection con=DriverManager.getConnection(dname,uname,pass);
        PreparedStatement ps=con.prepareStatement("insert into student values(?,?)");
        
        int i=4;
        String name="jay123";
        
        ps.setInt(1, i);
        ps.setString(2, name);
        
        int as=ps.executeUpdate();
        
            System.out.println(as+"record inserted");
        
        
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    
}
