using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["USERNAME"] != null)
        {
            txt_suc.Text = "Login Success, welcome "+Session["USERNAME"].ToString()+"";
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }

    }

    protected void btn_signout_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("Index.aspx");

    }
}