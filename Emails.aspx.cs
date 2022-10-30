using DJResortOnline.Service;
using EAGetMail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DJResortOnline.Service.EmailService;

namespace DJResortOnline
{
    public partial class Emails : System.Web.UI.Page
    {
        EmailService _service;
        public static int _mailCount;

        public Emails()
        {
            _service = new EmailService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var mails = GetMails();
                BindMailsToGrid(mails);
            }
        }

        void BindMailsToGrid(List<MailVM> mails)
        {
            GridView1.DataSource = mails;
            GridView1.DataBind();
        }

        List<MailVM> GetMails()
        {
            List<MailVM> mails = _service.GetMails();

            Session["Mails"] = mails;

            _mailCount = mails.Count;

            return mails;
        }

        protected void gridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
                tc.BorderWidth = 0;
            }
        }

        protected void SenderLinkClicked(object sender, EventArgs e)
        {
            LinkButton lb = sender as LinkButton;
            int custID = Convert.ToInt32(lb.CommandArgument);

            List<MailVM> emails = (List<MailVM>)Session["Mails"];

            var mail = emails.Where(_ => _.Id == custID).FirstOrDefault();

            lblEmail.Text = mail.Email;
            lblSubject.Text = mail.Subject;
            lblBody.Text = mail.Body;

            ModalPopupExtender1.Show();
        }

        protected void CheckAll(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chckrw = (CheckBox)row.FindControl("CheckBox1");

                chckrw.Checked = CheckBox2.Checked ? true : false;
            }
        }

        protected void ReplyButtonClicked(object sender, EventArgs e)
        {
            if(lblEmail.Text == "djresort.quezon@gmail.com")
            {
                lblTo.Text = lblSubject.Text;
            }
            else
            {
                lblTo.Text = lblEmail.Text;
            }

            ModalPopupExtender1.Hide();
            ModalPopupExtender2.Show();
        }

        protected void CloseModalButtonClicked(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
            ModalPopupExtender2.Hide();
        }

        protected void SendMessage(object sender, EventArgs e)
        {
            _service.SendEmail(txtSubject.Text, txtBody.Text, lblTo.Text);
        }

        protected void CancelModalButtonClicked(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
            ModalPopupExtender1.Show();
        }

        protected void SearchEmailButtonClicked(object sender, EventArgs e)
        {
            var mails = (List<MailVM>)Session["Mails"];

            if (string.IsNullOrEmpty(txtSearch.Text)) BindMailsToGrid(mails);

            var filteredMails = mails.Where(_ => _.Sender.ToLower().Contains(txtSearch.Text) || _.Subject.ToLower().Contains(txtSearch.Text)).ToList();

            BindMailsToGrid(filteredMails);

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            var mails = GetMails();
            BindMailsToGrid(mails);
        }
    }
}