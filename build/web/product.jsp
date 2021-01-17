<%-- 
    Document   : product
    Created on : 03.Ara.2020, 02:56:27
    Author     : qosmio
--%>
<%@page import="data.kontrol"%>
<%@page import="data.dbKayıtAl,java.sql.*"%>
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
  <script src="assets/js/core/jquery-3.5.1.min.js"></script>
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
        
        %>
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white">
      <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
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
          <li class="nav-item">
            <a class="nav-link" href="product.jsp">
              <i class="material-icons">content_paste</i>
              <p>Table List</p>
            </a>
          </li>
            </li>
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
                          Name
                        </th>
                        <th>
                          CompanyID
                        </th>
                        <th>
                          Cost
                        </th>
                        <th>
                          Piece
                        </th>
                        <th>
                          Sell Cost
                        </th>
                      </thead>
                      <tbody>
                        <%
                        ResultSet rs = db.product(db1.getCompany_id());
                        int i =0;
                        if(rs !=null)
                       while(rs.next()){i++;%>
                        <tr>
                          <td>
                            <%=i%>
                          </td>
                          <td>
                            <%= rs.getString("product_name")  %>
                          </td>
                          <td>
                             <%= rs.getString("company_id")  %>
                          </td>
                          <td>
                              <%= rs.getString("cost") %>TL
                          </td>
                          <td class="text-primary">
                            <%= rs.getString("piece") %>-adet
                          </td>
                          <td class="text-primary">
                            <%= rs.getString("sell_cost") %>TL
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
                          <form action="ProductAdd" method="POST">
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
                                  <input type="text" class="form-control" name="pname">
                                </div>
                              </div>
                            </div>
                            

                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label class="bmd-label-floating">COST</label>
                                  <input type="text" name="cost" class="form-control">
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label class="bmd-label-floating">PIECE</label>
                                  <input type="text" class="form-control" name="piece">
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label class="bmd-label-floating">SELL_COST</label>
                                  <input type="text" class="form-control" name="sell">
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