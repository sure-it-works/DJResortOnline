using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;



namespace DJResortOnline
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ShowClientsCount();
                ShowAvailableRooms();
                GetClientsCountWk();
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void ShowClientsCount()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_ClientsCount", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);

                    ClientsCount.InnerText = dt.Rows[0]["Clients"].ToString();
                }
            }

        }

        private void GetClientsCountWk()

        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_ClientsCountWeek", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;

                using (DataSet dt = new DataSet())
                {
                    sda.Fill(dt);
                    Chart1.DataSource = dt;
                }
            }
        }

        private void ShowAvailableRooms()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_AvailableRooms", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);

                    AvailableRoom.InnerText = dt.Rows[0]["AvailableRooms"].ToString();
                }
            }

        }
    }


}