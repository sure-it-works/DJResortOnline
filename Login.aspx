<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DJResortOnline.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DJ Resort | Log in</title>

     <!-- Favicons -->
    <link href="image/logo.png" rel="icon">

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    

</head>
<body class="hold-transition login-page">
    <style>
        .login-page {
            background-image: url("image/Login.jpg");
            background-size: 100%;
        }
    </style>
    <form runat="server">
        <div class="login-box">

            <!-- /.login-logo -->
            <div class="card" style="border-radius: 10%">
                <div class="card-body login-card-body" style="border-radius: 10%">
                    <div class="login-logo">
                        <a href="~/"><b>DJ</b>Resort</a>
                    </div>
                    <form action="~/" method="post">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Username" id="Username" runat="server" />
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Password" id="Password" runat="server" />
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div>
                                    <a></a>
                                </div>
                            </div>
                            <div class="col-4">
                                <%--<button type="submit" class="btn btn-success btn-block">Log In</button>--%>
                                <asp:Button ID="btnLogin" runat="server" Text="Log In" class="btn btn-success btn-block" OnClick="btnLogin_Click" />
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <p class="mb-1">
                        <a></a>
                    </p>
                    <p class="mb-1">
                        <a href="ResetPassword.aspx">I forgot my password</a>
                    </p>

                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

    </form>

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
    
</body>
</html>
