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
                txtCheckIn.Value = DateTime.Now.ToString("yyyy-MM-dd");
                txtCheckOut.Value = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void AvailableDates()
        {
            try
            {
                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("Get_AvailableDatesvsRoom", myConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                myConnection.Open();

                cmd.Parameters.Add("@Deals", SqlDbType.NVarChar, 50).Value = ddlDeals.SelectedItem.Text;

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = myConnection;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);



                        txtTotal.Value = ds.Tables[0].Rows[0]["Price"].ToString();
                        double reservation = 0;
                        reservation = (0.2) * (Convert.ToInt32(txtTotal.Value));
                        txtReservation.Value = reservation.ToString();
                        double balance = 0;
                        balance = Convert.ToInt32(txtTotal.Value) - reservation;
                        //txtBalance.Value = balance.ToString();
                        txtAdults.Value = ds.Tables[0].Rows[0]["NoOfAdults"].ToString();
                        txtKids.Value = ds.Tables[0].Rows[0]["NoOfKids"].ToString();
                        txtAdults.Attributes.Add("max", ds.Tables[0].Rows[0]["NoOfAdults"].ToString());
                        txtKids.Attributes.Add("max", ds.Tables[0].Rows[0]["NoOfKids"].ToString());
                        if (Convert.ToInt32(txtKids.Value) == 0)
                        {
                            txtAdults.Attributes.Add("max", Convert.ToString(Convert.ToInt32(ds.Tables[0].Rows[0]["NoOfAdults"].ToString()) + Convert.ToInt32(ds.Tables[0].Rows[0]["NoOfKids"].ToString())));
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
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

                        ListItem list = new ListItem();
                        list.Text = "SELECT DEALS";

                        ddlDeals.DataSource = ds.Tables[0];
                        ddlDeals.DataTextField = "DealsName";
                        ddlDeals.DataBind();
                        ddlDeals.Items.Insert(0, list);

                        

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
                        //txtBalance.Value = balance.ToString();
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

        private void ClearForm()
        {
            txtName.Value = "";
            txtEmail.Value = "";
            txtTransactionNo.Value = "";
            txtContact.Value = "";
            ddlDeals.SelectedItem.Text = "SELECT DEALS";
            txtAdults.Value = "0"; 
            txtKids.Value = "0";
            txtCheckIn.Value = "mm/dd/yyyy";
            txtCheckOut.Value = "mm/dd/yyyy";
            txtTotal.Value = "";
            txtReservation.Value = "";
            txtNotes.Value = "";
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            if (txtTransactionNo.Value.Length == 0)
            {
                Response.Write("<script language=javascript>alert('Please add the Gcash Reference No!');</script>");
            }
            else
            {
                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("AddReservation", myConnection);
                {
                    myConnection.Open();
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = txtName.Value;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmail.Value;
                    cmd.Parameters.Add("@TransactionNo", SqlDbType.NVarChar, 50).Value = txtTransactionNo.Value;
                    cmd.Parameters.Add("@ContactNo", SqlDbType.NVarChar, 50).Value = txtContact.Value;
                    cmd.Parameters.Add("@Deals", SqlDbType.NVarChar, 50).Value = ddlDeals.SelectedItem.Text;
                    cmd.Parameters.Add("@NoOfAdults", SqlDbType.Int).Value = Convert.ToInt32(txtAdults.Value);
                    cmd.Parameters.Add("@NoOfChildren", SqlDbType.Int).Value = Convert.ToInt32(txtKids.Value);
                    cmd.Parameters.Add("@CheckIn", SqlDbType.DateTime).Value = Convert.ToDateTime(txtCheckIn.Value);
                    cmd.Parameters.Add("@CheckOut", SqlDbType.DateTime).Value = Convert.ToDateTime(txtCheckOut.Value);
                    cmd.Parameters.Add("@TotalPayment", SqlDbType.Int).Value = Convert.ToInt32(txtTotal.Value);
                    cmd.Parameters.Add("@ReservationFee", SqlDbType.Int).Value = Convert.ToInt32(txtReservation.Value);
                    cmd.Parameters.Add("@Notes", SqlDbType.NVarChar).Value = txtNotes.Value;


                    var result = cmd.ExecuteNonQuery();
                    myConnection.Close();

                    Response.Write("<script language=javascript>alert('Reservation Added!');</script>");

                }

                ClearForm();
            }
        }

        protected void lblQR_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "openModal", "$('#modalQR').modal('show');", true);
        }
    }
}