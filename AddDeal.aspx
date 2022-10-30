﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDeal.aspx.cs" Inherits="DJResortOnline.AddDeal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DJ Resort | Add Deal</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="~/plugins/fontawesome-free/css/all.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="~/dist/css/adminlte.min.css" />

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css" />

    <%--    Templates/AdminLTE-3.1.0-rc/pages/mailbox/compose.html--%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="wrapper">

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="Front.aspx" class="nav-link">DJ Resort</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <!-- Logout Menu -->
                    <li class="nav-item dropdown">
                        <a href="Login.aspx" class="btn btn-danger" type="button">Log Out &nbsp;<i class="fas fa-power-off"></i>
                        </a>
                    </li>

                </ul>

            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="Front.aspx" class="brand-link">
                    <img src="image/dashboard.png" alt="DJ Resort Logo" class="brand-image img-circle elevation-3" />
                    <span class="brand-text font-weight-light">DJ Resort</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="image/admin.png" class="img-circle elevation-2" alt="User Image" />
                        </div>
                        <div class="info">
                            <a href="#" class="d-block">Admin User</a>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" />
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

                        <li class="nav-item">
                            <a href="Dashboard.aspx" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Reserved.aspx" class="nav-link">
                                <i class="nav-icon fas fa-book"></i>
                                <p>
                                    Reservation
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Status.aspx" class="nav-link">
                                <i class="nav-icon fas fa-shopping-cart"></i>
                                <p>
                                    Status
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="PriceList.aspx" class="nav-link">
                                <i class="nav-icon fas fa-umbrella-beach"></i>
                                <p>
                                    Deals
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Emails.aspx" class="nav-link">
                                <i class="nav-icon fas fa-paper-plane"></i>
                                <p>
                                    Send Emails
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Feedback.aspx" class="nav-link">
                                <i class="nav-icon fas fa-star"></i>
                                <p>
                                    Feedbacks
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Invoice.aspx" class="nav-link">
                                <i class="nav-icon fas fa-file-alt"></i>
                                <p>
                                    Invoice
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Announcement.aspx" class="nav-link">
                                <i class="nav-icon fas fa-thumbtack"></i>
                                <p>
                                    Announcement
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="HealthDeclaration.aspx" class="nav-link">
                                <i class="nav-icon fas fa-notes-medical"></i>
                                <p>
                                    Health Declaration
                                </p>
                            </a>
                        </li>
                    </nav>
                    <!-- /.sidebar-menu -->

                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Add Deals</h1>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="card-body">

                            <div class="form-group">
                                <div class="row" style="padding-bottom: 0px;">
                                    <div class="col-6">
                                        <input type="text" class="form-control" runat="server" placeholder="Deals Name" visible="false" />
                                    </div>
                                    <div class="col-5">
                                        <img src="~/image/thumbnail.png" runat="server" id="AddImgThumbnail" style="float: right; height: 180px;" />
                                    </div>
                                    <div class="col-1">
                                        <input type="text" class="form-control" runat="server" placeholder="Deals Name" visible="false" />
                                    </div>
                                </div>
                            </div>

                            <%--1st Row--%>
                            <div class="form-group">
                                <div class="row" style="padding-bottom: 0px;">
                                    <div class="col-6">
                                        <input type="text" class="form-control" runat="server" placeholder="Deals Name" visible="false" />
                                    </div>
                                    <div class="col-5">
                                        <asp:Label ID="addImgLink" runat="server" Font-Bold="True" Font-Size="Large" Style="float: right;"></asp:Label>
                                    </div>
                                    <div class="col-1">
                                        <input type="text" class="form-control" runat="server" placeholder="Deals Name" visible="false" />
                                    </div>
                                </div>
                            </div>

                            <%--1st Row--%>
                            <div class="form-group">
                                <div class="row" style="padding-bottom: 0px;">
                                    <div class="col-6">
                                        <input type="text" id="addDealsName" class="form-control" runat="server" placeholder="Deals Name" />
                                    </div>
                                    <div class="col-6">
                                        <%--<input type="file" id="imageUploader" runat="server" required="required" />--%>
                                        <asp:FileUpload ID="Addimage" runat="server" accept=".png,.jpg,.jpeg,.gif" />
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="* Required Field" ControlToValidate="Addimage" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <%--2nd Row--%>
                            <div class="form-group">
                                <label>Deals Description</label>
                                <textarea id="AddTxtDescription" class="form-control" rows="4" runat="server"></textarea>
                            </div>

                            <%--3rdRow--%>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-4">
                                        <label for="inputStatus">No. of Adults</label>
                                    </div>
                                    <div class="col-4">
                                        <label for="inputStatus">No. Of Kids</label>
                                    </div>
                                    <div class="col-4">
                                        <label for="inputStatus">Price:  ₱</label>
                                    </div>
                                </div>
                            </div>

                            <%--4th Row--%>
                            <div class="form-group">
                                <div class="row">

                                    <div class="col-4">
                                        <input type="number" id="AddAdultsNo" class="form-control" runat="server" />
                                    </div>

                                    <div class="col-4">
                                        <input type="number" id="AddKidsNo" class="form-control" runat="server" />
                                    </div>

                                    <div class="col-4">
                                        <input type="number" id="AddPrice" class="form-control" runat="server" />
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnAdd_Click"/>
                        <asp:Button ID="btnBack" CssClass="btn btn-success" runat="server" Text="Back to Deals" OnClick="btnBack_Click"/>
                    </div>
                    <!-- /.card-footer -->
            </div>
            <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <strong>Copyright &copy; 2022 <a href="~/">DJ Resort</a>.</strong>
            All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 1
    </div>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
        </div>
    <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- ChartJS -->
        <script src="plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="plugins/summernote/summernote-bs4.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard.js"></script>
        <!-- Bootstrap Switch -->
        <script src="../../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>

    </form>
</body>
</html>
