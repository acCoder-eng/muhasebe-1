<%-- 
    Document   : sales
    Created on : 03.Oca.2021, 01:59:25
    Author     : qosmio
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.kontrol"%>
<%@page import="data.dbKayıtAl"%>
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
        kontrol db1 = (kontrol) session.getAttribute("user");
        if (db1 == null) {
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
                <%= db1.getCompany_name()%>
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
                                                        int i = 0;
                                                        if (rs != null)
                                                            while (rs.next()) {
                                                                i++;%>
                                                    <tr data-product-id="<%= rs.getString("product_id")%>">
                                                        <td>
                                                            <%=i%>
                                                        </td>
                                                        <td>
                                                            <%= rs.getString("product_name")%>
                                                        </td>
                                                        <td>
                                                            <%= rs.getString("company_id")%>
                                                        </td>
                                                        <td>
                                                            <%= rs.getString("cost")%>TL
                                                        </td>
                                                        <td class="text-primary">
                                                            <%= rs.getString("piece")%>-adet
                                                        </td>
                                                        <td class="text-primary">
                                                            <%= rs.getString("sell_cost")%>TL
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" id="add_basket" data-id="<%= rs.getString("product_id")%>" data-cost="<%= rs.getString("sell_cost")%>" class="settings" ><i class="material-icons">&#xE8B8;</i></a>
                                                            <a href="#" class="delete"><i class="material-icons">&#xE5C9;</i></a>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                  <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header card-header-primary">
                                        <h4 class="card-title ">Sepetteki Product</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class=" text-primary">
                                                <th>
                                                    Name
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
                                                <tbody id="sepet">
                                                    
                                                </tbody>
                                            </table>
                                           
                                        </div>
                                        <!--alıcı -->
                                        <form id="fillForm" method="post" action="salesServlet">
                                            <div class="form-group" >
                                                <select name="buyer_id" class="form-control">
                                                    <option value="0">
                                                        yeni müşteri
                                                    </option>
                                                    <%
                                                       rs = db.buyers(db1.getCompany_id());
                                                     int y =0;
                                                     if(rs !=null)
                                                    while(rs.next()){y++;%>
                                                    <option value="<%= rs.getString("buyer_id") %>">
                                                        <%= rs.getString("buyer_ad") + " " + rs.getString("buyer_soyad")%>
                                                    </option>
                                                    <%}%>
                                                     
                                                </select>
                                            </div>
                                                    <div id="new_buyer">
                                                    <div class="form-group" >
                                                        <input class="form-control" type="text" name="buyer_ad" placeholder="müsteri_ad"/>
                                                    </div>
                                                     <div class="form-group" >
                                                        <input class="form-control" type="text" name="buyer_soyad" placeholder="müsteri_soyad"/>
                                                    </div>
                                                     <div class="form-group" >
                                                        <input class="form-control" type="text" name="buyer_adress" placeholder="müsteri_adres"/>
                                                    </div>
                                                    </div>
                                        </form>
                                                    <button id="addBill" type="button" class="btn btn-primary pull-right" data-toggle="modal">Faturaya Git</button>
                                    </div>
                                </div>
                                    
                            </div> <!-- buradna sonra ekle   -->                  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <script>
        $(document).ready(function () {
            let products = [];
            let  refreshProducts = function () {
                $("tbody#sepet").html('');
                $.each(products, (i, v) => {
                    let productEl = $("tr[data-product-id="+v.id+"]").children();
                    let productName = $(productEl[1]).text().trim();
                    let productCost = $(productEl[3]).text().trim();
                    $("tbody#sepet").append("<tr><td>"+productName+"</td><td>"+v.cost+" TL</td><td><input class='update-amount' data-id='"+v.id+"' name='x' type='number' value='"+v.amount+"'/></td><td>"+v.cost*v.amount+"</td></tr>");
                });
            }
            
            //{id:1,amount:5}
          $("a#add_basket").on("click",function(){
              let id = $(this).data("id");
              let cost = $(this).data("cost");
              let usorgu = products.find(e=>e.id===id);
              
              if(typeof usorgu === "undefined"){
                  let e = {id:id,amount:1, cost:cost};
                  products.push(e);
                  let productEl = $("tr[data-product-id="+id+"]").children();
                  let productName = $(productEl[1]).text().trim();

                 
                  $("tbody#sepet").append("<tr><td>"+productName+"</td><td>"+cost+" TL</td><td><input class='update-amount' data-id='"+id+"' name='x' type='number' value='1'/></td><td>"+cost*e.amount+"</td></tr>");
                  
              }

          });
          
          $("tbody#sepet").on("change", "input.update-amount[data-id]", function() {
              let id = $(this).data("id");
              let amount = $(this).val();
              // products find and change
              let usorgu = products.find(e=>e.id===id);
              if(typeof usorgu === "undefined"){
                  console.log("hata");
                  return;
              }
              usorgu.amount = amount;
              refreshProducts();
          });
          
          
          $("button#addBill").on("click", function(){
              if (products.length === 0) {
                  alert("Sepetinizde urun yok!");
                  return;
              }
              $.each(products, (i,v) => {
                  console.log(v);
                  $("#fillForm").append('<input type="hidden" name="products['+i+'][id]" value="'+v.id+'">')
                  .append('<input type="hidden" name="products['+i+'][amount]" value="'+v.amount+'">');
              });
              $("#fillForm").append('<input type="hidden" name="total_product" value="'+products.length+'">');
              $("#fillForm").submit();
          });
          
          
          $("select[name=buyer_id]").on("change", function(){
              let id = $(this).val();
              if (id === '0') {
                  $("#new_buyer").show();
              } else {
                  $("#new_buyer").hide();
              }
          })
        }); 
    </script>
</body>
</html>
