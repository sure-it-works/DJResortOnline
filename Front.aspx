<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Front.aspx.cs" Inherits="DJResortOnline.Front" %>

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

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">
            <div class="container">
                <h1>Welcome to DJ</h1>
                <h2>Spend your time with your family and friends in fun and  affordable way!</h2>
                <a href="#about" class="btn-get-started scrollto">Get Started</a>
            </div>
        </section>
        <!-- End Hero -->

        <main id="main">

            <!-- ======= Why Us Section ======= -->
            <section id="why-us" class="why-us">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-4 d-flex align-items-stretch">
                            <div class="content">
                                <h3>Why Choose DJ?</h3>
                                <p>
                                    DJ Resort has a public pool and  private pool. So the clients have a choices to avail and enjoy the amenities of the resort. 
                                    Fun and affordable ways to spend time with families and friends. It's the little things that you do that makes me always choose you. Here in DJ Resort From the moment you arrive to the moment you leave, we're devoted to providing the greatest level of service and hospitality. 
                                    Count on us to pamper you and take care of you during your stay, like we always do.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-8 d-flex align-items-stretch">
                            <div class="icon-boxes d-flex flex-column justify-content-center">
                                <div class="row">
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <%--<i class="bx bx-receipt"></i>--%>
                                            <img src="Gallery/assets/img/5Weddings.jpg" style="height: 150px"/>
                                            <h4>Wedding</h4>
                                            <p> This is the place that good for wedding events. It has a big hall and function halls for the big event.</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <%--<i class="bx bx-cube-alt"></i>--%>
                                            <img src="Gallery/assets/img/6FamilyGatherings.jpg"  style="height: 150px"/>
                                            <h4>Family Gathering</h4>
                                            <p> This is the place that good for wedding events. It has a big hall and function halls for the big event.</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <%--<i class="bx bx-images"></i>--%>
                                            <img src="Gallery/assets/img/7Team Building.jpg"  style="height: 150px"/>
                                            <h4>Team Building</h4>
                                            <p>You can enjoy your team-building activities here at DJ Resort, it has a wide and this place</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End .content-->
                        </div>
                    </div>

                </div>
            </section>
            <!-- End Why Us Section -->

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch position-relative">
                            <%--<a href="" class="glightbox play-btn mb-4"></a>--%>
                        </div>

                        <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
                            <h3>Resort Background</h3>
                            <p>Resort was established in 1993 and owned by Mrs. Lea Mendoza. It is located at Liwayway Subdivision, Brgy. Lalig, Tiaong, Quezon. It is a business that offers resort reservations for all occasions such as weddings, birthday parties, family gatherings, retreats, conferences, seminars, company outings, team building and other special out-of-town gathering events. The resort also has 24 hotel rooms for clients who want to stay longer. The resort operates 24 hours; the area has health protocols for the safety of the clients. DJ Resort is committed to delivering high quality service.</p>

                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-hotel"></i></div>
                                <h4 class="title"><a></a></h4>
                                <p class="description">Prior to your arrival, your room was unoccupied for at least 3 days and has undergone a thorough 24 hour cleaning and disinfection process.</p>
                            </div>

                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-spray-can"></i></div>
                                <h4 class="title"><a></a></h4>
                                <p class="description">To clean your room, our Housekeeping Warriors wear personal protective equipment and use hospital grade disinfectatnts, anti-bacterial and anti-viral gels and soaps, and UV-LED lighting equipment and air purifiers.</p>
                            </div>

                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-bus-school"></i></div>
                                <h4 class="title"><a></a></h4>
                                <p class="description">We clean your pick-up vehicle bfore and after use. We reduced number of guests allowed in each pick-up vehicle.</p>
                            </div>

                        </div>
                    </div>

                </div>
            </section>
            <!-- End About Section -->

            <!-- ======= Counts Section ======= -->
            <section id="counts" class="counts">
                <div class="container">
                    <div class="text-center" style="padding-bottom: 40px;">
                        <h3><strong>WARM AND SAFE WELCOME</strong></h3>
                    </div>

                    <div class="row">

                        <div class="col-lg-3 col-md-6">
                            <div class="count-box">
                                <i class="bx bx-home-heart"></i>
                                <p>Sanitation station are set-up at the arrival areas</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                            <div class="count-box">
                                <i class="bx bx-spray-can"></i>
                                <p>Your luggage will undergo spray sanitation and cleaning before bringing to your room</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                            <div class="count-box">
                                <i class="bx bx-heart-circle"></i>
                                <p>Your temperature will be checked upon each entry</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                            <div class="count-box">
                                <i class="bx bx-file"></i>
                                <p>Upon check-in, you will be requested to accomplish a Health related questionnaire as by the Department of Heath.</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <!-- End Counts Section -->

            <!-- ======= Services Section ======= -->
            <section id="services" class="services">
                <div class="container">

                    <div class="section-title">
                        <h2>"Come for the fun, stay for the memories"</h2>
                        <p></p>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-swim"></i></div>
                                <h4><a href="Deals.aspx">Deals</a></h4>
                                <p>View the Resort's Deals and have one of a kind experience</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-building-house"></i></div>
                                <h4><a href="">Facilities</a></h4>
                                <p>Need a place for your big events? We got you!</p>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-comment-dots"></i></div>
                                <h4><a href="">Costumer Feedbacks</a></h4>
                                <p>View testimonies from our customers</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <!-- End Services Section -->

            <!-- ======= Announcement Section ======= -->
            <section id="appointment" class="appointment section-bg">
                <div class="container">

                    <div class="section-title">
                        <h2>Announcement</h2>
                        <p></p>
                    </div>

                    <form role="form" class="php-email-form">
                        
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="message" rows="7" placeholder="No  Announcement for today! :)" disabled="disabled"></textarea>
                            <div class="validate"></div>
                        </div>

                    </form>

                </div>
            </section>
            <!-- End Announcement Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <h2>Contact Us</h2>
                        <p></p>
                    </div>
                </div>

                <div>
                    <iframe style="border: 0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
                </div>

                <div class="container">
                    <div class="row mt-5">

                        <div class="col-lg-4">
                            <div class="info">
                                <div class="address">
                                    <i class="bi bi-geo-alt"></i>
                                    <h4>Location:</h4>
                                    <p>Liwayway Subdivision, Brgy. Lalig Tiaong, Quezon</p>
                                </div>

                                <div class="email">
                                    <i class="bi bi-envelope"></i>
                                    <h4>Email:</h4>
                                    <p>djresort@gmail.com</p>
                                </div>

                                <div class="phone">
                                    <i class="bi bi-phone"></i>
                                    <h4>Call:</h4>
                                    <p>09456286227</p>
                                </div>

                            </div>

                        </div>

                        <div class="col-lg-8 mt-5 mt-lg-0">

                            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                                    </div>
                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                                </div>
                                <div class="form-group mt-3">
                                    <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                </div>
                                <div class="text-center">
                                    <button type="submit">Send Message</button></div>
                            </form>

                        </div>

                    </div>

                </div>
            </section>
            <!-- End Contact Section -->

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
