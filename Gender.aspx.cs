using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Gender : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddBrand_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("sp_gender", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@GenderName", BrandName.Text);

        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        BrandName.Text = string.Empty;
    }
}