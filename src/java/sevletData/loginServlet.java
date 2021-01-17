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
public class loginServlet extends HttpServlet {

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
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        Connection con;
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
             try{
    Class.forName("com.mysql.jdbc.Driver");  
    con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/muhasebe","root","");   
                System.out.println("baglantı basarılı");
                
                sql = "SELECT users.name,users.surname,users.user_id,users.company_id,users.email,users.role_id,companies.company_location,companies.company_name FROM users,companies where users.email = ? and users.password = ? and users.company_id=companies.company_id" ;
                  stmt = con.prepareStatement(sql);
                   stmt.setString(1, request.getParameter("email"));
                   stmt.setString(2,request.getParameter("sifre"));
                  rs = stmt.executeQuery();
                  rs.next();
                  if(rs.getRow()>0){
                      kontrol kt = new kontrol();
                      kt.setName(rs.getString("name"));
                      kt.setSurname(rs.getString("surname"));
                      kt.setUser_id(rs.getString("user_id"));
                      kt.setCompany_id(rs.getString("company_id"));
                      kt.setEmail(rs.getString("email"));
                      kt.setRole_id(rs.getString("role_id"));
                      kt.setCompany_name(rs.getString("company_name"));
                      kt.setCompany_location(rs.getString("company_location"));
                      
                      HttpSession session = request.getSession(true);
                      session.setAttribute("user", kt);
                      response.sendRedirect("dashboard.jsp");
                      
                  }
                  else{
                      response.sendRedirect("login.jsp");
                  }
                
           }catch(Exception e){
               System.out.println("baglantı hatalı");
           }
             
        
        
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
