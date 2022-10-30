using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DJResortOnline
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void AuthorizeLogin()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_AdminUser", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;

                cmd.Parameters.AddWithValue("Username", Username.Value);
                cmd.Parameters.AddWithValue("Password", Password.Value);
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    
                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('You have entered an invalid username or password!');</script>");
                        Username.Value = "";
                        Password.Value = "";
                    }



                }
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            AuthorizeLogin();
        }
    }
}