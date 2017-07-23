using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cat : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        BindProductRepeater();

    }
    private void BindProductRepeater()
    {

        using (SqlCommand cmd = new SqlCommand("sp_cat", con))
        {
            cmd.CommandType = CommandType.StoredProcedure;

            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dtBrands = new DataTable();
                sda.Fill(dtBrands);
                Repeater1.DataSource = dtBrands;
                Repeater1.DataBind();
            }



        }
    }

}