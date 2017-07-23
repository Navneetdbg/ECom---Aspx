using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSize : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {
            BindBrans();
            BindCatagory();
            BindBrandsRptr();
            BindGender();

        }
    }

    private void BindBrandsRptr()
    {
        using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from Size A inner join Category B on B.CategoryId=A.CategoryId inner join Brand C on C.BrandId=A.BrandId inner join SubCategory D on D.SubCatId=A.SubCatId inner join Gender E on E.GenderId=A.GenderId", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                
                DataTable dtBrands = new DataTable();
                sda.Fill(dtBrands);
                rptrCategory.DataSource = dtBrands;
                rptrCategory.DataBind();
                
            }

        }
    }

    private void BindGender()
    {
        SqlCommand cmd = new SqlCommand("sp_gender1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            DropDownList4.DataSource = dt;
            DropDownList4.DataTextField = "GenderName";
            DropDownList4.DataValueField = "GenderId";
            DropDownList4.DataBind();
            DropDownList4.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        con.Close();

    }

    private void BindCatagory()
    {
        SqlCommand cmd = new SqlCommand(" sp_Category1", con);

        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "CategoryName";
            DropDownList2.DataValueField = "CategoryId";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        con.Close();
    }

    private void BindBrans()
    {
        SqlCommand cmd = new SqlCommand("sp_Brand1", con);

        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "BrandName";
            DropDownList1.DataValueField = "BrandId";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        con.Close();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MainCatId = Convert.ToInt32(DropDownList2.SelectedItem.Value);
        SqlCommand cmd = new SqlCommand("select * from SubCategory where MainCatID ='" + DropDownList2.SelectedItem.Value+"' ", con);

        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            DropDownList3.DataSource = dt;
            DropDownList3.DataTextField = "SubCatName";
            DropDownList3.DataValueField = "SubCatId";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        
    }

    protected void AddBrand_Click(object sender, EventArgs e)
    {
        if (Name.Text != null && DropDownList1.SelectedItem.Value != null && DropDownList2.SelectedItem.Value != null && DropDownList3.SelectedItem.Value != null && DropDownList4.SelectedItem.Value != null)
        {
            SqlCommand cmd = new SqlCommand("sp_size", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SizeName", Name.Text);
            cmd.Parameters.AddWithValue("@BrandId", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@catId", DropDownList2.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@subcat", DropDownList3.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@gender", DropDownList4.SelectedItem.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            Name.Text = string.Empty;
            DropDownList1.ClearSelection();
            DropDownList1.Items.FindByValue("0").Selected = true;
            DropDownList2.ClearSelection();
            DropDownList2.Items.FindByValue("0").Selected = true;
            DropDownList3.ClearSelection();
            DropDownList3.Items.FindByValue("0").Selected = true;
            DropDownList4.ClearSelection();
            DropDownList4.Items.FindByValue("0").Selected = true;
            BindBrandsRptr();
            con.Close();
        }
        else
        {
            Txt.Text = "All Detail is not Full Feild";
        }
    }
    
}