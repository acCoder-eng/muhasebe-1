package data;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author qosmio
 */
public class dbKayıtAl {
    private Connection con;
    private  PreparedStatement stmt;
    private String sql;
    private ResultSet rs;

    public dbKayıtAl() {
        try{
    Class.forName("com.mysql.jdbc.Driver");  
    con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634"); 
                System.out.println("baglantı basarılı");
           }catch(Exception e){
               System.out.println("baglantı hatalı");
           }
    }
    
    
    
   
    
    public List<employe>getEmploye(String company_id,String user_id){
            List<employe> emplist = new ArrayList<>();
        try{
            sql="SELECT * FROM users where company_id = ? and user_id != ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, company_id);
            stmt.setString(2,user_id);
            rs = stmt.executeQuery();
            while(rs.next()){
                emplist.add(new employe(rs.getString("name"),rs.getString("surname"), rs.getString("email"),rs.getInt("role_id"),rs.getString("company_id")));
            }
        }catch(Exception e){System.err.println(e);};
        return emplist;
        
    }
    
    public ResultSet product(String id){
        try{
             sql = "SELECT * FROM products where company_id = ?";
             stmt = con.prepareStatement(sql);
             stmt.setString(1, id);
             rs = stmt.executeQuery();     
        }catch(Exception e){System.out.print(e);};
        return rs;
    }
    
     public ResultSet buyers(String id){
        try{
             sql = "SELECT * FROM buyers where company_id = ?";
             stmt = con.prepareStatement(sql);
             stmt.setString(1, id);
             rs = stmt.executeQuery();     
        }catch(Exception e){System.out.print(e);};
        return rs;
    }
    
    public int faturaAdet(){
        try{
            sql = "SELECT COUNT(*) FROM roles";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
             if (rs.next()) {
               return rs.getInt(1);
               }
            
            
        }catch(Exception e){System.err.println(e);}
       return 1;
    }
    
          public int müsteriAdet(){
        try{
            sql = "SELECT COUNT(*) FROM companies";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
             if (rs.next()) {
               return rs.getInt(1);
               }
            
            
        }catch(Exception e){System.err.println(e);}
        return 1;
          }
          
          public ResultSet sonbesMüsteri(){
                try{
            sql = "SELECT * FROM companies LIMIT 5";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
        }catch(Exception e){System.err.println(e);}
         return rs;
          }
          
    
}
