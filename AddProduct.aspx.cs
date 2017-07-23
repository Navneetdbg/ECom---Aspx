using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;


public partial class AddProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if(!IsPostBack)
        {
            bindBrand();
            bindCategory();
            bindGender();
            bindSize();
            Sub.Enabled = false;
            Gender.Enabled = false;
           


        }
    }

    private void bindSize()
    {

        SqlCommand cmd = new SqlCommand("sp_size1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Size.DataSource = dt;
            Size.DataTextField = "SizeName";
            Size.DataValueField = "SizeId";
            Size.DataBind();
            Size.Items.Insert(0, new ListItem("-Select-", "0"));

        }
      
       
    }

    private void bindGender()
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

    private void bindCategory()
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

    private void bindBrand()
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

    protected void Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MainCatId = Convert.ToInt32(Category.SelectedItem.Value);
        SqlCommand cmd = new SqlCommand("select * from SubCategory where MainCatId ='" + Category.SelectedItem.Value + "' ", con);


        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Sub.DataSource = dt;
            Sub.DataTextField = "SubCatName";
            Sub.DataValueField = "SubCatId";
            Sub.DataBind();
            Sub.Items.Insert(0, new ListItem("-Select-", "0"));
            Sub.Enabled = true;

        }


    }




    protected void Gender_SelectedIndexChanged(object sender, EventArgs e)
    {


        SqlCommand cmd = new SqlCommand("select * from Size where BrandID='" + Brand.SelectedItem.Value + "' and CategoryId='" + Category.SelectedItem.Value + "'and SubCatId='" + Sub.SelectedItem.Value + "'and GenderId='" + Gender.SelectedItem.Value + "'", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            Size.DataSource = dt;
            Size.DataTextField = "SizeName";
            Size.DataValueField = "SizeId";
            Size.DataBind();

        }
        else
        {
            Size.Items.Clear();
        }
    }



    protected void Sub_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Sub.SelectedIndex != 0)
        {
            Gender.Enabled = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Name.Text != null && Price.Text != null && Selling.Text != null && Brand.SelectedItem.Value != null && Category.SelectedItem.Value != null && Sub.SelectedItem.Value != null && Gender.SelectedItem.Value != null && Description.Text != null && MetCare.Text != null && Productdtl.Text != null)
        {
            string path1 = "";
            path1 = "~/Img/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(path1));

            string path2 = "";
            path2 = "~/Img/" + FileUpload2.FileName;
            FileUpload2.SaveAs(Server.MapPath(path2));

            string path3 = "";
            path3 = "~/Img/" + FileUpload3.FileName;
            FileUpload3.SaveAs(Server.MapPath(path3));

            string path4 = "";
            path4 = "~/Img/" + FileUpload4.FileName;
            FileUpload4.SaveAs(Server.MapPath(path4));

            string path5 = "";
            path5 = "~/Img/" + FileUpload5.FileName;
            FileUpload5.SaveAs(Server.MapPath(path5));

            SqlCommand cmd = new SqlCommand("sp_Project", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName", Name.Text);
            cmd.Parameters.AddWithValue("@PPrice", Price.Text);
            cmd.Parameters.AddWithValue("@PSellPrice", Selling.Text);
            cmd.Parameters.AddWithValue("@PBrand", Brand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PCatId", Category.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@SubCatId", Sub.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PGender", Gender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDesc", Description.Text);
            cmd.Parameters.AddWithValue("@PDetail", Productdtl.Text);
            cmd.Parameters.AddWithValue("@PMet", MetCare.Text);
            cmd.Parameters.AddWithValue("@P1", path1);
            cmd.Parameters.AddWithValue("@P2", path2);
            cmd.Parameters.AddWithValue("@P3", path3);
            cmd.Parameters.AddWithValue("@P4", path4);
            cmd.Parameters.AddWithValue("@P5", path5);

            if (free.Checked == true)
            {
                cmd.Parameters.AddWithValue("@free", 1.ToString());

            }
            else
            {
                cmd.Parameters.AddWithValue("@free", 0.ToString());
            }

            if (txtcod.Checked == true)
            {
                cmd.Parameters.AddWithValue("@COD", 1.ToString());

            }
            else
            {
                cmd.Parameters.AddWithValue("@COD", 0.ToString());

            }
            if (txt30.Checked == true)
            {
                cmd.Parameters.AddWithValue("@replace", 1.ToString());

            }
            else
            {
                cmd.Parameters.AddWithValue("@replace", 0.ToString());
            }
            con.Open();
            int k = (int)cmd.ExecuteNonQuery();

            if(k ==1)
            {
                Response.Write("<Script>alert('Data recorded');/<Script>");
            }
           else
            {
                Response.Write("<Script>alert('Data not recorded');/<Script>");
            }

            con.Close();


            Name.Text = string.Empty;
            Price.Text = string.Empty;
            Selling.Text = string.Empty;
            Brand.ClearSelection();
            Category.ClearSelection();
            Sub.ClearSelection();
            Gender.ClearSelection();
            Description.Text = string.Empty;
            MetCare.Text = string.Empty;
            Productdtl.Text = string.Empty;
        }
        else
        {
            Response.Write("<Script>alert('Product Cannot be Added');</Script>");
        }

    }
        


    }
         



    
