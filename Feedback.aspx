<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="DJResortOnline.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DJ Resort | Feedbacks</title>
    <!-- Favicons -->
    <link href="image/logo.png" rel="icon"/>

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


     <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="Content/jquery-3.6.0.min.js"></script>
    
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
                <img src="image/dashboard.png" alt="DJ Resort Logo" class="brand-image img-circle elevation-3"/>
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
                            <h1 class="m-0">Feedbacks</h1>
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

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-12">

                                            <!-- small box -->
                                            <div class="small-box" style="text-align: center">
                                                <div class="inner">
                                                    <h1 id="FeedbackRatings" runat="server" style="font-size: 100px">4.4</h1>
                                                    <p>out of 5</p>
                                                    <p>
                                                        <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                        <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                        <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                        <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                        <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                    </p>
                                                </div>
                                                <a class="small-box-footer bg-success">Based on <i id="TotalReviewNo" runat="server">23</i> ratings</a>
                                            </div>

                                        </div>
                                        <!-- /.col -->
                                       <%-- <div class="col-md-6">
                                            <p class="text-center">
                                                <strong>Ratings & Reviews</strong>
                                            </p>

                                            <div class="progress-group">
                                                5 Stars
                                                  <span class="float-right">
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                  </span>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-primary" style="width: 80%"></div>
                                                </div>
                                            </div>

                                            <div class="progress-group">
                                                4 Stars
                                                  <span class="float-right">
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                  </span>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-danger" style="width: 75%"></div>
                                                </div>
                                            </div>

                                            <div class="progress-group">
                                                <span class="progress-text">3 Stars
                                                </span>
                                                <span class="float-right">
                                                    <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                    <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                    <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                    <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                    <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                </span>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-success" style="width: 60%"></div>
                                                </div>
                                            </div>

                                            <div class="progress-group">
                                                2 STARS
                                                  <span class="float-right">
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                  </span>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-warning" style="width: 50%"></div>
                                                </div>
                                            </div>

                                            <div class="progress-group">
                                                1 STAR
                                                  <span class="float-right">
                                                      <i class="nav-icon fas fa fa-star" style="color: #ffc107"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                      <i class="nav-icon fas fa fa-star" style="color: moccasin"></i>
                                                  </span>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-warning" style="width: 30%"></div>
                                                </div>
                                            </div>


                                        </div>--%>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- ./card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->


                </div>
                <!-- /.container-fluid -->
            </section>

            <section class="content">
                <!-- Default box -->
                    <div class="card">
                        <div class="card-body p-0">
                            <asp:GridView ID="gvFeedbacks" runat="server" class="table table-striped projects"
                                AutoGenerateColumns="false" AllowPaging="true"
                                PageSize="10" GridLines="None" EditRowStyle-VerticalAlign="Middle" OnRowCommand="gvFeedbacks_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" ItemStyle-Width="1%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFdbckID" runat="server" Text='<%# Eval("FeedbackID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField ItemStyle-Width="10%" DataField="Name" HeaderText="Name" />
                                     <asp:BoundField ItemStyle-Width="14%" DataField="Email" HeaderText="Email" />
                                    <asp:BoundField ItemStyle-Width="10%" DataField="CreatedDate" HeaderText="Posted Date" />
                                    <asp:BoundField ItemStyle-Width="30%" DataField="FeedbackDetails" HeaderText="Feedback" />
                                    <asp:BoundField ItemStyle-Width="15%" DataField="FeedbackStars" HeaderText="Feedback Stars" />

<%--                                    <asp:TemplateField ItemStyle-Width="15%" HeaderText="Feedback Stars">
                                        <ItemTemplate>
                                            <label runat="server" id="StarRating">Stars<i class="fas fa-star" style="color: #ffc107"></i></label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    
                                    <asp:TemplateField ItemStyle-Width="8%" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="View" runat="server" CssClass="btn btn-primary btn-sm" type="button"
                                                CommandArgument="<%# Container.DataItemIndex %>"
                                                CommandName="View"><i class="fas fa-eye"> View</i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

         <%--modal-edit--%>
                <div class="modal fade" id="modalFeedback">
                    <div class="modal-dialog">
                        <div class="modal-content" style="width: 830px">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Feedback Details</strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <%--1st Row--%>
                                <div class="form-group">
                                    <div class="row" style="padding-bottom: 0px;">
                                        <div class="col-7">
                                            <asp:Label ID="lblSpace" runat="server" Font-Bold="True" Font-Size="Large" Visible="false"></asp:Label>
                                        </div>
                                        <div class="col-1">
                                            <asp:Label ID="lblStars" runat="server" Font-Bold="True" Font-Size="Large">&nbsp;Stars<i class="fas fa-star" style="color: #ffc107"></i></asp:Label>
                                        </div>
                                        <div class="col-4">
                                            <label style="font-weight: bold; font-size: large">&nbsp;Stars<i class="fas fa-star" style="color: #ffc107"></i></label>
                                        </div>
                                    </div>
                                </div>

                                <%--1st Row--%>
                                <div class="form-group">
                                    <div class="row" style="padding-bottom: 0px;">
                                        <div class="col-7">
                                            <asp:Label ID="lblSpace1" runat="server" Font-Bold="True" Font-Size="Large" Visible="false"></asp:Label>
                                        </div>
                                        <div class="col-5">
                                            <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <%--2nd Row--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="text" id="txtNameEdit" class="form-control" runat="server" disabled="disabled" />
                                        </div>
                                    </div>
                                </div>

                                <%--3rdRow--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-7">
                                            <input type="email" id="txtEmailEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                        <div class="col-5">

                                            <input type="text" id="txtContactEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                    </div>

                                </div>

                                <%--4th Row--%>
                                <div class="form-group">
                                    <label>Note</label>
                                    <textarea id="txtNotesEdit" class="form-control" rows="4" runat="server" disabled="disabled"></textarea>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" style="float: right">Back</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


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

        <script type='text/javascript'>
            function myModalFeedback() {
                $('[id*=modalFeedback]').modal('show');
            }
        </script>
</form>
</body>
</html>
