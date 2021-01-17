/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author qosmio
 */
public class dataBase {
    
     private Connection con;
    private  PreparedStatement stmt;
    public String sql,companyid,companyname,companylocation,webddress;
    public int val;
    public String ad,soyad,mail,sifre;
    public Connection connectDb() {
    try{
    Class.forName("com.mysql.jdbc.Driver");  
    con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");  
                System.out.println("baglantı basarılı");
           }catch(Exception e){
               System.out.println("baglantı hatalı");
           }
    return con;
    }
    public void addcompany(){
        connectDb();
          try{
            sql = "insert into companies(company_id,company_name,company_location,web_address) values(?,?,?,?)";
            stmt =con.prepareStatement(sql);
            stmt.setString(1, companyid);
            stmt.setString(2, companyname);
            stmt.setString(3, companylocation);
            stmt.setString(4, webddress);
            stmt.executeUpdate();
            stmt.close(); 
        }catch(Exception e){System.out.print(e);}
    }
    
    public void addregister(HttpServletResponse response) throws IOException{
        connectDb();
        try{
            sql = "insert into users(name,surname,email,password,role_id,company_id ) values(?,?,?,?,?,?)";
            stmt =con.prepareStatement(sql);
            stmt.setString(1, ad);
            stmt.setString(2, soyad);
            stmt.setString(3, mail);
            stmt.setString(4, sifre);
            stmt.setInt(5, val);
            stmt.setString(6, companyid);
            stmt.execute();
            stmt.close();      
        }catch(Exception e){response.getWriter().append(e.toString());}
    }
    
}
