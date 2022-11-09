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
using System.Drawing;

namespace DJResortOnline
{
    public partial class HealthDeclaration : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("Get_HealthDec", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvHealthDec.DataSource = dt;
                    gvHealthDec.DataBind();
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

                int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvHealthDec.PageSize;

                if (e.CommandName == "Touch")
                {

                    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                    GridViewRow row = gvHealthDec.Rows[rowIndex];

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
                            //txtContactEdit.Value = dt.Rows[0]["ContactNo"].ToString();
                            ddlEditDeals.SelectedItem.Text = dt.Rows[0]["Deals"].ToString();
                            txtCheckInEdit.Value = dt.Rows[0]["CheckIn"].ToString();
                            txtCheckOutEdit.Value = dt.Rows[0]["CheckOut"].ToString();
                            txtAdultsEdit.Value = dt.Rows[0]["NoOfAdults"].ToString();
                            txtKidsEdit.Value = dt.Rows[0]["NoOfChildren"].ToString();
                            txtTotalEdit.Value = dt.Rows[0]["TotalPayment"].ToString();
                            txtReservationEdit.Value = dt.Rows[0]["ReservationFee"].ToString();
                            txtNotesEdit.Value = dt.Rows[0]["Notes"].ToString();


                            int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                            txtBalanceEdit.Value = Convert.ToString(balance);


                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalEdit", "$('#modalEdit').modal('show');", true);
                        }
                    }
                }
                else if (e.CommandName == "Remove")
                {

                    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                    GridViewRow row = gvHealthDec.Rows[rowIndex];

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

                
                cmd.Parameters.Add("@TransactionNo", SqlDbType.NVarChar, 50).Value = lblTransactionNoEdit.Text;

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Saving!');</script>");

            BindGrid();
        }

        protected void gvHealthDec_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i=4; i < gvHealthDec.Rows.Count; i++)
            {
                if (e.Row.Cells[i].Text == "True")
                {
                    e.Row.Cells[i].ForeColor = Color.Red;
                }
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("SearchHealthDec", myConnection);
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
                    gvHealthDec.DataSource = dt;
                    gvHealthDec.DataBind();
                }
            }
        }

        protected void gvHealthDec_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            gvHealthDec.PageIndex = e.NewPageIndex;
            gvHealthDec.DataBind();
        }
    }
}