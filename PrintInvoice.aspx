﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintInvoice.aspx.cs" Inherits="DJResortOnline.PrintInvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DJ Resort | Invoice Printing</title>
    <!-- Favicons -->
    <link href="image/logo.png" rel="icon" />

    <link rel="stylesheet" href="PrintInvoice.css" />

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!-- Page specific script -->
    <script>
        window.addEventListener("load", window.print());
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="container" style="padding-top: 50px">
            <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="invoice-container">
                                <div class="invoice-header">
                                    <!-- Row start -->
                                    <div class="row gutters">
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <a class="invoice-logo"><img src="image/footer-logo.png" style="padding-right:15px; height:78px"/>DJ RESORT
                                            </a>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <address style="float: right; vertical-align:middle">
                                                Liwayway Subdivision<br />
                                                Brgy. Llig Tiaong, Quezon<br />
                                                09546286227<br />
                                                dj.resort@gmai.com
                                            </address>
                                        </div>
                                    </div>
                                    <!-- Row end -->
                                    <!-- Row start -->
                                    <div class="row gutters">
                                        <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                                            <div class="invoice-details">
                                                <div class="invoice-name">
                                                    <div>
                                                        <strong><asp:Label runat="server" ID="lblName"></asp:Label></strong>
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lblEmail"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                                            <div class="invoice-details">
                                                <div class="invoice-num">
                                                    <div>
                                                        <strong><asp:Label runat="server" ID="lblInvoice"></asp:Label></strong>
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lblPrintDate"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Row end -->
                                </div>
                                <div class="invoice-body" style="padding-bottom: 50px">
                                    <!-- Row start -->
                                    <div class="row gutters">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="">
                                                <asp:GridView ID="gvInvoice" runat="server" 
                                                    AutoGenerateColumns="false" AllowPaging="true"
                                                    PageSize="10" GridLines="None" EditRowStyle-VerticalAlign="Middle">
                                                    <Columns>
                                                        <asp:BoundField ItemStyle-Width="20%" DataField="TransactionNo" HeaderText="Transaction No">
                                                           
                                                        </asp:BoundField>
                                                        <asp:BoundField ItemStyle-Width="20%" DataField="Deals" HeaderText="Deals">
                                                          
                                                        </asp:BoundField>
                                                        <asp:BoundField ItemStyle-Width="15%" DataField="CheckIn" HeaderText="Check In">
                                                         
                                                        </asp:BoundField>
                                                        <asp:BoundField ItemStyle-Width="15%" DataField="CheckOut" HeaderText="Check Out">
                                                      
                                                        </asp:BoundField>
                                                        <asp:BoundField ItemStyle-Width="15%" DataField="ReservationFee" HeaderText="Reservation Fee">
                                                        
                                                        </asp:BoundField>
                                                        <asp:BoundField ItemStyle-Width="15%" DataField="TotalPayment" HeaderText="Total Payment">
                                                          
                                                        </asp:BoundField>
                                                    </Columns>

                                                    <EditRowStyle VerticalAlign="Middle"></EditRowStyle>
                                                    <HeaderStyle BackColor="#007AE1" ForeColor="White"/>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Row end -->
                                </div>
                                <div class="invoice-footer">
                                    Thank you for your visit.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
