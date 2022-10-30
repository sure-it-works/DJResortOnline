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



    <!-- CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <script type="text/javascript" src="Content/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
      

</head>

<body>
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center justify-content-between">

                <div class="logo">
                    <h1><a href="Deal.aspx">DJ RESORT</a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
                </div>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto" href="Front.aspx">Home</a></li>
                        <li><a class="nav-link scrollto" href="Front.aspx#about">About</a></li>
                        <li><a class="nav-link scrollto" href="Deal.aspx">Deals</a></li>
                        <li><a class="nav-link scrollto" href="Facilities.aspx">Facilities</a></li>
                        <li><a class="nav-link scrollto" href="Front.aspx#contact">Contact Us</a></li>
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
            <section id="pricing" class="pricing" style="margin: 30px 30px 0px 30px">
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
                                                    <input required="required" type="text" id="txtName" class="form-control" placeholder="Name" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <%--3rdRow--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-8">
                                                    <input type="email" id="txtEmail" class="form-control" placeholder="Email" runat="server" required="required" />
                                                </div>
                                                <div class="col-4">

                                                    <input type="text" id="txtContact" class="form-control" placeholder="Contact Number" runat="server" required="required" />
                                                </div>
                                            </div>

                                        </div>

                                        <%--4th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-4">
                                                    <asp:DropDownList ID="ddlDeals" runat="server" class="form-control custom-select" OnSelectedIndexChanged="ddlDeals_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                                <div class="col-2">
                                                    <label style="text-align: left"><strong>Check-In</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input id="txtCheckIn" type="date" class="form-control" runat="server" />
                                                </div>
                                                <div class="col-2">
                                                    <label style="text-align: left"><strong>Check-Out</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input id="txtCheckOut" type="date" class="form-control" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <%--5th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-1">
                                                    <label for="inputStatus" style="text-align: left"><strong>No. of Adults: </strong></label>
                                                </div>
                                                <div class="col-1">
                                                    <input type="number" id="txtAdults" class="form-control" value="" runat="server" min="0" required="required" />
                                                </div>
                                                <div class="col-1">
                                                    <label for="inputStatus" style="text-align: left"><strong>No. of Kids: </strong></label>
                                                </div>
                                                <div class="col-1">
                                                    <input type="number" id="txtKids" class="form-control" value="" runat="server" min="0" required="required" />
                                                </div>
                                                <div class="col-2">
                                                    <label for="inputStatus" style="text-align: left"><strong>Total Amount:  ₱</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input type="text" id="txtTotal" class="form-control" value="" disabled="disabled" runat="server" required="required" />
                                                </div>

                                                <div class="col-2">
                                                    <label for="inputStatus" style="text-align: left"><strong>Reservation Fee:  ₱</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input type="text" id="txtReservation" class="form-control" value="" disabled="disabled" runat="server" required="required" />
                                                </div>
                                            </div>
                                        </div>

                                        <%--6th Row--%>
                                        <%--<div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                

                                                <div class="col-2">
                                                    <label for="inputStatus" style="text-align: left"><strong>Remaining Balance:  ₱</strong></label>
                                                </div>
                                                <div class="col-2">
                                                    <input runat="server" type="text" id="txtBalance" class="form-control" value="" disabled="disabled" required="required" />
                                                </div>
                                            </div>
                                        </div>--%>

                                        <%--7th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <textarea id="txtNotes" class="form-control" rows="4" placeholder="Notes" runat="server"></textarea>
                                        </div>

                                        <%--8th Row--%>
                                        <div class="form-group" style="padding: 5px">
                                            <div class="row">
                                                <div class="col-8">
                                                    <input runat="server" type="text" id="txtTransactionNo" class="form-control" value="" placeholder="Gcash Reference No" required="required" />
                                                </div>
                                                <div class="col-4">
                                                    <asp:LinkButton ID="lblQR" runat="server" ForeColor="Black" OnClick="lblQR_Click" Font-Size="X-Large"><strong>CLICK HERE FOR PAYMENT</strong></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="padding: 10px">
                                            <asp:Button ID="btnPayment" CssClass="btn btn-primary" runat="server" Text="Add Reservation" Style="float: right" OnClick="btnPayment_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
            </section>
            <!-- End Pricing Section -->

            <%--modal-view--%>
            <div class="modal fade" id="modalQR">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">SCAN THIS GCASH QR CODE FOR PAYMENT</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body" style="align-content: center">
                            <%--1st Row--%>
                            <div class="form-group">
                                <img src="image/Reservation/QR.jpg" alt="" width="250" />
                            </div>

                            <%--2nd Row--%>
                            <div class="form-group">
                                <label>We only accept payment through GCASH!</label>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->



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

        <%--        <script type='text/javascript'>
            function openModal() {
                $('[id*=modalQR]').modal('show');
            }
        </script>--%>

        <!-- jQuery UI 1.11.4 -->
        <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

           <%-- Disable Check in Past Dates--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript">
             
        </script>
        <script type="text/javascript">
            var maxDate = year + '-' + month + '-' + day;
            alert(maxDate);
            $('#txtCheckIn').attr('min', maxDate);


            $(function () {
                var dtToday = new Date();

                var month = dtToday.getMonth() + 1;
                var day = dtToday.getDate();
                var year = dtToday.getFullYear();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();

                var maxDate = year + '-' + month + '-' + day;

                alert(maxDate);
                $('#txtCheckIn').attr('min', maxDate);
            });
        </script>
    </form>
</body>
</html>
