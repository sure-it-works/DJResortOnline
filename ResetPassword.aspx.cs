using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DJResortOnline.Service.EmailService;
using EAGetMail;
using DJResortOnline.Service;

namespace DJResortOnline
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        EmailService _service;

        public ResetPassword()
        {
            _service = new EmailService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
        }
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Email_AdminUser", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;

            
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);


                    string Subject = "Password Request";
                    string receiver = "djresort.quezon@gmail.com";
                    string Emailbody = "Your Password is " + dt.Rows[0]["Password"].ToString();
                    _service.SendEmail(Subject, Emailbody, receiver);

                    Response.Write("<script language=javascript>alert('Kindly check your email for the password!');</script>");

                    Response.Redirect("Login.aspx");
                }
            }

           
        }
    }
}