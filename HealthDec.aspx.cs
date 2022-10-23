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
    public partial class HealthDec : System.Web.UI.Page
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool fever;
            bool cough;
            bool LossOfSmell;
            bool ShrtnessOfBreath;
            bool SoreThroat;
            bool BodyPain;
            bool Headache;
            bool WFamily = false;
            bool WContact = false;

            if (cbFever.Checked)
            {
                fever = true;
            }
            else
            {
                fever = false;
            }

            if (cbColds.Checked)
            {
                cough = true;
            }
            else
            {
                cough = false;
            }

            if (cbSmell.Checked)
            {
                LossOfSmell = true;
            }
            else
            {
                LossOfSmell = false;
            }

            if (cbBreath.Checked)
            {
                ShrtnessOfBreath = true;
            }
            else
            {
                ShrtnessOfBreath = false;
            }

            if (cbThroat.Checked)
            {
                SoreThroat = true;
            }
            else
            {
                SoreThroat = false;
            }

            if (cbBodyPain.Checked)
            {
                BodyPain = true;
            }
            else
            {
                BodyPain = false;
            }

            if (cbHeadache.Checked)
            {
                Headache = true;
            }
            else
            {
                Headache = false;
            }

            if (cbY.Checked)
            {
                WFamily = true;
            }
            
            if (cbN.Checked)
            {
                WFamily = false;
            }

            if (cbYes.Checked)
            {
                WContact = true;
            }

            if (cbNo.Checked)
            {
                WContact = false;
            }

            SqlConnection myConnection = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("AddHealthDec", myConnection);
                {

                    myConnection.Open();
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, int.MaxValue).Value = name.Value;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email.Value;
                    cmd.Parameters.Add("@ContactNumber", SqlDbType.NVarChar, int.MaxValue).Value = phone.Value;
                    cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50).Value = address.Value;
                    cmd.Parameters.Add("@Fever", SqlDbType.Bit, 50).Value = fever;
                    cmd.Parameters.Add("@CoughCold", SqlDbType.Bit, 50).Value = cough;
                    cmd.Parameters.Add("@LossOfSmell", SqlDbType.Bit, 50).Value = LossOfSmell;
                    cmd.Parameters.Add("@ShrtnessOfBreath", SqlDbType.Bit, 50).Value = ShrtnessOfBreath;
                    cmd.Parameters.Add("@SoreThroat", SqlDbType.Bit, 50).Value = SoreThroat;
                    cmd.Parameters.Add("@BodyPain", SqlDbType.Bit, 50).Value = BodyPain;
                    cmd.Parameters.Add("@Headache", SqlDbType.Bit, 50).Value = Headache;
                    cmd.Parameters.Add("@WithFamily", SqlDbType.Bit, 50).Value = WFamily;
                    cmd.Parameters.Add("@WithContact", SqlDbType.Bit, 50).Value = WContact;

                    var result = cmd.ExecuteNonQuery();
                    myConnection.Close();
                }
            Response.Write("<script language=javascript>alert('Halth Declaration Submitted!');</script>");
            ClearForm();
        }

        private void ClearForm()
        {
            name.Value = "";
            email.Value = "";
            phone.Value = "";
            address.Value ="";
            cbFever.Checked = false;
            cbColds.Checked = false;
            cbSmell.Checked = false;
            cbBreath.Checked = false;
            cbThroat.Checked = false;
            cbBodyPain.Checked = false;
            cbHeadache.Checked = false;
            cbY.Checked = false;
            cbN.Checked = false;
            cbYes.Checked = false;
            cbNo.Checked = false;

        }
    }
}