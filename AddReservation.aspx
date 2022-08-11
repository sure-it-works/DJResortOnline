<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReservation.aspx.cs" Inherits="DJResortOnline.AddReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>DJ Resort | Reserve Now</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="image/logo.png" rel="icon">
    <link href="image/logo.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: Vesperr - v4.8.1
  * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
    <form runat="server">
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center justify-content-between">

                <div class="logo">
                    <h1><a href="Deals.aspx">DJ RESORT</a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
                </div>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                        <li><a class="nav-link scrollto" href="#about">About</a></li>
                        <li><a class="nav-link scrollto" href="Deals.aspx">Deals</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>
                        <li><a class="nav-link scrollto" href="#team">Facilities</a></li>
                        <li><a class="nav-link scrollto" href="#pricing">Contact Us</a></li>
                        <li><a class="getstarted scrollto" disabled="disabled">Reserve Now</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->

            </div>
        </header>
        <!-- End Header -->

        <main id="main">

            <!-- ======= Pricing Section ======= -->
            <section id="pricing" class="pricing" style="margin: 30px 30px 0px 30px" >
                <div class="container">

                    <div class="row">

                        <div class="col-lg-12 col-md-6 mt-4 mt-md-0">
                            <div class="box recommended" data-aos="zoom-in" data-aos-delay="50">
                                <h4>Reservation Form</h4>
                                <div>
                                    <div>
                                        <%--1st Row--%>

                                        <%--2nd Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" id="txtName" class="form-control" placeholder="Name" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <%--3rdRow--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-8">
                                                    <input type="email" id="txtEmail" class="form-control" placeholder="Email" runat="server" />
                                                </div>
                                                <div class="col-4">

                                                    <input type="text" id="txtContact" class="form-control" placeholder="Contact Number" runat="server" />
                                                </div>
                                            </div>

                                        </div>

                                        <%--4th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-2">
                                                    <label for="inputStatus" style="text-align:left"><strong>Check-In</strong></label>
                                                </div>
                                                <div class="col-4">
                                                    <%--<div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                <input id="txtCheckIn" type="text" class="form-control datetimepicker-input" data-target="#reservationdate" runat="server" />
                                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>--%>
                                                    <%--<asp:TextBox ID="txtCheckIn" class="form-control form-control-sm txtDateFrom" runat="server" placeholder="Enter value.."></asp:TextBox>--%>
                                                    <div class="input-group date" data-target-input="nearest">
                                                        <input id="txtCheckIn" type="text" class="form-control datetimepicker-input" runat="server" />
                                                        <div class="input-group-append">
                                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <label for="inputStatus" style="text-align:left"><strong>Check-Out</strong></label>
                                                </div>
                                                <div class="col-4">
                                                    <div class="input-group date" id="CheckOut" data-target-input="nearest">
                                                        <input id="txtCheckOut" type="text" class="form-control datetimepicker-input" data-target="#reservationdate" runat="server" />
                                                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--5th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-4">
                                                    <asp:DropDownList ID="ddlDeals" runat="server" class="form-control custom-select" OnSelectedIndexChanged="ddlDeals_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>

                                                <div class="col-3">
                                                    <label for="inputStatus" style="text-align:left"><strong>No. of Adults: </strong></label>
                                                </div>
                                                <div class="col-1">
                                                    <input type="number" id="txtAdults" class="form-control" value="" runat="server" min="0" />
                                                </div>
                                                <div class="col-3">
                                                    <label for="inputStatus"  style="text-align:left"><strong>No. of Kids: </strong></label>
                                                </div>
                                                <div class="col-1">
                                                    <input type="number" id="txtKids" class="form-control" value="" runat="server" min="0" />
                                                </div>
                                            </div>
                                        </div>

                                        <%--6th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-2">
                                                    <label for="inputStatus"  style="text-align:left"><strong>Total Amount:  ₱</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input type="text" id="txtTotal" class="form-control" value="" disabled="disabled" runat="server" />
                                                </div>

                                                <div class="col-2">
                                                    <label for="inputStatus"  style="text-align:left"><strong>Reservation Fee:  ₱</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input type="text" id="txtReservation" class="form-control" value="" disabled="disabled" runat="server" />
                                                </div>

                                                <div class="col-2">
                                                    <label for="inputStatus"  style="text-align:left"><strong>Remaining Balance:  ₱</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input runat="server" type="text" id="txtBalance" class="form-control" value="" disabled="disabled" />
                                                </div>
                                            </div>
                                        </div>

                                        <%--7th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-6">
                                                <textarea id="txtNotes" class="form-control" rows="6" placeholder="Notes" runat="server"></textarea>
                                                </div>
                                                <div class="col-6">
                                                    <label><strong>SCAN THIS GCASH QR CODE FOR PAYMENT</strong></label>
                                                    <img src="image/Reservation/QR.jpg"  alt="" width="250" />
                                                    <label>Please input your Gcash payment Ref. No. below</label>
                                                    <input runat="server" type="text" id="txtTransactionNo" class="form-control" value="" placeholder="Gcash Reference No" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="padding: 10px">
                                        <asp:Button ID="btnPayment" CssClass="btn btn-primary" runat="server" Text="Add Reservation" style="float: right"/>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                </div>
            </section>
            <!-- End Pricing Section -->



        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-lg-6 text-lg-left text-center">
                        <div class="copyright">
                            &copy; Copyright <strong>DJ Resort</strong>. All Rights Reserved
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="footer-links text-lg-right text-center pt-2 pt-lg-0">
                            <a href="#intro" class="scrollto">Home</a>
                            <a href="#about" class="scrollto">About</a>
                            <a href="#">Privacy Policy</a>
                            <a href="#">Terms of Use</a>
                        </nav>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
