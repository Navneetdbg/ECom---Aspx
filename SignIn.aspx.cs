using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class SignIn : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //checkAuthorization();

        if(!IsPostBack)
        {
            if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
            {
                User.Text = Request.Cookies["UNAME"].Value;
                Pass.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    //private void checkAuthorization()
    //{
    //    string app_id = "1334449766683658";
    //    if(Request["code"]==null)
    //    {
    //        Response.Redirect(string.Format("https://graph.facebook.com/oauth/authorize?clientid={0}&redirecturl{1}&scope{2}",));
    //    }
    //}

    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Sp_SignIn", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username",User.Text);
        cmd.Parameters.AddWithValue("@Password", Pass.Text);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            if (CheckBox1.Checked)
            {
                Response.Cookies["UName"].Value = User.Text;
                Response.Cookies["UPass"].Value = Pass.Text;

                Response.Cookies["UName"].Expires = DateTime.Now.AddMinutes(30);
                Response.Cookies["UPass"].Expires = DateTime.Now.AddMinutes(30);

                
            }
            else
            {
                Response.Cookies["UName"].Expires = DateTime.Now.AddMinutes(-1);
                Response.Cookies["UPass"].Expires = DateTime.Now.AddMinutes(-1);
            }

            string Utype;
            Utype = dt.Rows[0][5].ToString().Trim();
            if(Utype == "U")
            {
                Session["USERNAME"] = User.Text;
                Response.Redirect("http://localhost:57590/Index.aspx");
            }

            if (Utype == "A")
            {
                Session["USERNAME"] = User.Text;
                Response.Redirect("http://localhost:57590/AddBrands.aspx");
            }


        }
        else
        {
            txt_error.Text = "Invalid Username or Password";
        }
       
 }

    protected void lnk_fgt_Click(object sender, EventArgs e)
    {
        Response.Redirect("forget.aspx");
    }

   
}
