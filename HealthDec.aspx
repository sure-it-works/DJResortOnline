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

        
          <div class="row">
            <div class="col-md-4 form-group">
              <input type="text" name="name" class="form-control" id="name" runat="server" placeholder="Your Name" required="required"/>
              
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" runat="server" id="email" placeholder="Your Email" required="required"/>
             
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="tel" class="form-control" name="phone" runat="server" id="phone" placeholder="Your Phone" required="required"/>
           
            </div>
          </div>
         
          <div class="form-group mt-3">
            <textarea class="form-control" name="message" rows="5" placeholder="Address" id="address" runat="server" required="required"></textarea>
           
          </div>
   

      </div>
        <br />
        <br />
        <br />
         <div class="container">

        <div class="section-title">
          <h2>HEALTH STATUS</h2>
        </div>


          <div class="form-group mt-3">
           <p>Are you experiencing? (Nakakaranas ka ba ng?)</p>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbFever" runat="server" Text="Fever for the past few days (lagnat sa nakalipas na mga araw)" />
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbColds" runat="server" Text="Cough/Colds (Ubo/Sipon)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbSmell" runat="server" Text="Loss of smell (Pagkawala ng pang-amoy)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbBreath" runat="server" Text="Shortness of Breath/Difficulty of Breathing (Hirap ng Paghinga)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbThroat" runat="server" Text="Sore throat (Pananakit ng lalamunan)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbBodyPain" runat="server" Text="Body Pains (Pananakit ng katawan)"/>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbHeadache" runat="server" Text="Headache (Pananakit ng ulo)"/>
          </div>

             <div class="form-group mt-3">
           <p>Have you ever had a friend or family member who has COVID-19 symptoms? (Ikaw ba ay may kasama sa bahay na may sintomas ng COVID-19?)</p>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbY" runat="server" Text="Yes"/>
                <asp:CheckBox ID="cbN" runat="server" Text="No"/>
          </div>

             <div class="form-group mt-3">
           <p>Have you had any recent 14-day contact with anybody exhibiting COVID-19 symptoms?</p>
          </div>

            <div class="form-group mt-3">
                <asp:CheckBox ID="cbYes" runat="server" Text="Yes"/>
                <asp:CheckBox ID="cbNo" runat="server" Text="No"/>
          </div>
            
          <div class="text-center">
              <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
          </div>
      

      </div>
    </section><!-- End Appointment Section -->

        </main>
        <!-- End #main -->


        <%--modal-details--%>
                <div class="modal fade" id="modalDetails">
                    <div class="modal-dialog">
                        <div class="modal-content" style="width: 830px">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Health Declaration Details</strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <%--1st Row--%>
                                <div class="form-group">
                                    <div class="row" style="padding-bottom: 0px;">
                                        <div class="col-6">
                                            <asp:Label ID="lblSpace" runat="server" Font-Bold="True" Font-Size="Large" Visible="false"></asp:Label>
                                        </div>
                                        <div class="col-6">
                                            <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                
                                <%--2nd Row--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="text" id="txtNameEdit" class="form-control" runat="server" disabled="disabled" />
                                        </div>
                                    </div>
                                </div>

                                <%--3rdRow--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-8">
                                            <input type="email" id="txtEmailEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                        <div class="col-4">

                                            <input type="text" id="txtContactEdit" class="form-control" runat="server" disabled="disabled"  />
                                        </div>
                                    </div>

                                </div>

                                <%--4th Row--%>
                                <div class="form-group">
                                    <label>Note</label>
                                    <textarea id="txtNotesEdit" class="form-control" rows="4" runat="server" disabled="disabled"></textarea>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" style="float: right">Back</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

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
