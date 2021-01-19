/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sevletData;

import data.kontrol;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author qosmio
 */
public class ProductAdd extends HttpServlet {

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
            out.println("<title>Servlet ProductAdd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductAdd at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
         Connection con;
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
        HttpSession session = request.getSession(true);
       kontrol db1= (kontrol)session.getAttribute("user");
       

             try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");
                System.out.println("baglantı basarılı");
                sql = "insert into products(product_name,company_id,cost,piece,sell_cost)VALUES(?,?,?,?,?)";
                stmt =con.prepareStatement(sql);
                stmt.setString(1, request.getParameter("pname"));
                stmt.setString(2, db1.getCompany_id());
                stmt.setInt(3, Integer.parseInt(request.getParameter("cost")));
                stmt.setInt(4, Integer.parseInt(request.getParameter("piece")));
                stmt.setInt(5, Integer.parseInt(request.getParameter("sell")));
                stmt.execute();
                stmt.close(); 
                response.sendRedirect("product.jsp");
             }catch(Exception e){
                response.getWriter().append(e.toString());
             };
        processRequest(request, response);
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
