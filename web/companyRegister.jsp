<%-- 
    Document   : companyRegister
    Created on : 28.Kas.2020, 00:38:25
    Author     : qosmio
--%>

<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Main css -->
           <link rel="stylesheet" href="assets/css/style.css">
    <title>JSP Page</title>
</head>
<body>
    <form class="signup-form" action="register.jsp" method="post">
          <!-- form header -->
        <div class="form-header">
          <h1>Create Account</h1>
        </div>
  
        <!-- form body -->
        <div class="form-body">
        <div class="form-group">
             <label for="companyid" class="label-title">companyID</label>
            <%
                UUID deger = UUID.randomUUID();
                %>
            <input type="text" name="companyID" class="form-input" required="required" readonly value=<%=deger%>>
          </div>
            <!-- Firstname and Lastname -->
          <div class="horizontal-group">
            <div class="form-group left">
              <label for="firstname" class="label-title">CompanyName *</label>
              <input type="text" name="companyName" class="form-input" placeholder="enter your first name" required="required" />
            </div>
            <div class="form-group right">
              <label for="lastname" class="label-title">Web Site</label>
              <input type="text" name="webSite" class="form-input" placeholder="enter your last name" />
            </div>
              <!-- Bio -->
        <div class="form-group">
          <label for="choose-file" class="label-title">Location</label>
          <textarea class="form-input" name="adress" rows="4" cols="50" style="height:auto"></textarea>
        </div>
      </div>
             <!-- form-footer -->
        <div class="form-footer">
          <span>* required</span>
          <button type="submit" class="btn">Create</button>   
        </div>
              
        </div>
    </form>
        
</body>
</html>
