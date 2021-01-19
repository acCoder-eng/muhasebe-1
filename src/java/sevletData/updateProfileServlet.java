/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sevletData;

import data.kontrol;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author qosmio
 */
public class updateProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet updateProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfileServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
       kontrol db1= (kontrol)session.getAttribute("user");
         try{
                Class.forName("com.mysql.jdbc.Driver");  
                con=DriverManager.getConnection( "jdbc:mysql://bd30db37b42d33:b2906634@eu-cdbr-west-03.cleardb.net/heroku_988e1fee65f25cd?reconnect=true","bd30db37b42d33","b2906634");  
                System.out.println("baglantı basarılı");
                sql = "UPDATE users SET name=?,surname=?,email=? where user_id= ? " ;
                stmt =con.prepareStatement(sql);
                stmt.setString(1, request.getParameter("name"));
                stmt.setString(2, request.getParameter("surname"));
                stmt.setString(3, request.getParameter("mail"));
                stmt.setInt(4, Integer.parseInt(db1.getUser_id()));
                stmt.executeUpdate();
                stmt.close(); 
                db1.setName(request.getParameter("name"));
                db1.setSurname(request.getParameter("surname"));
                db1.setEmail(request.getParameter("mail"));
                response.sendRedirect("user.jsp");

         }catch(Exception e){response.getWriter().append(e.toString());};
        
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
