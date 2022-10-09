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
using System.IO;

namespace DJResortOnline
{
    public partial class PriceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGrid();
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void BindGrid()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_Deals", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvDeals.DataSource = dt;
                    gvDeals.DataBind();
                }
            }
        }

        public bool saveReport(bool success)
        {

            try
            {
               
                DataSet ds = new DataSet();
                bool valid = true;


                string path = "~\\image\\Deals\\";
                string folderPath = HttpContext.Current.Server.MapPath(path);


                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.

                    Directory.CreateDirectory(folderPath);
                    if (imageUploader.HasFile)
                    {
                        
                        imageUploader.SaveAs(Path.Combine(folderPath, imageUploader.FileName));
                        valid = true;

                    }
                    else
                    {
                        
                        Response.Write("<script>alert('Add some attachment/s!');</script>");
                        Response.Write("<script>alert('Deals not saved!');</script>");
                        valid = false;
                    }

                }
                else
                {
                }



                if (valid)
                {
                    SqlConnection myConnection = new SqlConnection(GetConnectionString());
                    SqlCommand cmd = new SqlCommand("Update_DealsDetails", myConnection);
                    {
                        myConnection.Open();
                        cmd.CommandType = CommandType.StoredProcedure;


                        cmd.Parameters.Add("@DealsID", SqlDbType.Int, 50).Value = Convert.ToInt32(txtDealsID.Value);
                        cmd.Parameters.Add("@Name", SqlDbType.NVarChar, int.MaxValue).Value = DealsName.Value;
                        cmd.Parameters.Add("@Description", SqlDbType.NVarChar, int.MaxValue).Value = DealsDescription.Value;
                        cmd.Parameters.Add("@Price", SqlDbType.Int, 50).Value = Convert.ToInt32(txtPrice.Value);
                        cmd.Parameters.Add("@NoOfAdults", SqlDbType.Int, 50).Value = Convert.ToInt32(txtAdultsEdit.Value);
                        cmd.Parameters.Add("@NoOfChildren", SqlDbType.Int, 50).Value = Convert.ToInt32(txtKidsEdit.Value);
                        cmd.Parameters.Add("@ImageLink", SqlDbType.NVarChar, int.MaxValue).Value = imageUploader.FileName;

                        // open connection, call stored procedure, close connection

                        var result = cmd.ExecuteNonQuery();
                        myConnection.Close();


                    }

                    Response.Write("<script language=javascript>alert('Done Updating Deals!');</script>");

                    
                }
                else
                {
                    Response.Write("<script>alert('Deal not updated!');</script>");
                    success = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return success;
        }

        protected void gvDeals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                int rowIndex = int.Parse(e.CommandArgument.ToString()) % gvDeals.PageSize;

                if (e.CommandName == "Touch")
                {

                    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                    GridViewRow row = gvDeals.Rows[rowIndex];

                    SqlConnection myConnection = new SqlConnection(GetConnectionString());
                    SqlCommand cmd = new SqlCommand("Get_Deals_Modal", myConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    myConnection.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = myConnection;
                        sda.SelectCommand = cmd;

                        cmd.Parameters.AddWithValue("DealsID", (row.FindControl("lblDealsID") as Label).Text);

                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);

                            txtDealsID.Value = dt.Rows[0]["DealsID"].ToString(); 
                            DealsName.Value = dt.Rows[0]["DealsName"].ToString();
                            imageLink.Text = dt.Rows[0]["ImageLink"].ToString();
                            DealsDescription.Value = dt.Rows[0]["DealsDescription"].ToString();
                            txtAdultsEdit.Value = dt.Rows[0]["NoOfAdults"].ToString();
                            txtKidsEdit.Value = dt.Rows[0]["NoOfKids"].ToString();
                            txtPrice.Value = dt.Rows[0]["Price"].ToString();

                            if (dt.Rows[0]["ImageLink"].ToString() == "") {
                            }
                            else
                            {
                                imgThumbnail.Attributes["src"] = "~/image/Deals/" + dt.Rows[0]["ImageLink"].ToString();
                            }
                            

                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalEdit", "$('#modalEdit').modal('show');", true);
                        }
                    }
                }
                //else if (e.CommandName == "Remove")
                //{

                //    //int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
                //    GridViewRow row = gvDeals.Rows[rowIndex];

                //    SqlConnection myConnection = new SqlConnection(GetConnectionString());
                //    SqlCommand cmd = new SqlCommand("Delete_ReservationDetails", myConnection);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    var reservationId = (row.FindControl("lblDealsID") as Label).Text;
                //    cmd.Parameters.AddWithValue("@ReservationID", reservationId);
                //    myConnection.Open();
                //    var result = cmd.ExecuteNonQuery();
                //    myConnection.Close();
                //    BindGrid();
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (saveReport(true))
            {
                BindGrid();
            }
        }

        protected void btnAddDeal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myAddModal", "$('#modalAdd').modal('show');", true);
        }
        private void addDeal()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("AddDeals", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, int.MaxValue).Value = DealsName.Value;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, int.MaxValue).Value = DealsDescription.Value;
                cmd.Parameters.Add("@Price", SqlDbType.Int, 50).Value = Convert.ToInt32(txtPrice.Value);
                cmd.Parameters.Add("@NoOfAdults", SqlDbType.Int, 50).Value = Convert.ToInt32(txtAdultsEdit.Value);
                cmd.Parameters.Add("@NoOfChildren", SqlDbType.Int, 50).Value = Convert.ToInt32(txtKidsEdit.Value);
                cmd.Parameters.Add("@ImageLink", SqlDbType.NVarChar, int.MaxValue).Value = imageLink.Text;

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Adding Deals!');</script>");

            BindGrid();
        }
    }
}