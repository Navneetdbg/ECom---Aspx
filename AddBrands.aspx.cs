using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class AddBrands : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTable();
        }
        
    }

    private void BindTable()
    {
        
        using (SqlCommand cmd = new SqlCommand("sp_Brand1", con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }

    }

    protected void AddBrand_Click(object sender, EventArgs e)
    {
        if (BrandName.Text != null)
        {
            SqlCommand cmd = new SqlCommand("sp_Brand", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BrandName", BrandName.Text);

            con.Open();
            cmd.ExecuteNonQuery();

           
            BrandName.Text = string.Empty;
        }
        
    }

    
}