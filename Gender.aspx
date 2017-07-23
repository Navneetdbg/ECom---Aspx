<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="Gender.aspx.cs" Inherits="Gender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="container">
    <div class="form-horizontal">
        <h2>Add Brand</h2>
        <hr />
        <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2  control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="BrandName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="This feild is Reqired" ControlToValidate="BrandName"></asp:RequiredFieldValidator>
                </div>
            </div>
       
        <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-3">
                    <asp:Button ID="AddBrand" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="AddBrand_Click" />
                   
              </div>
      
                  </div>
        </div>
          </div>

</asp:Content>

