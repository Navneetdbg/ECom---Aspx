using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["USERNAME"] != null)
        {
            l1.Visible = false;
            txt.Text = Session["USERNAME"].ToString();

        }
        else
        {
            SignOut.Visible = false;
            //string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            //string[] ProductArray = CookiePID.Split(',');
            //int ProductCount = ProductArray.Length;
            //pCount.InnerText = ProductCount.ToString();

        }

    }

    private void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }



protected void SignOut_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("Index.aspx");
    }

    protected void Buy_Click(object sender , EventArgs e)
    {
       
    }
}