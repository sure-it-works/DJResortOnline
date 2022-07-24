<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="DJResortOnline.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <head>
        <link rel="stylesheet" href="~/Login.css" />
        <style>
            body {
                background-image: url('/image/Login.JPG');
            }
        </style>
    </head>
    <body>

        <div class="container" style="opacity:0.6; border-radius: 10px;">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="150" src="/image/logo.png" />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>Admin Login</h3>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username" style="opacity:unset;"></asp:TextBox>
                                    </div>
                                    
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password" style="opacity:unset;"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" style="opacity:unset" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx"><< Back to Home</a><br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</asp:Content>
