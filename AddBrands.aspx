<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="AddBrands.aspx.cs" Inherits="AddBrands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container">
    <div class="form-horizontal">
        <h2>Add Brand</h2>
        <hr />
        <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2  control-label" Text="Brand Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="BrandName" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
            </div>
       
        <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-3">
                    <asp:Button ID="AddBrand" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="AddBrand_Click"/>
                   
              </div>
      
                  </div>
         
       <div>
        
         <h1 class="col-md-2">Brands</h1>
        <br />
           <br/>
           <br />
           <br/>

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">All Brand</div>
            <div class="panel-body">
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Brands</th>
                        <th></th>
                    </tr>

                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("BrandId") %></th>
                        <th><%# Eval("BrandName") %></th>
                        <th>Edit</th>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
                </asp:Repeater>
            
        </div>
        </div>
        </div>
 </div>

</asp:Content>

