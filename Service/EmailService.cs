using EAGetMail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI.WebControls;

namespace DJResortOnline.Service
{
    public class EmailService
    {
        MailServer oServer;
        MailClient oClient;

        public EmailService()
        {
            oServer = new MailServer("imap.gmail.com", "djresort.quezon@gmail.com", "lnpznqfjxnncibnz", ServerProtocol.Imap4);
            oClient = new MailClient("TryIt");
            oServer.SSLConnection = true;
            oServer.Port = 993;
            //oClient.GetMailInfosParam.GetMailInfosOptions = GetMailInfosOptionType.NewOnly;
            oClient.Connect(oServer);
        }

        public List<MailVM> GetMails()
        {
            MailInfo[] infos = oClient.GetMailInfos();
            List<MailVM> mailsVM = new List<MailVM>();

            for (int i = infos.Length - 1; i > 0; i--)
            {
                if (i == infos.Length - 10) break;
                MailInfo info = infos[i];
                Mail oMail = oClient.GetMail(info);

                if (oMail.From.ToString() == "<djresort.quezon@gmail.com>")
                {
                    oMail.From.Name = "Customer Inquiry";
                }
                mailsVM.Add(new MailVM 
                { 
                    Id = i, 
                    Sender = oMail.From.Name, 
                    Subject = oMail.Subject.Replace("(Trial Version)", ""), 
                    Email = oMail.From.Address,
                    ReceivedDate = oMail.ReceivedDate.ToString(""),
                    Body = oMail.TextBody
                });
            }

            return mailsVM;
        }

        public void SendEmail(string subject, string body, string recipient)
        {
            MailMessage mail = new MailMessage();
            mail.From = new System.Net.Mail.MailAddress("djresort.quezon@gmail.com");
            mail.To.Add(recipient);
            mail.Subject = subject;
            mail.Body = body;

            SmtpClient smpt = new SmtpClient("smtp.gmail.com", 587);

            smpt.UseDefaultCredentials = false;
            smpt.Credentials = new System.Net.NetworkCredential("djresort.quezon@gmail.com", "lnpznqfjxnncibnz");
            smpt.EnableSsl = true;
            smpt.Send(mail);
        }

        public class MailVM
        {
            public int Id { get; set; }
            public string Sender { get; set; }

            public string Subject { get; set; }

            public string Email { get; set; }

            public string ReceivedDate { get; set; }

            public string Body { get; set; }

        }
    }
}