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

        //DataTable dt = new DataTable();
        //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblrating");
                //Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                //lbresult.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);
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

        }


    }
}
