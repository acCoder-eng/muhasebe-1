<%-- 
    Document   : user
    Created on : 02.Ara.2020, 04:07:27
    Author     : qosmio
--%>
<%@page import="data.dbKayıtAl"%>
<%@page import="data.kontrol"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!--     login and register  -->
  <link rel="stylesheet" type="text/css" href="assets/css/css.css" />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />

  <title>JSP Page</title>
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  </style>
  <script>
    $(document).ready(function () {
      $('[data-toggle="tooltip"]').tooltip();
    });
  </script>
</head>

<body>

  <%
        dbKayıtAl db = new dbKayıtAl();
        kontrol db1= (kontrol)session.getAttribute("user");
        if(db1==null){
            %><jsp:forward page="login.jsp"/><%
        }
        
        String rol = null;
        if(db1.getRole_id().equals("1")){
            rol = "maneger";
        }
        else if(db1.getRole_id().equals("2")){
            rol = "product manager";
        }
        else if(db1.getRole_id().equals("3")){
            rol = "product consultant";
        }
        else if(db1.getRole_id().equals("4")){
            rol = "accounting manager";
        }
        
        %>

  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white">
      <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
      <div class="logo">
        <a href="#" class="simple-text logo-normal">
          <%= db1.getCompany_name()  %>
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active  ">
            <a class="nav-link" href="dashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
            <%
                if(db1.getRole_id().equals("1")||db1.getRole_id().equals("2")){
               %>     
            
          <li class="nav-item">
            <a class="nav-link" href="product.jsp">
              <i class="material-icons">content_paste</i>
              <p>Table List</p>
            </a>
          </li>
            <%
                    }
            %>  
             <li class="nav-item">
            <a class="nav-link" href="employed.jsp">
              <i class="material-icons">library_books</i>
              <p>Employed</p>
            </a>
          </li>
            
                <li class="nav-item">
            <a class="nav-link" href="sales.jsp">
              <i class="material-icons">library_books</i>
              <p>Sales</p>
            </a>
          </li>
          <!-- your sidebar here -->
        </ul>
      </div>
    </div>
    <!-- User update -->
    <div class="main-panel">
        <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="javascript:;">
                  <i class="material-icons">notifications</i> Notifications
                </a>
              </li>
                <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="./user.jsp">Profile</a>
                  <a class="dropdown-item" href="#">Settings</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="LogOut">Log out</a>
                </div>
              </li>
              <!-- your navbar here -->
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Profile</h4>
                </div>
                <div class="card-body">
                  <form>
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">CompanyID (disabled)</label>
                          <input type="text" class="form-control" value=<%= db1.getCompany_id() %> disabled>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company Name</label>
                          <input type="text" class="form-control" value=<%= db1.getCompany_name() %>>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email address</label>
                          <input type="email" class="form-control" value=<%= db1.getEmail() %>>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Fist Name</label>
                          <input type="text" class="form-control" value=<%= db1.getName() %>>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Last Name</label>
                          <input type="text" class="form-control" value=<%= db1.getSurname() %>>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">RoleID</label>
                          <input type="text" class="form-control" value=<%= rol %>>
                        </div>
                      </div>

                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label>Adress</label>
                          <div class="form-group">
                            <textarea class="form-control" rows="5"><%= db1.getCompany_location() %></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary pull-right" data-toggle="modal"
                      data-target="#exampleModal">Update Profile</button>
                    </form>
                         
                           <!--modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="card">
                      <div class="modal-content">
                        <div class="card-header card-header-primary">
                          <h4 class="card-title">Edit Profile</h4>
                          <p class="card-category">Complete your profile</p>
                        </div>
                        <div class="modal-body">
                          <form action="updateProfileServlet" method="POST">
                             <div class="row">
                                    <div class="col-md-5">
                                      <div class="form-group">
                                        <label class="bmd-label-floating">CompanyID (disabled)</label>
                                        <input type="text" class="form-control" value=<%= db1.getCompany_id() %> disabled>
                                      </div>
                                    </div>
                                    <div class="col-md-3">
                                    <div class="form-group">
                                      <label class="bmd-label-floating">Company Name</label>
                                      <input type="text" class="form-control" value=<%= db1.getCompany_name() %> disabled>
                                    </div>
                                  </div>
                               <div class="col-md-4">
                               <div class="form-group">
                                 <label class="bmd-label-floating">Email address</label>
                                 <input type="email" class="form-control" name="mail" value=<%= db1.getEmail() %>>
                               </div>
                             </div>      
                           </div>
                               
                               
                                <div class="row">
                                <div class="col-md-6">
                                  <div class="form-group">
                                    <label class="bmd-label-floating">Fist Name</label>
                                    <input type="text" class="form-control" name="name" value=<%= db1.getName() %>>
                                  </div>
                                </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <label class="bmd-label-floating">Last Name</label>
                                      <input type="text" class="form-control" name="surname" value=<%= db1.getSurname() %>>
                                    </div>
                                  </div>
                                </div>
                                    
                                    <div class="row">
                                    <div class="col-md-4">
                                      <div class="form-group">
                                        <label class="bmd-label-floating">RoleID</label>
                                        <input type="text" class="form-control" value=<%= rol %> disabled>
                                      </div>
                                    </div>
                                      <div class="col-md-4">
                                      <div class="form-group">
                                        <label class="bmd-label-floating">Password</label>
                                        <input type="password" name="pass" class="form-control">
                                      </div>
                                    </div>

                                </div>
                                

                          
                        </div>
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>
                  </div>
                    <div class="clearfix"></div>
                  </form>
    <!--modal end-->
  </div>
  </div>

                          
                  
        
              
      
            <!-- end update -->
            <div class="col-md-4">
              <div class="card card-profile">
                <div class="card-avatar">
                  <a href="javascript:;">
                    <img class="img" src="assets/img/faces/marc.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="card-category text-gray">CEO / Co-Founder</h6>
                  <h4 class="card-title">Alec Thompson</h4>
                  <p class="card-description">
                    Don't be scared of the truth because we need to restart the human foundation in truth And I love you
                    like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                  </p>
                  <a href="javascript:;" class="btn btn-primary btn-round">Follow</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>