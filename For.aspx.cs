using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class For : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    String GUIDValue;
    DataTable dt = new DataTable();
    int Uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        GUIDValue = Request.QueryString["Uid"];
        

        if(GUIDValue != null)
        {
            SqlCommand cmd = new SqlCommand("Select * from ForgetPass where id = '"+GUIDValue+"'",con);
            con.Open();
            SqlDataAdapter Adp = new SqlDataAdapter(cmd);
            Adp.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Uid = Convert.ToInt32(dt.Rows[0][1]);
            }

            else
            {
                Label4.Text = "Not Valid Or Link Expired";
                Label4.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            Response.Redirect("~/Index.aspx");

        }

        if(!IsPostBack)
        {
            if(dt.Rows.Count != 0)
            {
                User.Visible = true;
                Pass.Visible = true;
                Label1.Visible = true;
                Label2.Visible = true;
                Label4.Visible = true;
                Button1.Visible = true;

            }
            else
            {
                Label4.Text = "Not Valid Or Link Expired";
                Label4.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        if(User.Text == Pass.Text)
        {
            SqlCommand cmd = new SqlCommand("sp_Update", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Uid", Uid);
            cmd.Parameters.AddWithValue("@Password", User.Text);
          
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("sp_delete", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@Uid", Uid);
            cmd1.ExecuteNonQuery();
            
            Response.Redirect("~/SignIn.aspx");
            
        }
    }
}