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
                    if (Addimage.HasFile)
                    {
                        if(File.Exists(@Path.Combine(folderPath, Addimage.FileName)))
                        {
                            Response.Write("<script>alert('Filename Already Exists! Please change your filename!');</script>");
                            valid = false;
                        }
                        else
                        {
                            Addimage.SaveAs(Path.Combine(folderPath, Addimage.FileName));
                            addImgLink.Text = Addimage.FileName;
                            valid = true;
                        }
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
                    if (Addimage.HasFile)
                    {
                        if (File.Exists(@Path.Combine(folderPath, Addimage.FileName)))
                        {
                            Response.Write("<script>alert('Filename Already Exists! Please change your filename!');</script>");
                            valid = false;
                        }
                        else
                        {
                            Addimage.SaveAs(Path.Combine(folderPath, Addimage.FileName));
                            addImgLink.Text = Addimage.FileName;
                            valid = true;
                        }
                    }
                    else
                    {

                        Response.Write("<script>alert('Add some attachment/s!');</script>");
                        Response.Write("<script>alert('Deals not saved!');</script>");
                        valid = false;
                    }
                }



                if (valid)
                {
                    addDeal();
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
        

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (saveReport(true))
            {
                clearFrom();
                Response.Redirect("PriceList.aspx");
            }
        }

        private void clearFrom()
        {
            addDealsName.Value = "";
            AddTxtDescription.Value = "";
            AddPrice.Value = "";
            AddAdultsNo.Value = "";
            AddKidsNo.Value = "";
            addImgLink.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("PriceList.aspx");
        }
    }
}