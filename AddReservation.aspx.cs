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

namespace DJResortOnline
{
    public partial class AddReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                ddlDeals_Bind();
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void BindGrid()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_NewReservation", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    //gvNewReservation.DataSource = dt;
                    //gvNewReservation.DataBind();
                }
            }
        }

        private void ddlDeals_Bind()
        {
            try
            {
                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("Get_Deals", myConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                myConnection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = myConnection;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);


                        ddlDeals.DataSource = ds.Tables[0];
                        ddlDeals.DataTextField = "DealsName";
                        ddlDeals.DataBind();

                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddlDeals_SelectedIndexChanged(object sender, EventArgs e)
        {
            DealsSelected(ddlDeals.SelectedItem.Text);
        }

        private void DealsSelected(String Deals)
        {
            try
            {
                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("Get_DealsDetails", myConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                myConnection.Open();

                cmd.Parameters.Add("@Deals", SqlDbType.NVarChar, 50).Value = Deals;

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = myConnection;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);

                        txtTotal.Value = ds.Tables[0].Rows[0]["Price"].ToString();
                        double reservation = 0;
                        reservation = (0.2)*(Convert.ToInt32(txtTotal.Value));
                        txtReservation.Value = reservation.ToString();
                        double balance = 0;
                        balance = Convert.ToInt32(txtTotal.Value) - reservation;
                        txtBalance.Value = balance.ToString();
                        txtAdults.Value = ds.Tables[0].Rows[0]["NoOfAdults"].ToString();
                        txtKids.Value = ds.Tables[0].Rows[0]["NoOfKids"].ToString();
                        txtAdults.Attributes.Add("max", ds.Tables[0].Rows[0]["NoOfAdults"].ToString());
                        txtKids.Attributes.Add("max", ds.Tables[0].Rows[0]["NoOfKids"].ToString());
                        if (Convert.ToInt32(txtKids.Value) == 0)
                        {
                            txtAdults.Attributes.Add("max", Convert.ToString(Convert.ToInt32(ds.Tables[0].Rows[0]["NoOfAdults"].ToString()) + Convert.ToInt32(ds.Tables[0].Rows[0]["NoOfKids"].ToString())) );
                        }
                       
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void AllowedCapacity()
        {

        }
    }
}