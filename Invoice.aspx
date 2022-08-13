<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="DJResortOnline.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DJ Resort | Invoice</title>
     <!-- Favicons -->
    <link href="image/logo.png" rel="icon">

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

    <!-- daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css" />

    <%--     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--%>
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
                        <a href="Deals.aspx" class="nav-link">DJ Resort</a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-auto">
                <!-- Logout Menu -->
                <li class="nav-item dropdown">
                    <a  href="Login.aspx" class="breadcrumb-item">
                        Log Out 
                        <i class="fas fa-power-off"></i>
                    </a>
                </li>

            </ul>

            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="Deals.aspx" class="brand-link">
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
                            <a href="Deals.aspx" class="d-block">Admin User</a>
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
                                <h1 class="m-0">Invoice</h1>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="card">

                        <div class="card-body p-0">

                            <asp:GridView ID="gvInvoice" runat="server" class="table table-striped projects"
                                AutoGenerateColumns="false" AllowPaging="true"
                                PageSize="10" GridLines="None" EditRowStyle-VerticalAlign="Middle" OnRowCommand="gvInvoice_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" ItemStyle-Width="1%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblResID" runat="server" Text='<%# Eval("ReservationID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField ItemStyle-Width="25%" DataField="TransactionNo" HeaderText="Transaction No" />
                                    <asp:BoundField ItemStyle-Width="20%" DataField="Name" HeaderText="Name" />
                                     <asp:BoundField ItemStyle-Width="14%" DataField="Email" HeaderText="Email" />
                                    <asp:BoundField ItemStyle-Width="10%" DataField="CheckIn" HeaderText="Check In" />
                                    <asp:BoundField ItemStyle-Width="10%" DataField="CheckOut" HeaderText="Check Out" />
                                    <asp:BoundField ItemStyle-Width="10%" DataField="TotalPayment" HeaderText="Total Payment" />
                                    
                                    <asp:TemplateField ItemStyle-Width="10%" ShowHeader="False">
                                        <ItemTemplate>
                                            <%--<asp:LinkButton ID="Print" runat="server" CssClass="btn btn-info btn-sm" type="button"
                                                CommandArgument="<%# Container.DataItemIndex %>"
                                                CommandName="Touch"><i class="fas fas fa-print"></i></asp:LinkButton>--%>
                                            <asp:HyperLink ID="lnkSelect" runat='server' CssClass="btn btn-info btn-sm" type="button"
                                                NavigateUrl='<%# String.Format("~/PrintInvoice.aspx?ID={0}", Eval("ReservationID")) %>'><i class="fas fas fa-print"></i></asp:HyperLink>
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
                <!-- /.content -->
                <%--</div>--%>
                <!-- /.content-wrapper -->

               


                <%--modal-edit--%>
                <div class="modal fade" id="modalEdit">
                    <div class="modal-dialog">
                        <div class="modal-content" style="width: 830px">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Reservation Details</strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <%--1st Row--%>
                                <div class="form-group">
                                    <div class="row" style="padding-bottom: 0px;">
                                        <div class="col-8">
                                            <asp:Label ID="lblTransactionNoEdit" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                        </div>
                                        <div class="col-4">
                                            <asp:Label ID="lblReservationEdit" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
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
                                        <div class="col-8">
                                            <input type="email" id="txtEmailEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                        <div class="col-4">

                                            <input type="text" id="txtContactEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                    </div>

                                </div>

                                <%--4th Row--%>
                                <div class="form-group">
                                    <div class="row" style="padding-bottom: 0px;">
                                        <div class="col-6">
                                            <label for="inputDescription">Check-In</label>
                                        </div>
                                        <div class="col-6">
                                            <label for="inputDescription">Check-Out</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="input-group date" data-target-input="nearest">
                                                <input id="txtCheckInEdit" type="text" class="form-control datetimepicker-input" data-target="#reservationdate" runat="server" disabled="disabled"/>
                                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-6">
                                            <div class="input-group date" data-target-input="nearest">
                                                <input id="txtCheckOutEdit" type="text" class="form-control datetimepicker-input" data-target="#reservationdate" runat="server" disabled="disabled" />
                                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--5th Row--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-4">
                                            <asp:DropDownList ID="ddlEditDeals" runat="server" class="form-control" Enabled="false"></asp:DropDownList>
                                        </div>

                                        <div class="col-3">
                                            <label for="inputStatus">No. of Adults: </label>
                                        </div>
                                        <div class="col-1">
                                            <input type="number" id="txtAdultsEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                        <div class="col-3">
                                            <label for="inputStatus">No. of Kids: </label>
                                        </div>
                                        <div class="col-1">
                                            <input type="number" id="txtKidsEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                    </div>
                                </div>

                                <%--6th Row--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-2">
                                            <label for="inputStatus">Total Amount:  ₱</label>
                                        </div>
                                        <div class="col-2">
                                            <input type="text" id="txtTotalEdit" class="form-control" runat="server"  disabled="disabled" />
                                        </div>

                                        <div class="col-2">
                                            <label for="inputStatus">Reservation Fee:  ₱</label>
                                        </div>
                                        <div class="col-2">
                                            <input type="text" id="txtReservationEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>

                                        <div class="col-2">
                                            <label for="inputStatus">Remaining Balance:  ₱</label>
                                        </div>
                                        <div class="col-2">
                                            <input runat="server" type="text" id="txtBalanceEdit" class="form-control" disabled="disabled"  />
                                        </div>
                                    </div>
                                </div>

                                <%--7th Row--%>
                                <div class="form-group">
                                    <label>Note</label>
                                    <textarea id="txtNotesEdit" class="form-control" rows="4" runat="server" disabled="disabled"></textarea>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" style="float: right">Close</button>
                                <%--<button type="button" class="btn btn-primary" onclick="UpdateResDetails">Save changes</button>--%>
                                <asp:Button ID="btnConfirm" CssClass="btn btn-primary" runat="server" Text="Confirm Reservation" />
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                </div>


                <footer class="main-footer">
                    <strong>Copyright &copy; 2022 <a href="~/">DJ Resort</a>.</strong>
                    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 1
    </div>
                </footer>

              <%--  <!-- Control Sidebar -->
                <aside class="control-sidebar control-sidebar-dark">
                    <!-- Control sidebar content goes here -->
                </aside>
                <!-- /.control-sidebar -->--%>
            </div>
            <!-- ./wrapper -->

            <!-- jQuery -->
            <%--<script src="plugins/jquery/jquery.min.js"></script>--%>
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
            <%--<script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>--%>
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
            <%--<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard.js"></script>--%>



            <!-- date-range-picker -->
            <%--<script src="plugins/daterangepicker/daterangepicker.js"></script>--%>

            <%--<script>
            $(function () {
                //Date range picker
                $('#reservationdate').datetimepicker({
                    format: 'L'
                });

                //Date range picker
                $('#reservation').daterangepicker()
                //Date range picker with time picker
                $('#reservationtime').daterangepicker({
                    timePicker: true,
                    timePickerIncrement: 30,
                    locale: {
                        format: 'MM/DD/YYYY hh:mm A'
                    }
                })

            })
        </script>--%>

          

            <script type='text/javascript'>
                function myModalEdit() {
                    $('[id*=modalEdit]').modal('show');
                }
            </script>

            <script type='text/javascript'>
                jQuery(document).ready(function () {
                    var myChart;
                    var a;
                    var checkin = $("#txtCheckIn");
                    var checkout = $("#txtCheckOut");

                    //Makes txtDateFrom a datepicker
                    checkin.flatpickr({
                        dateFormat: "m-d-Y",
                        theme: "dark"
                    });
                    //Makes txtDateTo a datepicker
                    checkout.flatpickr({
                        dateFormat: "m-d-Y",
                        theme: "dark"
                    });
                }
            </script>
    </form>

</body>
</html>
