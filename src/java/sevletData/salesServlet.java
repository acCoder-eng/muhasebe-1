/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sevletData;

import data.bill;
import data.kontrol;
import data.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author qosmio
 */
public class salesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet salesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet salesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bill_id = Integer.parseInt(request.getParameter("id"));
         response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
         Connection con;
        String sql,sql2;
        PreparedStatement stmt;
        ResultSet rs;
        try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");   
                System.out.println("baglantı basarılı");
                sql = "select bill.*,companies.*,buyers.* from bill left join companies on bill.seller_id=companies.company_id left join buyers on bill.buyer_id=buyers.buyer_id where bill_id = ?";
                sql2 = "select * from bill_products left join products on bill_products.product_id=products.product_id where bill_products.bill_id =?";
                stmt =con.prepareStatement(sql);
                stmt.setInt(1, bill_id);
                rs = stmt.executeQuery();
               if (rs.next()) {
                   bill b = new bill(rs.getInt("bill_id"),rs.getString("seller_id"),rs.getInt("buyer_id"),rs.getInt("bill_cost"), rs.getInt("paid_cost"), rs.getString("buyer_name"),rs.getString("buyer_location"));
                   request.setAttribute("bill", b);
                   stmt =con.prepareStatement(sql2);
                    stmt.setInt(1, bill_id);
                    rs = stmt.executeQuery();
                    List<product> pro = new ArrayList<>();
                    while(rs.next()){
                        pro.add(new product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("company_id"),rs.getInt("cost"),rs.getInt("piece"),rs.getInt("sell_cost"), rs.getFloat("total_price"),rs.getInt("amount")));
                    }
                    request.setAttribute("products", pro);
                     stmt.close(); 
               RequestDispatcher rd = request.getRequestDispatcher("/fatura.jsp");
               rd.forward(request, response);
               }
                try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet salesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Fatura Bulunamadı... </h1>");
            out.println("</body>");
            out.println("</html>");
        }
               
              
             }catch(Exception e){
                response.getWriter().append(e.toString());
             };
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        Connection con;
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
        HttpSession session = request.getSession(true);
       kontrol db1= (kontrol)session.getAttribute("user");
        int buyerId = Integer.parseInt(request.getParameter("buyer_id"));
        if (buyerId == 0) {
            // yeni musteri olustur idsini al
            response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
         try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");  
                System.out.println("baglantı basarılı");
                sql = "insert into buyers(buyer_ad,buyer_soyad,buyer_adress,company_id)VALUES(?,?,?,?)";

                stmt =con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, request.getParameter("buyer_ad"));
                stmt.setString(2, request.getParameter("buyer_soyad"));
                stmt.setString(3, request.getParameter("buyer_adress"));
                stmt.setString(4, db1.getCompany_id());
                stmt.executeUpdate();
                rs = stmt.getGeneratedKeys();
                if (rs.next()){
                    buyerId = Integer.parseInt(rs.getString(1));
                }
                rs.close();
                stmt.close(); 
             }catch(Exception e){
                response.getWriter().append(e.toString());
             };
        }
        int billId = 0;
        // fatura olustur...
         try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");  
                System.out.println("baglantı basarılı");
                sql = "insert into bill(seller_id,buyer_id,bill_cost,paid_cost)VALUES(?,?,?,?)";

                stmt =con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, db1.getCompany_id());
                stmt.setInt(2, buyerId);
                stmt.setInt(3, 0);
                stmt.setInt(4,0);
                stmt.executeUpdate();
                rs = stmt.getGeneratedKeys();
                if (rs.next()){
                    billId = Integer.parseInt(rs.getString(1));
                }
                rs.close();
                stmt.close(); 
             }catch(Exception e){
                response.getWriter().append(e.toString());
             };
        
        int totalProduct = Integer.parseInt(request.getParameter("total_product"));
        int totalPrice = 0;
        for(int i=0; i< totalProduct; i++) {
            int productId = Integer.parseInt(request.getParameter("products["+i+"][id]"));
            int productAmount = Integer.parseInt(request.getParameter("products["+i+"][amount]"));
            int productPrice =0;
            String productName = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");   
                System.out.println("baglantı basarılı");
                
                sql = "select * from products where product_id=?";
                stmt =con.prepareStatement(sql);
                stmt.setInt(1, productId);
                rs = stmt.executeQuery();  
                if(rs.next()){
                    productPrice = Integer.parseInt(rs.getString("sell_cost"));
                    productName = rs.getString("product_name");
                }
                rs.close();
                
                sql = "insert into bill_products(bill_id,product_id,total_price,amount)VALUES(?,?,?,?)";
                totalPrice += productAmount*productPrice;
                stmt =con.prepareStatement(sql);
                stmt.setInt(1, billId);
                stmt.setInt(2,productId);
                stmt.setInt(3,productAmount*productPrice);
                stmt.setInt(4,productAmount);
                stmt.executeUpdate();
                rs.close();
                stmt.close(); 
             }catch(Exception e){
                response.getWriter().append(e.toString());
             };
            
            // 
        }
        try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634"); 
                System.out.println("baglantı basarılı");

                // totla price guncelle totalPrice
               sql = "UPDATE bill SET bill_cost=? where bill_id= ? " ;
                
                stmt =con.prepareStatement(sql);
                stmt.setInt(1,totalPrice);
                stmt.setInt(2,billId);
                stmt.executeUpdate();
                stmt.close(); 
                
                response.sendRedirect("salesServlet?id=" + billId);
             }catch(Exception e){
                response.getWriter().append(e.toString());
             };
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
