using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DJResortOnline
{
    public partial class PrintInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!this.IsPostBack)
            {
                BindGrid();
                OnLoadDetails();
            }
        }




        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void BindGrid()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Print_ReservationInvoice", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            string url = Request.Url.AbsoluteUri;
            string ResID = url.Substring(url.Length - 1);

            cmd.Parameters.Add("@ReservationID", SqlDbType.Int).Value = Convert.ToInt32(ResID);
            
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvInvoice.DataSource = dt;
                    gvInvoice.DataBind();
                }
            }
        }

        private void OnLoadDetails()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Print_ReservationInvoice", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            string url = Request.Url.AbsoluteUri;
            string ResID = url.Substring(url.IndexOf("=") + 1).Trim();

            //string ResID = url.Substring(url.Length - 1);

            cmd.Parameters.Add("@ReservationID", SqlDbType.Int).Value = Convert.ToInt32(ResID);

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);

                    lblName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    lblEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    DateTime dateTime = DateTime.UtcNow.Date;
                    lblPrintDate.Text = dateTime.ToString("D");
                    lblInvoice.Text = "Invoice No. " + ds.Tables[0].Rows[0]["ReservationID"].ToString();

                }
            }
        }
    }
}