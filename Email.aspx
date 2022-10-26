<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="DJResortOnline.Emails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DJ Resort | Email</title>
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

    <%-- Templates/AdminLTE-3.1.0-rc/pages/examples/project-add.html--%>
    <style>
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modalPopup {
            background-color: whitesmoke;
            border-width: 2px;
            border-style: solid;
            border-color: dodgerblue;
            padding: 10px;
            width: 70vw;
            border-radius: 5px;
        }

        .btnCloseModal {
            float: right;
        }

        .modal-body {
            clear: right;
        }

        .check-all {
            margin-left: 7px;
            margin-right: 5px;
        }

        .email-body {
            text-indent: 40px;
            text-align: justify;
        }
    </style>
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
                                <h1 class="m-0">Email & Feedbacks</h1>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-3">
                            <a href="compose.html" class="btn btn-primary btn-block mb-3">Compose</a>

                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Folders</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <ul class="nav nav-pills flex-column">
                                        <li class="nav-item active">
                                            <a href="#" class="nav-link">
                                                <i class="fas fa-inbox"></i>Inbox
                    <%--<span class="badge bg-primary float-right"><%= _mailCount %></span>--%>
                                            </a>
                                        </li>
                                        <%-- <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-envelope"></i>Sent
                                        </a>
                                    </li>--%>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->

                        </div>
                        <!-- /.col -->
                        <div class="col-md-9">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">Inbox</h3>

                                    <div class="card-tools">
                                        <div class="input-group input-group-sm">

                                            <div style="display: flex">
                                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Email"></asp:TextBox>
                                                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="SearchEmailButtonClicked">
                                                    <i class="fas fa-search"></i>
                                                </asp:LinkButton>
                                            </div>
                                            <%--<input type="text" class="form-control" placeholder="Search Mail" />
                                            <div class="input-group-append">
                                                <div class="btn btn-primary">
                                                    <i class="fas fa-search"></i>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                    <div class="mailbox-controls">
                                        <!-- Check all button -->
                                        <%--<button type="button" class="btn btn-default btn-sm checkbox-toggle">
                                        <i class="far fa-square"></i>
                                    </button>--%>
                                        <asp:CheckBox ID="CheckBox2" runat="server" CssClass="check-all" OnCheckedChanged="CheckAll" AutoPostBack="true" />
                                        <div class="btn-group">
                                            <%--                                            <asp:LinkButton ID="Button1" runat="server" Text="Button" CssClass="btn btn-default btn-sm">
                                                <i class="far fa-trash-alt"></i>
                                            </asp:LinkButton>--%>
                                            <%--                                            <button type="button" class="btn btn-default btn-sm">
                                                <i class="far fa-trash-alt"></i>
                                            </button>--%>
                                            <%--                                            <button type="button" class="btn btn-default btn-sm">
                                                <i class="fas fa-reply"></i>
                                            </button>
                                            <button type="button" class="btn btn-default btn-sm">
                                                <i class="fas fa-share"></i>
                                            </button>--%>
                                        </div>
                                        <!-- /.btn-group -->
                                        <%-- <button type="button" class="btn btn-default btn-sm">
                                        <i class="fas fa-sync-alt"></i>
                                    </button>
                                    <div class="float-right">
                                        1-50/200
                  <div class="btn-group">
                      <button type="button" class="btn btn-default btn-sm">
                          <i class="fas fa-chevron-left"></i>
                      </button>
                      <button type="button" class="btn btn-default btn-sm">
                          <i class="fas fa-chevron-right"></i>
                      </button>
                  </div>--%>
                                        <!-- /.btn-group -->
                                    </div>
                                    <!-- /.float-right -->
                                </div>
                                <div class="table-responsive mailbox-messages">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>
                                    <asp:GridView ID="GridView1" runat="server" class="table table-hover table-striped"
                                        BorderStyle="None"
                                        OnRowDataBound="gridView1_RowDataBound"
                                        AutoGenerateColumns="False"
                                        ShowHeader="False">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-CssClass="form-check-label">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sender">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbSender" runat="server" Text='<%# Bind("Sender") %>' CommandArgument='<%# Bind("Id") %>' OnCommand="SenderLinkClicked"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                            <asp:BoundField DataField="ReceivedDate" HeaderText="ReceivedDate" ControlStyle-Font-Bold="true" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <ajaxtoolkit:modalpopupextender id="ModalPopupExtender1" runat="server" targetcontrolid="HiddenField1" popupcontrolid="Panel1" backgroundcssclass="modalBackground">
                                    </ajaxtoolkit:modalpopupextender>
                                    <asp:Panel ID="Panel1" CssClass="modalPopup" runat="server">
                                        <div class="modal-body">
                                            <div style="margin-block: 10px">
                                                <span><strong>FROM: </strong></span>
                                                <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div style="margin-block: 10px">
                                                <span><strong>TITLE: </strong></span>
                                                <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="email-body">
                                                <asp:Label ID="lblBody" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div style="float: right">
                                                <asp:Button ID="btnReply" runat="server" Text="Reply" CssClass="btn btn-primary btn-sm" OnClick="ReplyButtonClicked" />
                                                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="CloseModalButtonClicked" CssClass="btn btn-danger btn-sm" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <ajaxtoolkit:modalpopupextender id="ModalPopupExtender2" runat="server" targetcontrolid="HiddenField2" popupcontrolid="Panel2" backgroundcssclass="modalBackground">
                                    </ajaxtoolkit:modalpopupextender>
                                    <asp:Panel ID="Panel2" CssClass="modalPopup" runat="server">
                                        <div class="modal-body">
                                            <div style="margin-block: 10px">
                                                <span><strong>TO: </strong></span>
                                                <asp:Label ID="lblTo" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div style="margin-block: 10px">
                                                <span><strong>TITLE: </strong></span>
                                                <asp:TextBox ID="txtSubject" runat="server" Width="77em" placeholder="Enter title . . ."></asp:TextBox>
                                            </div>
                                            <div class="email-body">
                                                <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Height="25em" Width="78em" placeholder="Enter messsage . . ."></asp:TextBox>
                                            </div>
                                            <div style="float: right">
                                                <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-primary btn-sm" OnClick="SendMessage" />
                                                <asp:Button ID="btnClose1" runat="server" Text="Cancel" OnClick="CancelModalButtonClicked"
                                                    CssClass="btn btn-danger btn-sm" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <%--      </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    <%--<table class="table table-hover table-striped">
                                    <tbody>

                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <div class="icheck-primary">
                                                            <input type="checkbox" value="">
                                                            <label for="check1"></label>
                                                        </div>
                                                    </td>
                                                    <td class="mailbox-name"><a href="read-mail.html"><%# Eval("Sender") %></a></td>
                                                    <td class="mailbox-subject"><%# Eval("Subject") %>
                                                    </td>
                                                    <td class="mailbox-attachment"></td>
                                                    <td class="mailbox-date"><%# Eval("ReceivedDate") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>--%>
                                    <!-- /.table -->
                                </div>
                                <!-- /.mail-box-messages -->
                            </div>
                            <!-- /.card-body -->
                            <%-- <div class="card-footer p-0">
                                <div class="mailbox-controls">
                                    <!-- Check all button -->
                                    <button type="button" class="btn btn-default btn-sm checkbox-toggle">
                                        <i class="far fa-square"></i>
                                    </button>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm">
                                            <i class="far fa-trash-alt"></i>
                                        </button>
                                        <button type="button" class="btn btn-default btn-sm">
                                            <i class="fas fa-reply"></i>
                                        </button>
                                        <button type="button" class="btn btn-default btn-sm">
                                            <i class="fas fa-share"></i>
                                        </button>
                                    </div>
                                    <!-- /.btn-group -->
                                    <button type="button" class="btn btn-default btn-sm">
                                        <i class="fas fa-sync-alt"></i>
                                    </button>
                                    <div class="float-right">
                                        1-50/200
                  <div class="btn-group">
                      <button type="button" class="btn btn-default btn-sm">
                          <i class="fas fa-chevron-left"></i>
                      </button>
                      <button type="button" class="btn btn-default btn-sm">
                          <i class="fas fa-chevron-right"></i>
                      </button>
                  </div>
                                        <!-- /.btn-group -->
                                    </div>
                                    <!-- /.float-right -->
                                </div>
                            </div>
                        </div>--%>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
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
    </form>
</body>
</html>
