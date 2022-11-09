<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeBehind="Deal.aspx.cs" Inherits="DJResortOnline.Deal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>DJ Resort | Deals</title>
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
    <link href="Deal.css" rel="stylesheet">

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-PR5BJJ2ZBN"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-PR5BJJ2ZBN');
    </script>

    <style>
        /* .container{
            display:flow
        }

        .card{
            margin: 10px
        }*/

        .card-hover {
            box-shadow: -1px 9px 40px -12px #808080;
        }
    </style>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center justify-content-between">

                <div class="logo">
                    <h1><a href="Deal.aspx">DJ RESORT</a></h1>
                </div>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto" href="Front.aspx">Home</a></li>
                        <li><a class="nav-link scrollto" href="Front.aspx#about">About</a></li>
                        <li><a class="nav-link scrollto active" href="Deal.aspx">Deals</a></li>
                        <li><a class="nav-link scrollto" href="Facilities.aspx">Facilities</a></li>
                        <li><a class="nav-link scrollto" href="Front.aspx#contact">Contact Us</a></li>
                        <li><a class="getstarted scrollto" href="AddReservation.aspx">Reserve Now</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->

            </div>
        </header>
        <!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content">
                        <h1 data-aos="fade-up">Spend your time with your family and friends in fun and  affordable way!</h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Hero -->

        <main id="main">

            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                         <%--<div class="card" style="width: 20rem;">--%>
                        <div class="card" style="width: 20em; margin: 10px;">
                            <img src="<%#Eval("Image")%>" class="card-img-top">
                            <div class="card-body">
                                <h4 class="card-title"><%#Eval("Name")%></h4>
                                <strong>
                                    <h5 class="card-title">PHP&nbsp;<%#Eval("Price")%></h5>
                                </strong>
                                <p class="card-text"><%#Eval("Description")%></p>
                                <%--<a href="#" class="btn btn-primary">View More</a>--%>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container d-md-flex py-4">

                <div class="me-md-auto text-center text-md-start">

                    <div class="copyright">

                        <img src="image/footer-logo.png" style="height: 111px" />

                        &copy; Copyright <strong><span>DJ Resort</span></strong>. All Rights Reserved
                    </div>
                </div>
                <div class="social-links text-center text-md-right pt-3 pt-md-0">
                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
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

        <script type="text/javascript" src="Content/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $('.card').hover(
                function () {
                    $(this).animate({
                        marginTop: "-=1%",
                        marginBottom: "+=1%"
                    }, 200)
                },
                function () {
                    $(this).animate({
                        marginTop: "+=1%",
                        marginBottom: "-=1%"
                    })
                }
            )
        </script>
    </form>
</body>
</html>
