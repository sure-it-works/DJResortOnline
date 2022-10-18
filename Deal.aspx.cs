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

        //List<Data> datas;
        //List<DB_Data> from_DB;

        //public Deal()
        //{
        //    from_DB = new List<DB_Data>()
        //    {
        //        new DB_Data{ Name= "Ludwig", Image = "Image1" },
        //        new DB_Data{ Name = "Ivan", Image = "Image2"}
        //    };

        //    datas = new List<Data>();

        //    from_DB.ForEach(data =>
        //    {
        //        DirectoryInfo dir = new DirectoryInfo(@"image\Deals");
        //        FileInfo[] imageFiles = dir.GetFiles("*.jpg");

        //        datas.Add(new Data
        //        {
        //            Name = data.Name,
        //            Image = $"images/{imageFiles.AsEnumerable().Where(file => file.ToString().Contains(data.Image)).FirstOrDefault().ToString()}"
        //        });
        //    });
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDeals();
            //Repeater1.DataSource = datas;
            //Repeater1.DataBind();
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
                myConnection.Close();


                DataTable dtList = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(dtList);

                string names = "";
                string img = "";
                string path = "~\\image\\Deals\\";
                string folderPath = HttpContext.Current.Server.MapPath(path);
                List<Object> listObj = new List<Object>();
                 foreach(DataRow row in dtList.Rows)
                {
                    
                    names = row["DealsName"].ToString();
                    img = row["ImageLink"].ToString();

                    List<Data> datas = new List<Data>();

                    DirectoryInfo dir = new DirectoryInfo(@"image\Deals");
                    FileInfo[] imageFiles = dir.GetFiles("*.jpg");
                    datas.Add(new Data
                    {
                    //    Name = names;
                    ////Image = Convert.ToString(Directory.GetFiles(path, "*.xml", SearchOption.AllDirectories));
                    ////Name = data.Name,
                    //Image = $"image/{imageFiles.AsEnumerable().Where(file => file.ToString().Contains(img)).FirstOrDefault().ToString()}"
                });
                }
               
               
            }

            Response.Write("<script language=javascript>alert('Feedback Submitted!');</script>");

        }
    }

    class Data
    {
        public string Name { get; set; }

        public string Image { get; set; }
    }

    class DB_Data
    {
        public string Name { get; set; }

        public string Image { get; set; }
    }
}