using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Sub_cat : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindMainCategory();
            BindTable();
        }

    }

    private void BindTable()
    {
        using (SqlCommand cmd = new SqlCommand("select A.*,B.* from SubCategory A inner join Category B on B.CategoryId=A.MainCatID", con))
        {
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                adp.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }

    private void BindMainCategory()
    {
        SqlCommand cmd = new SqlCommand("sp_Category1", con);

        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "CategoryName";
            DropDownList1.DataValueField = "CategoryId";
           DropDownList1. DataBind();
            DropDownList1.Items.Insert(0, new ListItem("-Select-", "0"));

        }

    }

    protected void Add_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value != null && SubName.Text != null)
        {
            SqlCommand cmd = new SqlCommand("insert into SubCategory values('" + SubName.Text + "','" + DropDownList1.SelectedItem.Value + "')", con);

            con.Open();
            cmd.ExecuteNonQuery();
            SubName.Text = string.Empty;
            DropDownList1.ClearSelection();
            DropDownList1.Items.FindByValue("0").Selected = true;
        }
        else
        {
            txt.Text = "Required Feild not FullFeild";
        }
       

    }
}