<%-- 
    Document   : employed
    Created on : 08.Ara.2020, 22:50:07
    Author     : qosmio
--%>

<%@page import="java.util.UUID"%>
<%@page import="data.kontrol"%>
<%@page import="data.dbKayıtAl"%>
<%@page import="java.util.List"%>
<%@page import="data.employe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            List<employe> eplist = db.getEmploye(db1.getCompany_id(), db1.getUser_id());
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
    <div class="main-panel">
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index"
            aria-expanded="false" aria-label="Toggle navigation">
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
          <!-- Table -->
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Simple Table</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          ID
                        </th>
                        <th>
                          CompanyID
                        </th>
                        <th>
                          Name
                        </th>
                        <th>
                          Surname
                        </th>
                        <th>
                          Role
                        </th>
                        <th>
                            Mail
                        </th>
                      </thead>
                      <tbody>
                        <%
                       
                       for(int i =0;i<eplist.size();i++){%>
                        <tr>
                          <td>
                            <%=i+1%>
                          </td>
                          <td>
                              <%= eplist.get(i).getCompany_id() %>
                          </td>
                          <td>
                             <%= eplist.get(i).getName() %>
                          </td>
                          <td>
                              <%= eplist.get(i).getSurname() %>
                          </td>
                          <td>
                              <%= eplist.get(i).getRol_id() %>
                          </td>
                          <td >
                            <%= eplist.get(i).getEmail() %>
                          </td>
                        </tr>
                        <%}%>
                      </tbody>
                    </table>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary"data-toggle="modal"
                      data-target="#addproduct" >ADD PRODUCT</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    <!--Table -->
    <!--modal-->
    <div class="modal fade" id="addproduct" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="card">
                      <div class="modal-content">
                        <div class="card-header card-header-primary">
                          <h4 class="card-title">Edit Profile</h4>
                          <p class="card-category">Complete your profile</p>
                        </div>
                        <div class="modal-body">
                          <form action="employedServlet" method="POST">
                            <div class="row">
                              <div class="col-md-5">
                                <div class="form-group">
                                  <label class="bmd-label-floating">CompanyID (disabled)</label>
                                  <input type="text" class="form-control" value=<%= db1.getCompany_id() %> disabled>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Name</label>
                                  <input type="text" class="form-control" name="name">
                                </div>
                              </div>
                                <div class="col-md-3">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Surname</label>
                                  <input type="text" class="form-control" name="surname">
                                </div>
                              </div>
                            </div>
                                
                                
                            

                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Role</label>
                                   <select id="inputState" class="form-control" name="rol">
                                    <option value="1" selected>İşletme Sahibi</option>
                                    <option value="2">Ürün Müdürü</option>
                                    <option value="3">Ürün Danışmanı</option>
                                    <option value="4">Hesap Müdürü</option>
                                   </select>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Email</label>
                                  <input type="text" class="form-control" name="mail">
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label class="bmd-label-floating">password</label>
                                  <input type="text" class="form-control" name="pass" value=<%= String.valueOf(UUID.randomUUID().toString().substring(0, 8))%>>
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



  <footer class="footer">
    <div class="container-fluid">
      <nav class="float-left">
        <ul>
          <li>
            <a href="https://www.creative-tim.com">
              Creative Tim
            </a>
          </li>
        </ul>
      </nav>
      <div class="copyright float-right">
        &copy;
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="material-icons">favorite</i> by
        <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better web.
      </div>
      <!-- your footer here -->
    </div>
  </footer>
  </div>
  </div>
</body>

</html>


   