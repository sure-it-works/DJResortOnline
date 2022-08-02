﻿using System;
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

        //private void ddlDeals()
        //{
        //    try
        //    {
        //        //Maintenance maint = new Maintenance();
        //        //DataSet ds = new DataSet();
        //        //ds = maint.getPrepared(user);

        //        //ddlPrep.DataSource = ds.Tables[0];
        //        //ddlPrep.DataTextField = "EmployeeName";
        //        //ddlPrep.DataValueField = "APOAccount";
        //        //ddlPrep.DataBind();

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //private void ddlStatus()
        //{
        //    try
        //    {
        //        //Maintenance maint = new Maintenance();
        //        //DataSet ds = new DataSet();
        //        //ds = maint.getPrepared(user);

        //        //ddlPrep.DataSource = ds.Tables[0];
        //        //ddlPrep.DataTextField = "EmployeeName";
        //        //ddlPrep.DataValueField = "APOAccount";
        //        //ddlPrep.DataBind();

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}


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
                        //txtEmail.Value = dt.Rows[0]["Deals"].ToString();
                        txtCheckIn.Value = dt.Rows[0]["CheckIn"].ToString();
                        txtCheckOut.Value = dt.Rows[0]["CheckOut"].ToString();
                        //txtAdults.Value = dt.Rows[0]["NoOfAdults"].ToString();
                        //txtKids.Value = dt.Rows[0]["NoOfChildren"].ToString();
                        txtTotal.Value = dt.Rows[0]["TotalPayment"].ToString();
                        txtReservation.Value = dt.Rows[0]["ReservationFee"].ToString();
                        txtNotes.Value = dt.Rows[0]["Notes"].ToString();
                        //txtEmail.Value = dt.Rows[0]["Status"].ToString();


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
                        //txtContactEdit.Value = dt.Rows[0]["ContactNumber"].ToString();
                        //txtEmail.Value = dt.Rows[0]["Deals"].ToString();
                        txtCheckInEdit.Value = dt.Rows[0]["CheckIn"].ToString();
                        txtCheckOutEdit.Value = dt.Rows[0]["CheckOut"].ToString();
                        //txtAdultsEdit.Value = dt.Rows[0]["NoOfAdults"].ToString();
                        //txtKidsEdit.Value = dt.Rows[0]["NoOfChildren"].ToString();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //SqlConnection myConnection = new SqlConnection(GetConnectionString());
            //SqlCommand cmd = new SqlCommand("Update_ReservationDetails", myConnection);
            //cmd.CommandType = CommandType.StoredProcedure;
            //myConnection.Open();

            //using (SqlDataAdapter sda = new SqlDataAdapter())
            //{
            //    cmd.Connection = myConnection;
            //    sda.SelectCommand = cmd;

            //    cmd.Parameters.AddWithValue("Name", txtNameEdit.Value);
            //    cmd.Parameters.AddWithValue("Email", txtEmailEdit.Value);
            //    cmd.Parameters.AddWithValue("TransactionNo", lblTransactionNoEdit.Text);
            //    cmd.Parameters.AddWithValue("ContactNo", txtContactEdit.Value);
            //    //cmd.Parameters.AddWithValue("Deals", .Value);
            //    cmd.Parameters.AddWithValue("CheckIn", txtCheckInEdit.Value);
            //    cmd.Parameters.AddWithValue("CheckOut", txtCheckOutEdit.Value);
            //    cmd.Parameters.AddWithValue("TotalPayment", txtTotalEdit.Value);
            //    cmd.Parameters.AddWithValue("ReservationFee", txtReservationEdit.Value);
            //    cmd.Parameters.AddWithValue("Notes", txtNotesEdit.Value);


            //    using (DataTable dt = new DataTable())
            //    {
            //        sda.Fill(dt);





            //    }
            //}

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Update_ReservationDetails", myConnection);
            //using (SqlConnection conn = new SqlConnection((GetConnectionString()))
            //using (SqlCommand cmd = new SqlCommand("Update_ReservationDetails", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                //cmd.Parameters.AddWithValue("Name", txtNameEdit.Value);
                //cmd.Parameters.AddWithValue("Email", txtEmailEdit.Value);
                //cmd.Parameters.AddWithValue("TransactionNo", lblTransactionNoEdit.Text);
                //cmd.Parameters.AddWithValue("ContactNo", txtContactEdit.Value);
                ////cmd.Parameters.AddWithValue("Deals", .Value);
                //cmd.Parameters.AddWithValue("CheckIn", txtCheckInEdit.Value);
                //cmd.Parameters.AddWithValue("CheckOut", txtCheckOutEdit.Value);
                //cmd.Parameters.AddWithValue("TotalPayment", txtTotalEdit.Value);
                //cmd.Parameters.AddWithValue("ReservationFee", txtReservationEdit.Value);
                //cmd.Parameters.AddWithValue("Notes", txtNotesEdit.Value);

                // add parameters with defined type!

                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = txtNameEdit.Value;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmailEdit.Value;
                cmd.Parameters.Add("@TransactionNo", SqlDbType.NVarChar, 50).Value = lblTransactionNoEdit.Text;
                cmd.Parameters.Add("@ContactNo", SqlDbType.NVarChar, 50).Value = txtContactEdit.Value;
                cmd.Parameters.Add("@Deals", SqlDbType.NVarChar, 50).Value = ddlEditDeals.SelectedItem.Text;
                cmd.Parameters.Add("@NoOfAdults", SqlDbType.Int).Value = txtAdultsEdit.Value;
                cmd.Parameters.Add("@NoOfChildren", SqlDbType.Int).Value = txtKidsEdit.Value;
                cmd.Parameters.Add("@CheckIn", SqlDbType.DateTime).Value = txtCheckInEdit.Value;
                cmd.Parameters.Add("@CheckOut", SqlDbType.DateTime).Value = txtCheckOutEdit.Value;
                cmd.Parameters.Add("@TotalPayment", SqlDbType.Int).Value = txtTotalEdit.Value;
                cmd.Parameters.Add("@ReservationFee", SqlDbType.Int).Value = txtReservationEdit.Value;
                cmd.Parameters.Add("@Status", SqlDbType.Int).Value = ddlEditStatus.SelectedItem.Text;

                // open connection, call stored procedure, close connection
                myConnection.Open();
                cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Saving!');</script>");
        }
    }
}