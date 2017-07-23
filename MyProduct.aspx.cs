using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class MyProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductRepeater();
            Bindgender();
            BindCategory();
            BindBrands();

        }

    }

    private void BindBrands()
    {
        SqlCommand cmd = new SqlCommand("sp_Brand1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Brand.DataSource = dt;
            Brand.DataTextField = "BrandName";
            Brand.DataValueField = "BrandId";
            Brand.DataBind();
            Brand.Items.Insert(0, new ListItem("-Select-", "0"));
        }

    }

    private void BindCategory()
    {
        SqlCommand cmd = new SqlCommand("sp_Category1", con);

        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Category.DataSource = dt;
            Category.DataTextField = "CategoryName";
            Category.DataValueField = "CategoryId";
            Category.DataBind();
            Category.Items.Insert(0, new ListItem("-Select-", "0"));

        }

    }

    private void Bindgender()
    {
        SqlCommand cmd = new SqlCommand("sp_gender1", con);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Gender.DataSource = dt;
            Gender.DataTextField = "GenderName";
            Gender.DataValueField = "GenderId";
            Gender.DataBind();
            Gender.Items.Insert(0, new ListItem("-Select-", "0"));

        }

    }

    private void BindProductRepeater()
    { 
            SqlCommand cmd = new SqlCommand("Sp_PRoduct1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dtBrands = new DataTable();
            sda.Fill(dtBrands);
            Repeater1.DataSource = dtBrands;
            Repeater1.DataBind();
    
    }
 

    protected void Brand_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("sP_Brand0", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PBrand", Brand.SelectedItem.Value);

    }

    protected void Gender_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("spgender0", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PGender", Gender.SelectedItem.Value);
    }

    protected void Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("sp_cat", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.Parameters.AddWithValue("@PcatId", Category.SelectedItem.Value);
        con.Close();
        Repeater1.DataBind();

    }

 
}
    