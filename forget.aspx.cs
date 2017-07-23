using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class forget : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_forget", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", User.Text);
        cmd.Parameters.AddWithValue("@Email", Email.Text);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            String myGuid = Guid.NewGuid().ToString();
            int Uid = Convert.ToInt32(dt.Rows[0][0]);
            SqlCommand cmd1 = new SqlCommand("insert into ForgetPass values('" + myGuid + "','"+Uid+"',getdate())",con);
            cmd1.ExecuteNonQuery();

            //Mail
            String ToEmailAddress = dt.Rows[0][4].ToString();
            String Name = dt.Rows[0][3].ToString();
            String Emailbody = "Hi" +Name+ ",<br/><br/> Click here To reset Your Password <br/><br/>http://localhost:57590/For.aspx?Uid="+myGuid;
            MailMessage msg = new MailMessage("arpgl123@gmail.com", ToEmailAddress);
            msg.Body = Emailbody;
            msg.IsBodyHtml = true;
            msg.Subject = "Password Reset";
            SmtpClient Smtp = new SmtpClient("smtp.gmail.com", 587);
            
            Smtp.Credentials = new NetworkCredential()
            {
                UserName = "arpgl123@gmail.com",
                Password = "arpgl12345"

            };

            Smtp.EnableSsl = true;

            Smtp.Send(msg);

            Label4.Text = "Check Your Email to reset Your Password";
            Label4.ForeColor = System.Drawing.Color.GreenYellow;
        }
        else
        {
            Label4.Text = "User Not Found";
            Label4.ForeColor = System.Drawing.Color.Red;
            
        }
        con.Close();
    }
}
    