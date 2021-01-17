<%-- 
    Document   : register
    Created on : 28.Kas.2020, 00:52:12
    Author     : qosmio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>HTML CSS Register Form</title>
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>
      <%
          session.setAttribute("theID", request.getParameter("companyID"));
          session.setAttribute("theName", request.getParameter("companyName"));
          session.setAttribute("thesite", request.getParameter("webSite"));
          session.setAttribute("theadress", request.getParameter("adress"));
          %>
      
    <form class="signup-form" action="dbServlet" method="post">

      <!-- form header -->
      <div class="form-header">
        <h1>Create Account</h1>
      </div>

      <!-- form body -->
      <div class="form-body">

        <!-- Firstname and Lastname -->
        <div class="horizontal-group">
          <div class="form-group left">
            <label for="firstname" class="label-title">First name *</label>
            <input type="text" name="firstName" class="form-input" placeholder="enter your first name" required="required" />
          </div>
          <div class="form-group right">
            <label for="lastname" class="label-title">Last name</label>
            <input type="text" name="lastName" class="form-input" placeholder="enter your last name" />
          </div>
        </div>

        <!-- Email -->
        <div class="form-group">
          <label for="email" class="label-title">Email*</label>
          <input type="email" name="email" class="form-input" placeholder="enter your email" required="required">
        </div>

        <div class="form-group">
          <label for="companyid" class="label-title">companyID</label>
          <input type="text" name="companyID" class="form-input" required="required" readonly value=<%=(String)session.getAttribute("theID") %>>
        </div>


        <!-- Passwrod and confirm password -->
        <div class="horizontal-group">
          <div class="form-group left">
            <label for="password" class="label-title">Password *</label>
            <input type="password" name="password" class="form-input" placeholder="enter your password" required="required">
          </div>
          <div class="form-group right">
            <label for="confirm-password" class="label-title">Confirm Password *</label>
            <input type="password" class="form-input" name="confirm-password" placeholder="enter your password again" required="required">
          </div>
        </div>

        <!-- Gender and Hobbies -->
        <div class="horizontal-group">
          <div class="form-group left">
            <label class="label-title">Gender:</label>
            <div class="input-group">
              <label for="male"><input type="radio" name="gender" value="male" id="male"> Male</label>
              <label for="female"><input type="radio" name="gender" value="female" id="female"> Female</label>
            </div>
          </div>
        <!-- Source of Income and Income -->
        <div class="horizontal-group">
          <div class="form-group left" >
            <label class="label-title">Status</label>
            <select class="form-input" name="level" >
              <option value="1">Manager</option>
              <option value="2">Product Manager</option>
              <option value="3">Product Consultant</option>
              <option value="4">Accounting Manager</option>
            </select>
          </div>
      <!-- form-footer -->
      <div class="form-footer">
        <span>* required</span>
        <button type="submit" class="btn">Create</button>
      </div>

    </form>

  
  </body>
</html>