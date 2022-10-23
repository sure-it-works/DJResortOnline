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
                ddlDeals_Bind();
            }
        }

        private void BindGrid()
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
                    gvReservation.DataSource = dt;
                    gvReservation.DataBind();
                }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
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

                        ddlEditDeals.DataSource = ds.Tables[0];
                        ddlEditDeals.DataTextField = "DealsName";
                        ddlEditDeals.DataBind();

                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gvReservation_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvReservation.PageSize;

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
                        ddlDeals.SelectedItem.Text = dt.Rows[0]["Deals"].ToString();
                        txtCheckIn.Value = dt.Rows[0]["CheckIn"].ToString();
                        txtCheckOut.Value = dt.Rows[0]["CheckOut"].ToString();
                        txtAdults.Value = dt.Rows[0]["NoOfAdults"].ToString();
                        txtKids.Value = dt.Rows[0]["NoOfChildren"].ToString();
                        txtTotal.Value = dt.Rows[0]["TotalPayment"].ToString();
                        txtReservation.Value = dt.Rows[0]["ReservationFee"].ToString();
                        txtNotes.Value = dt.Rows[0]["Notes"].ToString();
                        ddlStatus.SelectedItem.Text = dt.Rows[0]["Status"].ToString();

                        int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                        txtBalance.Value = Convert.ToString(balance);

                       
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#modalView').modal('show');", true);
                    }
                }
            }else if (e.CommandName == "Touch")
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

                        lblTransactionNoEdit.Text = dt.Rows[0]["TransactionNo"].ToString();
                        lblReservationEdit.Text = "Reservation Date: " + dt.Rows[0]["CreatedDate"].ToString();
                        txtNameEdit.Value = dt.Rows[0]["Name"].ToString();
                        txtEmailEdit.Value = dt.Rows[0]["Email"].ToString();
                        txtContactEdit.Value = dt.Rows[0]["ContactNumber"].ToString();
                        ddlEditDeals.SelectedItem.Text = dt.Rows[0]["Deals"].ToString();
                        txtCheckInEdit.Value = dt.Rows[0]["CheckIn"].ToString();
                        txtCheckOutEdit.Value = dt.Rows[0]["CheckOut"].ToString();
                        txtAdultsEdit.Value = dt.Rows[0]["NoOfAdults"].ToString();
                        txtKidsEdit.Value = dt.Rows[0]["NoOfChildren"].ToString();
                        txtTotalEdit.Value = dt.Rows[0]["TotalPayment"].ToString();
                        txtReservationEdit.Value = dt.Rows[0]["ReservationFee"].ToString();
                        txtNotesEdit.Value = dt.Rows[0]["Notes"].ToString();
                        ddlEditStatus.SelectedItem.Text = dt.Rows[0]["Status"].ToString();


                            int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                        txtBalanceEdit.Value = Convert.ToString(balance);


                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalEdit", "$('#modalEdit').modal('show');", true);
                    }
                }
            }else if (e.CommandName == "Remove")
            {

                
                GridViewRow row = gvReservation.Rows[rowIndex];

                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("Delete_ReservationDetails", myConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                var reservationId = (row.FindControl("lblResID") as Label).Text;
                cmd.Parameters.AddWithValue("@ReservationID", reservationId);
                myConnection.Open();
                var result = cmd.ExecuteNonQuery();
                myConnection.Close();
                    BindGrid();
            }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Update_ReservationDetails", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@TransactionNo", SqlDbType.NVarChar, 50).Value = lblTransactionNoEdit.Text;
                cmd.Parameters.Add("@Status", SqlDbType.Int).Value = ddlEditStatus.SelectedValue;

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Saving!');</script>");

            BindGrid();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("SearchReservationDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            
            cmd.Parameters.AddWithValue("@Name", "%" + txtSearch.Value + "%");

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


    }

}