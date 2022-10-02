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

                            DealsName.Value = dt.Rows[0]["DealsName"].ToString();
                            imageLink.Text = dt.Rows[0]["ImageLink"].ToString();
                            DealsDescription.Value = dt.Rows[0]["DealsDescription"].ToString();
                            txtAdultsEdit.Value = dt.Rows[0]["NoOfAdults"].ToString();
                            txtKidsEdit.Value = dt.Rows[0]["NoOfKids"].ToString();
                            txtPrice.Value = dt.Rows[0]["Price"].ToString();


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
    }
}