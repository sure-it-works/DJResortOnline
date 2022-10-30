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
    public partial class Front : System.Web.UI.Page
    {
        EmailService _service;

        public Front()
        {
            _service = new EmailService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                DisplayAnnouncement();
            }
        }
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void DisplayAnnouncement()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_AnnouncementHP", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);

                    txtAnnouncement.Value = dt.Rows[0]["AnnouncementDetails"].ToString();
                }
            }
        }

        protected void btnAddHealthDec_Click(object sender, EventArgs e)
        {
            Response.Redirect("HealthDec.aspx");
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            //string Subject = "Customer Inquiry - " + txtName.Value;
            //string receiver = "djresort.quezon@gmail.com";

            string Subject = txtEmail.Value;
            string receiver = "djresort.quezon@gmail.com";
            string Name = "Name: " + txtName.Value;
            string newLine = Environment.NewLine;
            string Emailbody = Name + newLine + txtEmailBody.Value;
            _service.SendEmail(Subject, Emailbody, receiver);

        }


    }
}