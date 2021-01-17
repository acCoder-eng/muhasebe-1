<%-- 
    Document   : fatura
    Created on : 07.Oca.2021, 20:31:48
    Author     : qosmio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="data.product"%>
<%@page import="java.util.List"%>
<%@page import="data.bill"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/index.css">
</head>
<body>
    <%
           bill x = (bill)request.getAttribute("bill");
           List<product> pr = (List<product>)request.getAttribute("products");
        %>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 brandSection">
                <div class="row">
                    <div class="col-md-12 col-sm-12 header">
                        <div class="col-md-3 col-sm-3 headerLeft">
                            <h1>Brand Logo</h1>
                        </div>
                        <div class="col-md-9 col-sm-9 headerRight">
                            <p>www.yourbrand.com</p>
                            <p>mail@yourbrand.com</p>
                            <p>(000)555 555 55</p>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 content">
                        <h1>Invoice<strong><%=x.getBill_id() %></strong></h1>
                        <p>01 September,2012</p>
                        <span>Payment due by 25 November 2012</span>
                    </div>
                    <div class="col-md-12 col-sm-12 panelPart">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 panelPart">
                              <div class="panel panel-default">
                                  <div class="panel-body">
                                      FROM
                                  </div>
                                  <div class="panel-footer">
                                      <div class="row">
                                          <div class="col-md-4 col-sm-6 col-xs-6">
                                            <h1>LOGO</h1>
                                          </div>
                                          <div class="col-md-8 col-sm-6 col-xs-6">
                                            <p>your name</p>
                                            <p>your name</p>
                                            <p>your name</p>
                                            <p>your name</p>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-6 panelPart">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        TO
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-6 col-xs-6">
                                              <h1>LOGO</h1>
                                            </div>
                                            <div class="col-md-8 col-sm-6 col-xs-6">
                                              <p>your name</p>
                                              <p>your name</p>
                                              <p>your name</p>
                                              <p>your name</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              </div>
                          </div>
                        </div>
                        <div class="col-md-12 col-sm-12 tableSection">
                            <h1>ITEMS</h1>
                            <table class="table text-center">
                              <thead>
                                <tr class="tableHead">
                                  <th style="width:30px;">Quantity</th>
                                  <th>Description</th>
                                  <th style="width:100px;">Unit Price</th>
                                  <th style="width:100px;text-align:center;">TOTAL</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <%
                       
                       for(int i =0;i<pr.size();i++){%>
                        <tr>
                          <td>
                              <%= pr.get(i).getAmount() %>
                          </td>
                          <td>
                             <%= pr.get(i).getProduct_name() %>
                          </td>
                          <td>
                              <%= pr.get(i).getTotal_price()/pr.get(i).getAmount() %>
                          </td>
                          <td>
                              <%= pr.get(i).getTotal_price() %>
                          </td>
                        </tr>
                        <%}%>
                              </tbody>
                          </table>
                        </div>
                        <div class="col-md-12 col-sm-12 lastSectionleft "> 
                            <div class="row">
                                <div class="col-md-8 col-sm-6 Sectionleft">
                                    <p><i>Special Notes</i></p>
                                    <span><i>Lorem ipsum dolor sit amet,ipsum dolor.</i> </span>
                                </div>
                                <div class="col-md-4 col-sm-6"> 
                                  <div class="panel panel-default">
                                      <div class="panel-body lastPanel">
                                          AMOUNT DUE
                                      </div>
                                      <div class="panel-footer lastFooter">
                                          <div class="row">
                                              <div class="col-md-5 col-sm-6 col-xs-6 panelLastLeft">
                                                <p>SUBTOTAL</p>
                                                <p>TAX</p>
                                                <p>SHIPPING</p>
                                                <p>TOTAL</p>
                                              </div>
                                              <div class="col-md-7 col-sm-6 col-xs-6 panelLastRight">
                                                <p>$90</p>
                                                <p>$90</p>
                                                <p>$90</p>
                                                <p><strong>$270</strong></p>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
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
