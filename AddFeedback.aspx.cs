using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

namespace DJResortOnline
{
    public partial class AddFeedback : System.Web.UI.Page
    {

        List<Feedback> feedbacks;

        public AddFeedback()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_FeedbackDetails", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;


                var result = cmd.ExecuteNonQuery();

                DataTable dtList = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(dtList);

                feedbacks = new List<Feedback>();
               

                foreach (DataRow row in dtList.Rows)
                {
                   

                    feedbacks.Add(new Feedback
                    {
                        Name = row["Name"].ToString(),

                        Star = Convert.ToInt32(row["FeedbackStars"]),

                        Detail = row["FeedbackDetails"].ToString()
                    });

                }

                myConnection.Close();
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //displayFeedback();
                Repeater1.DataSource = feedbacks;
                Repeater1.DataBind();
            }
        }
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        public void btnsubmit_Click(object sender, EventArgs e)
        {
            addFeedback();

        }

        private void addFeedback()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("AddFeedback", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;



                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = txtName.Value;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = txtEmail.Value;
                cmd.Parameters.Add("@FeedbackDetails", SqlDbType.NVarChar, int.MaxValue).Value = txtDetails.Value;
                cmd.Parameters.Add("@FeedbackStars", SqlDbType.Int, 50).Value = Convert.ToInt32(Rating1.CurrentRating);

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();

                txtName.Value = string.Empty;
                txtEmail.Value = string.Empty;
                txtDetails.Value = string.Empty;
            }

            Response.Write("<script language=javascript>alert('Feedback Submitted!');</script>");
            Repeater1.DataSource = feedbacks;
            Repeater1.DataBind();
        }

       


    }

    partial class Feedback
    {
        public string Name { get; set; }
        public int Star { get; set; }
        public string Detail { get; set; }

    }

}





