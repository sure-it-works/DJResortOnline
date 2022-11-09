using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Web;
using ListItem = System.Web.UI.WebControls.ListItem;

namespace DJResortOnline
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGrid();
                checkInDrpDwn();


            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DJConnections"].ConnectionString;
        }

        private void BindGrid()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Get_ReservationInvoice", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvInvoice.DataSource = dt;
                    gvInvoice.DataBind();
                }
            }
        }

        

        protected void gvInvoice_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        private void filteredGV()
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("SearchReservationInvoice", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();

            //cmd.Parameters.Add("@Name", SqlDbType.NVarChar, int.MaxValue).Value = txtSearch.Value;
            cmd.Parameters.AddWithValue("@Name", "%" + txtSearch.Value + "%");

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = myConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvInvoice.DataSource = dt;
                    gvInvoice.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            filteredGV();
        }

        protected void ExportToPDF(object sender, EventArgs e)
        {
            filteredGV();
            if (gvInvoice.Rows.Count > 0)
            {
                using (StringWriter sw = new StringWriter())
                {
                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    {
                        //To Export all pages
                        gvInvoice.AllowPaging = false;
                        filteredGV();

                        gvInvoice.RenderControl(hw);
                        StringReader sr = new StringReader(sw.ToString());
                        Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
#pragma warning disable CS0612 // Type or member is obsolete
                        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
#pragma warning restore CS0612 // Type or member is obsolete
                        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                        pdfDoc.Open();
                        htmlparser.Parse(sr);
                        pdfDoc.Close();

                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-disposition", "attachment;filename=InvoiceExport.pdf");
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.Write(pdfDoc);
                        Response.End();
                    }
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('The document has no page. Can't save file!');</script>");
            }
        }

        protected void gvInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            gvInvoice.PageIndex = e.NewPageIndex;
            gvInvoice.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

       

        private void checkInDrpDwn()
        {
            try
            {

                SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("Get_InvoiceCheckIn", myConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                myConnection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = myConnection;
                    sda.SelectCommand = cmd;
                    using (DataSet dt = new DataSet())
                    {
                        sda.Fill(dt);

                       
                        
                        ListItem list = new ListItem();
                        list.Text = "PLEASE SELECT";

                       

                        ddlCheckIn.DataSource = dt.Tables[0];
                        ddlCheckIn.DataTextField = "CheckIn";
                        ddlCheckIn.DataValueField = "CheckIn";
                        ddlCheckIn.DataBind();
                        ddlCheckIn.Items.Insert(0, list);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }



        protected void ddlCheckIn_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("Filter_InvoiceCheckIn", myConnection);
            {
                myConnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@CheckIn", SqlDbType.NVarChar, int.MaxValue).Value = ddlCheckIn.SelectedItem.Text;

                // open connection, call stored procedure, close connection
                if (ddlCheckIn.SelectedItem.Text == "PLEASE SELECT")
                {
                    BindGrid();
                }
                else
                {


                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = myConnection;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvInvoice.DataSource = dt;
                            gvInvoice.DataBind();
                        }
                    }

                    var result = cmd.ExecuteNonQuery();
                    myConnection.Close();

                }
            }
        }
    }
}