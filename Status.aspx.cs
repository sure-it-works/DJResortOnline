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
    public partial class Status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
                ModalData();
            }
        }

        private void BindGrid()
        {
            //Populating a DataTable from database.
            //DataTable dt = this.GetData();

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_ReservationDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvReservation.DataSource = dt;
                    gvReservation.DataBind();
                }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void ModalData()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_ReservationDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    //return dt;

                    //lblTransactionNo.Text = "Transaction No: " + dt.Rows[0]["TransactionNo"].ToString();
                    //lblReservation.Text = "Reservation Date: " + dt.Rows[0]["CreatedDate"].ToString();
                    ////txtName.Text = dt.Rows[0]["Name"].ToString();
                    int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                    txtBalance.Value = Convert.ToString(balance);



                }
            }

        }

        protected void Display(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
            GridViewRow row = gvReservation.Rows[rowIndex];

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_ReservationDetails_Modal", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;

                cmd.Parameters.AddWithValue("ResID", (row.FindControl("lblResID") as Label).Text);

                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);

                    lblTransactionNo.Text = "Transaction No: " + dt.Rows[0]["TransactionNo"].ToString();
                    lblReservation.Text = "Reservation Date: " + dt.Rows[0]["CreatedDate"].ToString();
                    
                    int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                    txtBalance.Value = Convert.ToString(balance);

                    ClientScript.RegisterStartupScript(this.GetType(), "pop", "openModal();", true);

                }
            }
        }


        //protected void gvReservation_OnRowCommand(object sender, GridViewCommandEventArgs e)
        //{
            
        //    int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
        //    GridViewRow row = gvReservation.Rows[rowIndex];

        //    SqlConnection myConnection = new SqlConnection(GetConnectionString());
        //    SqlCommand cmd = new SqlCommand("Get_ReservationDetails_Modal", myConnection);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    myConnection.Open();

        //    using (SqlDataAdapter sda = new SqlDataAdapter())
        //    {
        //        cmd.Connection = myConnection;
        //        sda.SelectCommand = cmd;

        //        cmd.Parameters.AddWithValue("ResID", (row.FindControl("lblResID") as Label).Text);

        //        using (DataTable dt = new DataTable())
        //        {
        //            sda.Fill(dt);
        //            //return dt;

        //            lblTransactionNo.Text = "Transaction No: " + dt.Rows[0]["TransactionNo"].ToString();
        //            //lblReservation.Text = "Reservation Date: " + dt.Rows[0]["CreatedDate"].ToString();
        //            ////txtName.Text = dt.Rows[0]["Name"].ToString();

        //            //lblTransactionNo.Text = (row.FindControl("TransactionNo") as Label).Text;

        //            int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
        //            txtBalance.Value = Convert.ToString(balance);

        //            //lblTransactionNo.Text = (row.FindControl("lblResID") as Label).Text;
        //            //lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        //            //txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
        //            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

        //        }
        //    }

        //}
    }
}