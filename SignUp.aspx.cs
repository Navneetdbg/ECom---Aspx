using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SignUp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (UserId.Text != "" && Password.Text != "" && Name.Text != "" && Email.Text != "")
        {
            if (Password.Text == tb_Confirm.Text)
            {
                SqlCommand cmd = new SqlCommand("Sp_SignUp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username",UserId.Text);
                cmd.Parameters.AddWithValue("@Password", Password.Text);
                cmd.Parameters.AddWithValue("@Name", Name.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
                cmd.Parameters.AddWithValue("@Usertype", "U");



                con.Open();
                int k = (int)cmd.ExecuteNonQuery();
                if (k == 1)
                {
                    //Label4.Text = "Record Inserted Succesfully into the Database";
                    //Label4.ForeColor = System.Drawing.Color.CornflowerBlue;
                    Response.Redirect("SignIn.aspx");
                }
                else
                {
                    Label4.Text = "Please enter credential carefully";
                    Label4.ForeColor = System.Drawing.Color.Red;
                }

                con.Close();
            }

            else
            {
                Label4.Text = "Password Don't match";
                Label4.ForeColor = System.Drawing.Color.Red;
            }
        }

        else
        {
            Label4.Text = "Please enter credential carefully";
            Label4.ForeColor = System.Drawing.Color.Red;
        }

        UserId.Text = string.Empty;
        Password.Text = string.Empty;
        Name.Text = string.Empty;
        Email.Text = string.Empty;
        tb_Confirm.Text = string.Empty;

    }
}
