using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace DJResortOnline
{
    public partial class Deal : System.Web.UI.Page
    {

        List<Data> datas;


        public Deal()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_Deals", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;


                var result = cmd.ExecuteNonQuery();
                //myConnection.Close();


                DataTable dtList = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(dtList);

                string names = "";
                string img = "";
                int price = 0;
                string description = "";
                string path = "~\\image\\Deals\\";
                string folderPath = HttpContext.Current.Server.MapPath(path);
                List<Object> listObj = new List<Object>();
                datas = new List<Data>();
                foreach (DataRow row in dtList.Rows)
                {

                    names = row["DealsName"].ToString();
                    img = row["ImageLink"].ToString();
                    price = Convert.ToInt32(row["Price"]);
                    description = row["DealsDescription"].ToString();



                    


                    DirectoryInfo dir = new DirectoryInfo(folderPath);
                    FileInfo[] imageFiles = dir.GetFiles("*.jpg");
                    datas.Add(new Data
                    {
                        Name = row["DealsName"].ToString(),

                        Image = $"image/Deals/{imageFiles.AsEnumerable().Where(file => file.ToString().Contains(row["ImageLink"].ToString())).FirstOrDefault().ToString()}",

                        Price = Convert.ToInt32(row["Price"]),

                        Description = row["DealsDescription"].ToString()
                    });
                }

               
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = datas;
            Repeater1.DataBind();
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void LoadDeals()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_Deals", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;


                var result = cmd.ExecuteNonQuery();
                //myConnection.Close();


                DataTable dtList = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(dtList);

                string names = "";
                string img = "";
                string path = "~\\image\\Deals\\";
                string folderPath = HttpContext.Current.Server.MapPath(path);
                List<Object> listObj = new List<Object>();
                foreach (DataRow row in dtList.Rows)
                {

                    names = row["DealsName"].ToString();
                    img = row["ImageLink"].ToString();
                }
                    List<Data> datas = new List<Data>();

               
                DirectoryInfo dir = new DirectoryInfo(folderPath);
                FileInfo[] imageFiles = dir.GetFiles("*.jpg");
                    datas.Add(new Data
                    {
                        Name = names,

                        Image = $"image/{imageFiles.AsEnumerable().Where(file => file.ToString().Contains(img)).FirstOrDefault().ToString()}"
                    });
                }

           
        }

        }


    }

    class Data
    {
        public string Name { get; set; }

        public string Image { get; set; }

        public int Price { get; set; }
        public string Description { get; set; }
}




