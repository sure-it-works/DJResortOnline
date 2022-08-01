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
            int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
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
                    txtName.Value = dt.Rows[0]["Name"].ToString();

                    int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                    txtBalance.Value = Convert.ToString(balance);

                    //ClientScript.RegisterStartupScript(this.GetType(), "pop", "openModal();", true);

                }
            }
        }


        protected void gvReservation_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {

            
            int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvReservation.PageSize;

            //if (e.CommandName == "Remove")
            //{
            //    int? id = Convert.ToInt16(gvReservation.DataKeys[rowIndex].Values[0]);
            //    _service.DeleteTolerance(id);
            //    this.ShowMessage($"{e.CommandName} Success");
            //    BindGrid(_service.GetAllTolerance());
            //}

            if (e.CommandName == "View")
            {

                //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
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
                        txtName.Value = dt.Rows[0]["Name"].ToString();
                        txtEmail.Value = dt.Rows[0]["Email"].ToString();
                        txtContact.Value = dt.Rows[0]["ContactNumber"].ToString();
                        //txtEmail.Value = dt.Rows[0]["Deals"].ToString();
                        txtCheckIn.Value = dt.Rows[0]["CheckIn"].ToString();
                        txtCheckOut.Value = dt.Rows[0]["CheckOut"].ToString();
                        txtAdults.Value = dt.Rows[0]["NoOfAdults"].ToString();
                        txtKids.Value = dt.Rows[0]["NoOfChildren"].ToString();
                        txtTotal.Value = dt.Rows[0]["TotalPayment"].ToString();
                        txtReservation.Value = dt.Rows[0]["ReservationFee"].ToString();
                        txtNotes.Value = dt.Rows[0]["Notes"].ToString();
                        //txtEmail.Value = dt.Rows[0]["Status"].ToString();


                        int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                        txtBalance.Value = Convert.ToString(balance);

                       
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#modalView').modal('show');", true);
                    }
                }
            }

            if (e.CommandName == "Edit")
            {

                //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
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

                        lblTransactionNoEdit.Text = "Transaction No: " + dt.Rows[0]["TransactionNo"].ToString();
                        lblReservationEdit.Text = "Reservation Date: " + dt.Rows[0]["CreatedDate"].ToString();
                        txtNameEdit.Value = dt.Rows[0]["Name"].ToString();
                        txtEmailEdit.Value = dt.Rows[0]["Email"].ToString();
                        txtContactEdit.Value = dt.Rows[0]["ContactNumber"].ToString();
                        //txtEmail.Value = dt.Rows[0]["Deals"].ToString();
                        txtCheckInEdit.Value = dt.Rows[0]["CheckIn"].ToString();
                        txtCheckOutEdit.Value = dt.Rows[0]["CheckOut"].ToString();
                        txtAdultsEdit.Value = dt.Rows[0]["NoOfAdults"].ToString();
                        txtKidsEdit.Value = dt.Rows[0]["NoOfChildren"].ToString();
                        txtTotalEdit.Value = dt.Rows[0]["TotalPayment"].ToString();
                        txtReservationEdit.Value = dt.Rows[0]["ReservationFee"].ToString();
                        txtNotesEdit.Value = dt.Rows[0]["Notes"].ToString();
                        //txtEmail.Value = dt.Rows[0]["Status"].ToString();


                        int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                        txtBalanceEdit.Value = Convert.ToString(balance);


                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalEdit", "$('#modalEdit').modal('show');", true);
                    }
                }
            }

        }
    }
}