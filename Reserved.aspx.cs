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
    public partial class Reserved : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGrid();
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
                    gvNewReservation.DataSource = dt;
                    gvNewReservation.DataBind();
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

        protected void gvNewReservation_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            try
            {

                int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvNewReservation.PageSize;

                if (e.CommandName == "Touch")
                {

                    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                    GridViewRow row = gvNewReservation.Rows[rowIndex];

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
                            txtID.Value = dt.Rows[0]["ReservationID"].ToString();


                            int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                            txtBalanceEdit.Value = Convert.ToString(balance);


                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalEdit", "$('#modalEdit').modal('show');", true);
                        }
                    }
                }
                else if (e.CommandName == "Remove")
                {

                    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                    GridViewRow row = gvNewReservation.Rows[rowIndex];

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

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Update_Status", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                
                //cmd.Parameters.Add("@TransactionNo", SqlDbType.NVarChar, 50).Value = lblTransactionNoEdit.Text;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(txtID.Value);

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
            SqlCommand cmd = new SqlCommand("SearchNewReservation", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            //cmd.Parameters.Add("@Name", SqlDbType.NVarChar, int.MaxValue).Value = txtSearch.Value;
            cmd.Parameters.AddWithValue("@Name", "%" + txtSearch.Value + "%");

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvNewReservation.DataSource = dt;
                    gvNewReservation.DataBind();
                }
            }
        }

        protected void gvNewReservation_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            gvNewReservation.PageIndex = e.NewPageIndex;
            gvNewReservation.DataBind();
        }
    }
}