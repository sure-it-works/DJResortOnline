<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFeedback.aspx.cs" Inherits="DJResortOnline.AddFeedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>DJ Resort | Customer Feedbacks</title>
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
    <link href="AddFeedback.css" rel="stylesheet" />



    <style>
        .Star {
            background-image: url(image/EmptyStar.png);
            margin-top: 0px;
            height: 40px;
            width: 40px;
            margin: 5px;
        }



        .WaitingStar {
            background-image: url(image/EmptyStar.png);
            margin-top: 0px;
            height: 40px;
            width: 40px;
            margin: 5px;
        }



        .FilledStar {
            background-image: url(image/filledStar.png);
            margin-top: 0px;
            height: 44px;
            width: 44px;
            margin: 5px;
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
                        <li><a class="getstarted scrollto" href="AddReservation.aspx">Reserve Now</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->

            </div>
        </header>
        <!-- End Header -->



        <main id="main">


            <!-- ======= Testimonials Section ======= -->
            <section id="testimonials" class="testimonials">
                <div class="container">
                    <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class="swiper-slide">
                                        <div class="testimonial-wrap">
                                            <div class="testimonial-item">
                                                <h3><%#Eval("Name")%></h3>
                                                <h3><%#Eval("Star")%><img src="~/image/filledStar.png" runat="server" id="imgThumbnail" /></h3>
                                                <p>
                                                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    <%#Eval("Detail")%>
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </section>
            <!-- End Testimonials Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <h2>Add  Feedback</h2>
                        <p></p>
                    </div>
                </div>

                <div class="container">
                    <div class="row mt-5">
                        <div class="col-lg-12 mt-5 mt-lg-0">

                            <div class="form-group mt-3">
                                <ajaxToolkit:Rating ID="Rating1" runat="server" AutoPostBack="true"
                                    StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                    FilledStarCssClass="FilledStar" HorizontalAlign="Right">
                                </ajaxToolkit:Rating>

                            </div>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <input type="text" name="name" class="form-control" id="txtName" placeholder="Your Name" required="required" runat="server" />
                                </div>
                                <div class="col-md-6 form-group mt-3 mt-md-0">
                                    <input type="email" class="form-control" name="email" id="txtEmail" placeholder="Your Email" required="required" runat="server" />
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <textarea class="form-control" name="message" rows="5" placeholder="Enter your Feedback" required="required" runat="server" id="txtDetails"></textarea>
                            </div>

                            <div class="text-center" style="padding: 10px;">
                                <asp:Button runat="server" Text="Submit Review" ID="btnsubmit" OnClick="btnsubmit_Click" class="btn btn-primary" />
                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <!-- End Contact Section -->

            <%--      <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>

                    <div>

                        <div>

                            <ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar"
                                EmptyStarCssClass="Star"
                                FilledStarCssClass="FilledStar">
                            </ajaxToolkit:Rating>

                        </div>

                        <div>

                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                OnClick="BtnRate_Click"
                                CssClass="btn btn-outline-primary btn-sm" />

                            <asp:Label ID="Label1" runat="server"></asp:Label>

                        </div>

                    </div>

                    <div style="padding: 50px">

                        <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="False"
                            CssClass="table table-sm table-striped"
                            Width="50%"
                            Style="margin-right: auto; margin-left: auto">

                            <Columns>



                                <asp:TemplateField HeaderText="Rate">

                                    <ItemTemplate>

                                        <ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar"
                                            EmptyStarCssClass="Star"
                                            CurrentRating='<%# Bind("Rating") %>'
                                            FilledStarCssClass="FilledStar"
                                            ReadOnly="True">
                                        </ajaxToolkit:Rating>

                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:BoundField DataField="Name" HeaderText="Name" />

                            </Columns>

                        </asp:GridView>

                    </div>

                    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="2000" OnTick="Tick"></asp:Timer>

                </ContentTemplate>

            </asp:UpdatePanel>--%>
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
