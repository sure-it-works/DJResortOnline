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

            //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
            //GridViewRow row = gvReservation.Rows[rowIndex];

            //SqlConnection myConnection = new SqlConnection(GetConnectionString());
            //SqlCommand cmd = new SqlCommand("Get_ReservationDetails_Modal", myConnection);
            //cmd.CommandType = CommandType.StoredProcedure;
            //myConnection.Open();

            //using (SqlDataAdapter sda = new SqlDataAdapter())
            //{
            //    cmd.Connection = myConnection;
            //    sda.SelectCommand = cmd;

            //    cmd.Parameters.AddWithValue("ResID", (row.FindControl("lblResID") as Label).Text);

            //    using (DataTable dt = new DataTable())
            //    {
            //        sda.Fill(dt);
            //        //return dt;

            //        lblTransactionNo.Text = "Transaction No: " + dt.Rows[0]["TransactionNo"].ToString();
            //        //lblReservation.Text = "Reservation Date: " + dt.Rows[0]["CreatedDate"].ToString();
            //        ////txtName.Text = dt.Rows[0]["Name"].ToString();

            //        //lblTransactionNo.Text = (row.FindControl("TransactionNo") as Label).Text;

            //        int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
            //        txtBalance.Value = Convert.ToString(balance);

            //        //lblTransactionNo.Text = (row.FindControl("lblResID") as Label).Text;
            //        //lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
            //        //txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
            //        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            //    }
            //}

            int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvReservation.PageSize;

            //if (e.CommandName == "Remove")
            //{
            //    int? id = Convert.ToInt16(gvReservation.DataKeys[rowIndex].Values[0]);
            //    _service.DeleteTolerance(id);
            //    this.ShowMessage($"{e.CommandName} Success");
            //    BindGrid(_service.GetAllTolerance());
            //}

            if (e.CommandName == "Touch")
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

                        int balance = Convert.ToInt32(dt.Rows[0]["TotalPayment"].ToString()) - Convert.ToInt32(dt.Rows[0]["ReservationFee"].ToString());
                        txtBalance.Value = Convert.ToString(balance);

                        //ClientScript.RegisterStartupScript(this.GetType(), "pop", "openModal();", true);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#modalView').modal('show');", true);
                    }
                }
                //hdnToleranceId.Value = gvReservation.DataKeys[rowIndex].Values[0].ToString();
                //    txtModalPartCode.Text = gvTolerance.Rows[rowIndex].Cells[0].Text;
                //    txtModalPartName.Text = gvTolerance.Rows[rowIndex].Cells[1].Text;
                //    txtModalChar.Text = gvTolerance.Rows[rowIndex].Cells[2].Text;
                //    txtModalCavity.Text = gvTolerance.Rows[rowIndex].Cells[3].Text;
                //    txtModalMin.Text = gvTolerance.Rows[rowIndex].Cells[4].Text;
                //    txtModalTyp.Text = gvTolerance.Rows[rowIndex].Cells[5].Text;
                //    txtModalMax.Text = gvTolerance.Rows[rowIndex].Cells[6].Text;

                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('show');", true);
                //}


            }

        }
    }
}