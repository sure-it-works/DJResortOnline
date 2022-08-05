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
                        <li><a class="nav-link scrollto" href="#services">Deals</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>
                        <li><a class="nav-link scrollto" href="#team">Facilities</a></li>
                        <li><a class="nav-link scrollto" href="#pricing">Contact Us</a></li>
                        <li><a class="getstarted scrollto" href="#about">Reserve Now</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->

            </div>
        </header>
        <!-- End Header -->

        <main id="main">
            <!-- ======= Portfolio Section ======= -->
            <section id="portfolio" class="portfolio" style="padding: 20px;">
                <div class="container">

                    <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="400">
                        <div class="modal-header">
                            <h4 class="modal-title">Customer Reservation Details</h4>
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
                                        <input type="text" id="txtNameEdit" class="form-control" runat="server" />
                                    </div>
                                </div>
                            </div>

                            <%--3rdRow--%>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-8">
                                        <input type="email" id="txtEmailEdit" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-4">

                                        <input type="text" id="txtContactEdit" class="form-control" runat="server" />
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
                                            <input id="txtCheckInEdit" type="text" class="form-control datetimepicker-input" data-target="#reservationdate" runat="server" />
                                            <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="input-group date" data-target-input="nearest">
                                            <input id="txtCheckOutEdit" type="text" class="form-control datetimepicker-input" data-target="#reservationdate" runat="server" />
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
                                        <%-- <select id="txtDeals" class="form-control custom-select" >
                                                <option disabled>Select one</option>
                                                <option>On Hold</option>
                                                <option>Canceled</option>
                                                <option selected>Deals</option>
                                            </select>--%>
                                        <asp:DropDownList ID="ddlEditDeals" runat="server" class="form-control custom-select"></asp:DropDownList>
                                    </div>

                                    <div class="col-3">
                                        <label for="inputStatus">No. of Adults: </label>
                                    </div>
                                    <div class="col-1">
                                        <input type="number" id="txtAdultsEdit" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-3">
                                        <label for="inputStatus">No. of Kids: </label>
                                    </div>
                                    <div class="col-1">
                                        <input type="number" id="txtKidsEdit" class="form-control" runat="server" />
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
                                        <input type="text" id="txtTotalEdit" class="form-control" runat="server" />
                                    </div>

                                    <div class="col-2">
                                        <label for="inputStatus">Reservation Fee:  ₱</label>
                                    </div>
                                    <div class="col-2">
                                        <input type="text" id="txtReservationEdit" class="form-control" runat="server" />
                                    </div>

                                    <div class="col-2">
                                        <label for="inputStatus">Remaining Balance:  ₱</label>
                                    </div>
                                    <div class="col-2">
                                        <input runat="server" type="text" id="txtBalanceEdit" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <%--7th Row--%>
                            <div class="form-group">
                                <label>Note</label>
                                <textarea id="txtNotesEdit" class="form-control" rows="4" runat="server"></textarea>
                            </div>

                            <%--8th Row--%>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-8">
                                        <label for="inputDescription" style="visibility: hidden"></label>
                                    </div>
                                    <div class="col-4">
                                        <asp:DropDownList runat="server" ID="ddlEditStatus" class="form-control custom-select"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: right">Close</button>
                            <%--<button type="button" class="btn btn-primary" onclick="UpdateResDetails">Save changes</button>--%>
                            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save Changes" />
                        </div>

                    </div>

                </div>
            </section>
            <!-- End Portfolio Section -->
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
