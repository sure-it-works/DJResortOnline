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
    public partial class AddDeal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void addDeal()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("AddDeals", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, int.MaxValue).Value = addDealsName.Value;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, int.MaxValue).Value = AddTxtDescription.Value;
                cmd.Parameters.Add("@Price", SqlDbType.Int, 50).Value = Convert.ToInt32(AddPrice.Value);
                cmd.Parameters.Add("@NoOfAdults", SqlDbType.Int, 50).Value = Convert.ToInt32(AddAdultsNo.Value);
                cmd.Parameters.Add("@NoOfChildren", SqlDbType.Int, 50).Value = Convert.ToInt32(AddKidsNo.Value);
                cmd.Parameters.Add("@ImageLink", SqlDbType.NVarChar, int.MaxValue).Value = addImgLink.Text;

                // open connection, call stored procedure, close connection

                var result = cmd.ExecuteNonQuery();
                myConnection.Close();


            }

            Response.Write("<script language=javascript>alert('Done Adding Deals!');</script>");
            
        }
    }
}