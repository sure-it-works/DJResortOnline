using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DJResortOnline
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGrid();
                Display();
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void BindGrid()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_FeedbackDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvFeedbacks.DataSource = dt;
                    gvFeedbacks.DataBind();
                }
            }
        }

        private void Display()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_FeedbackDetailsDisplay", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);

                    FeedbackRatings.InnerText = dt.Rows[0]["FeedbackRatings"].ToString();
                    TotalReviewNo.InnerText = dt.Rows[0]["NoofReviewers"].ToString();

                    //select COUNT(*) as NoofReviewers,
                    //(SUM(FeedbackStars) / COUNT(*)) as FeedbackRatings
                    //FROM FeedbackDetails with(nolock)
                }
            }
        }

        protected void gvFeedbacks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvFeedbacks.PageSize;

                if (e.CommandName == "View")
                {

                    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                    GridViewRow row = gvFeedbacks.Rows[rowIndex];

                    SqlConnection myConnection = new SqlConnection(GetConnectionString());
                    SqlCommand cmd = new SqlCommand("Get_FeedbackDetails_Modal", myConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    myConnection.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = myConnection;
                        sda.SelectCommand = cmd;

                        cmd.Parameters.AddWithValue("FdbckID", (row.FindControl("lblFdbckID") as Label).Text);

                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);

                            lblStars.Text = dt.Rows[0]["FeedbackStars"].ToString();
                            lblDate.Text = "Posted Date: " + dt.Rows[0]["CreatedDate"].ToString();
                            txtNameEdit.Value = dt.Rows[0]["Name"].ToString();
                            txtEmailEdit.Value = dt.Rows[0]["Email"].ToString();
                            //txtContactEdit.Value = dt.Rows[0]["ContactNumber"].ToString();
                            txtNotesEdit.Value = dt.Rows[0]["FeedbackDetails"].ToString();

                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalFeedback", "$('#modalFeedback').modal('show');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gvFeedbacks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            gvFeedbacks.PageIndex = e.NewPageIndex;
            gvFeedbacks.DataBind();
        }
    }
}