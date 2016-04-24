using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class site_sub : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void sendEmail()
    {
        string msg = "<h3>PLATINUM HATS: CONTACT</h3><br/>";
        msg += "<b>Full name: </b>" + txtFullName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Lời nhắn: </b>" + txtContent.Text.Trim().ToString();
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "Contact PLATINUM HATS", msg, true);
    }
    protected void btSend_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if (RadCaptcha1.IsValid)
            //{

                //send email         
                sendEmail();
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                //lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                //lblMessage.Visible = true;
                //lblMessage.Text = "";
                //
                //Clear text
                //
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtContent.Text = "";
            //}
            //else
            //{
            //    lblMessage.Text = "Chuỗi xác nhận chưa đúng !";
            //}
        }
    }
}
