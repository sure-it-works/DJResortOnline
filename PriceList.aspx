<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PriceList.aspx.cs" Inherits="DJResortOnline.PriceList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DJ Resort | Price List</title>
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

    <link rel="stylesheet" href="PriceList.css" />

    
     <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="Content/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" language="javascript">
        $(".imgAdd").click(function () {
            $(this)
                .closest(".row")
                .find(".imgAdd")
                .before(
                    '<div class="imgUp">< div class= "imagePreview" ></div ><label class="btn btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px; height: 0px; overflow: hidden;" /></label><i class="fa fa-times del"></i></div>'
                );
        });
        $(document).on("click", "i.del", function () {
            $(this).parent().remove();
        });
        $(function () {
            $(document).on("change", ".uploadFile", function () {
                var uploadFile = $(this);
                var files = !!this.files ? this.files : [];
                if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

                if (/^image/.test(files[0].type)) {
                    // only image file
                    var reader = new FileReader(); // instance of the FileReader
                    reader.readAsDataURL(files[0]); // read the local file

                    reader.onloadend = function () {
                        // set image data as background of div
                        //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
                        uploadFile
                            .closest(".imgUp")
                            .find(".imagePreview")
                            .css("background-image", "url(" + this.result + ")");
                    };
                }
            });
        });

    </script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="index3.html" class="nav-link">DJ Resort</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <!-- Logout Menu -->
                <li class="nav-item dropdown">
                    <a href="Login.aspx" class="breadcrumb-item">Log Out 
                        <i class="fas fa-power-off"></i>
                    </a>
                </li>

            </ul>

        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="~/" class="brand-link">
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
                            <h1 class="m-0">Price List</h1>
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
                <div class="card card-solid">
                    <div class="card-body pb-0">
                        <div class="row d-flex align-items-stretch">
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header">
                                        <%--<img src="image/Deals/CoupleRoom.jpg" height="150" />--%>
                                        
                                            <div class="imgUp">
                                                <div class="imagePreview"></div>
                                                <label class="btn btn-upload">
                                                    Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px; height: 0px; overflow: hidden;" />
                                                </label>
                                            </div>
                                            <i class="fa fa-plus imgAdd"></i>

                                        <%--https://codepen.io/MR_RooT/pen/RwPErrB--%>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input placeholder="Deals Name" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <textarea id="txtNotesEdit" class="form-control" rows="4" placeholder="Description" runat="server"></textarea>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-eye"></i>View
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-pen"></i>Edit
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user2-160x160.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user2-160x160.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-header text-muted border-bottom-0">
                                        Digital Strategist
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <h2 class="lead"><b>Nicole Pearson</b></h2>
                                                <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                                </ul>
                                            </div>
                                            <div class="col-5 text-center">
                                                <img src="../../dist/img/user2-160x160.jpg" alt="user-avatar" class="img-circle img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="text-right">
                                            <a href="#" class="btn btn-sm bg-teal">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-user"></i>View Profile
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <nav aria-label="Contacts Page Navigation">
                            <ul class="pagination justify-content-center m-0">
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- /.card-footer -->
                </div>
                <!-- /.card -->

            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->


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



</body>
</html>
