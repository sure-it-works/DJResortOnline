using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace DJResortOnline
{
    public partial class Announcement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                LoadAnnouncement();
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Update_Announcement", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                bool status = true;
                cmd.Parameters.Add("@Details", SqlDbType.NVarChar, int.MaxValue).Value = announcementDetails.Value;
                cmd.Parameters.Add("@Status", SqlDbType.Bit).Value = status;

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Saving and Posting your Announcement!');</script>");
            LoadAnnouncement();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Delete_Announcement", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                bool status = false;
                cmd.Parameters.Add("@Status", SqlDbType.Bit).Value = status;

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Announcement already Deleted!');</script>");
            LoadAnnouncement();
            announcementDetails.Value = string.Empty;
        }

        
        

        private void LoadAnnouncement()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_Announcement", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    announcementDetails.Value = dt.Rows[0]["AnnouncementDetails"].ToString();
                    if (dt.Rows[0]["Status"].ToString() == "True")
                    {
                        Status.Value = "This Announcement is posted!";
                    }
                    else
                    {
                        Status.Value = "This Announcement is NOT posted!";
                    }
                }
            }
        }
    }
}