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
                ddlStatus_Bind();
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
                        //return dt;

                        ddlDeals.DataSource = ds.Tables[0];
                        ddlDeals.DataTextField = "DealsName";
                        //ddlDeals.DataValueField = "DealsName";
                        ddlDeals.DataBind();

                        ddlEditDeals.DataSource = ds.Tables[0];
                        ddlEditDeals.DataTextField = "DealsName";
                        //ddlEditDeals.DataValueField = "DealsName";
                        ddlEditDeals.DataBind();

                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        private void ddlStatus_Bind()
        {
            try
            {
                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("Get_Status", myConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                myConnection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = myConnection;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);

                        ddlStatus.DataSource = ds.Tables[0];
                        ddlStatus.DataTextField = "Status";
                        //ddlStatus.DataValueField = "Status";
                        ddlStatus.DataBind();

                        ddlEditStatus.DataSource = ds.Tables[0];
                        ddlEditStatus.DataTextField = "Status";
                        //ddlEditStatus.DataValueField = "Status";
                        ddlEditStatus.DataBind();

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
                        //txtContact.Value = dt.Rows[0]["ContactNo"].ToString();
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

                        lblTransactionNoEdit.Text = "Transaction No: " + dt.Rows[0]["TransactionNo"].ToString();
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
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Update_ReservationDetails", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = txtNameEdit.Value;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmailEdit.Value;
                cmd.Parameters.Add("@TransactionNo", SqlDbType.NVarChar, 50).Value = lblTransactionNoEdit.Text;
                cmd.Parameters.Add("@ContactNo", SqlDbType.NVarChar, 50).Value = txtContactEdit.Value;
                cmd.Parameters.Add("@Deals", SqlDbType.NVarChar, 50).Value = ddlEditDeals.SelectedItem.Text;
                cmd.Parameters.Add("@NoOfAdults", SqlDbType.Int).Value = Convert.ToInt32(txtAdultsEdit.Value);
                cmd.Parameters.Add("@NoOfChildren", SqlDbType.Int).Value = Convert.ToInt32(txtKidsEdit.Value);
                cmd.Parameters.Add("@CheckIn", SqlDbType.DateTime).Value = txtCheckInEdit.Value;
                cmd.Parameters.Add("@CheckOut", SqlDbType.DateTime).Value = txtCheckOutEdit.Value;
                cmd.Parameters.Add("@TotalPayment", SqlDbType.Int).Value = Convert.ToInt32(txtTotalEdit.Value);
                cmd.Parameters.Add("@ReservationFee", SqlDbType.Int).Value = Convert.ToInt32(txtReservationEdit.Value);
                cmd.Parameters.Add("@Notes", SqlDbType.NVarChar).Value = txtNotesEdit.Value;

                int StatusValue = 0;
                if (ddlEditStatus.SelectedItem.Text=="Unpaid")
                {
                    StatusValue = 0;

                }else if (ddlEditStatus.SelectedItem.Text == "Paid")
                {
                    StatusValue = 1;
                }

                cmd.Parameters.Add("@Status", SqlDbType.Int).Value = StatusValue;

                // open connection, call stored procedure, close connection
                
                cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Saving!');</script>");
        }

    }

}