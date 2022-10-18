<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facilities.aspx.cs" Inherits="DJResortOnline.Facilities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>DJ Resort | Facilities</title>
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
    <link href="Facilities.css" rel="stylesheet"/>
</head>
<body>
     <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>

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
                        <li><a class="nav-link scrollto active" href="Front.aspx">Home</a></li>
                        <li><a class="nav-link scrollto" href="#about">About</a></li>
                        <li><a class="nav-link scrollto" href="Deals.aspx">Deals</a></li>
                        <li><a class="nav-link scrollto" href="#team">Facilities</a></li>
                        <li><a class="nav-link scrollto" href="#contact">Contact Us</a></li>
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
                <div class="video-box d-flex justify-content-center align-items-stretch position-relative">
            <a href="image/Facilities/0Unofficial Video.mp4" class="glightbox play-btn mb-4"></a>
          </div>
            </div>
        </section>
        <!-- End Hero -->

        <main id="main">

            <!-- ======= Portfolio Section ======= -->
        <section id="portfolio" class="portfolio" style="padding: 20px;">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
          <h2>Ameneties and Facilities</h2>
        </div>

                <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="400">

                    <div class="col-lg-3 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="image/Facilities/1Canteen.bmp" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Canteen</h4>
                                <p>Canteen Description</p>
                                <div class="portfolio-links">
                                    <a href="image/Facilities/1Canteen.bmp" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                                    <a href="~/" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="image/Facilities/2Standee.JPG" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Standee</h4>
                                <p>Standee Description</p>
                                <div class="portfolio-links">
                                    <a href="image/Facilities/2Standee.JPG" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                                    <a href="~/" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="image/Facilities/3Garden.JPG" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Garden</h4>
                                <p>Garden Description</p>
                                <div class="portfolio-links">
                                    <a href="image/Facilities/3Garden.JPG" data-gallery="portfolioGallery" class="portfolio-lightbox"><i class="bx bx-plus"></i></a>
                                    <a href="~/" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 portfolio-item filter-card">
                        <div class="portfolio-wrap">
                            <img src="image/Facilities/5Comfort Room.jpg" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Comfort Room</h4>
                                <p>Comfort Room Description</p>
                                <div class="portfolio-links">
                                    <a href="image/Facilities/5Comfort Room.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                                    <a href="~/" title="More Details"><i class="bx bx-link"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
        <!-- End Portfolio Section -->

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
    </form>
</body>
</html>
