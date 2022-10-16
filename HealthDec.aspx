<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthDec.aspx.cs" Inherits="DJResortOnline.HealthDec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>DJ Resort | Homepage</title>
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
    <link href="Gallery/assets/css/style.css" rel="stylesheet">
</head>

<body>
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center justify-content-between">

                <div class="logo">
                    <h1><a href="Deals.aspx">DJ</a></h1>
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


        <main id="main">

              <!-- ======= Appointment Section ======= -->
    <section id="appointment" class="appointment section-bg" style="padding-top: 100px;">
      <div class="container">

        <div class="section-title">
          <h2>HEALTH DECLARATION FORM</h2>
        </div>

        <form action="forms/appointment.php" method="post" role="form" class="php-email-form">
          <div class="row">
            <div class="col-md-4 form-group">
              <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
              <div class="validate"></div>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="tel" class="form-control" name="phone" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
          </div>
         
          <div class="form-group mt-3">
            <textarea class="form-control" name="message" rows="5" placeholder="Address"></textarea>
           
          </div>
        </form>

      </div>

         <div class="container">

        <div class="section-title">
          <h2>HEALTH STATUS</h2>
        </div>

        <form action="forms/appointment.php" method="post" role="form" class="php-email-form">
         
         
          <div class="form-group mt-3">
           <p>Are you experiencing? (Nakakaranas ka ba ng?)</p>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbFever" runat="server" Text="Fever for the past few days (lagnat sa nakalipas na mga araw)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Cough/Colds (Ubo/Sipon)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox2" runat="server" Text="CLoss of smell (Pagkawala ng pang-amoy)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox3" runat="server" Text="Shortness of Breath/Difficulty of Breathing (Hirap ng Paghinga)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox4" runat="server" Text="Sore throat (Pananakit ng lalamunan)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox5" runat="server" Text="Body Pains (Pananakit ng katawan)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox6" runat="server" Text="Headache (Pananakit ng ulo)"/>
          </div>

             <div class="form-group mt-3">
           <p>Have you ever had a friend or family member who has COVID-19 symptoms? (Ikaw ba ay may kasama sa bahay na may sintomas ng COVID-19?)</p>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox7" runat="server" Text="Yes"/>
                <asp:CheckBox ID="CheckBox9" runat="server" Text="No"/>
          </div>

             <div class="form-group mt-3">
           <p>Have you had any recent 14-day contact with anybody exhibiting COVID-19 symptoms?</p>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="CheckBox8" runat="server" Text="Yes"/>
                <asp:CheckBox ID="CheckBox10" runat="server" Text="No"/>
          </div>
            
          <div class="text-center"><button type="submit" class="btn btn-primary">Make an Appointment</button></div>
        </form>

      </div>
    </section><!-- End Appointment Section -->

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
