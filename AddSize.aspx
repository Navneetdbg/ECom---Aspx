<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Product</h2>
            <hr />
            <asp:Label ID="Txt" runat="server" ></asp:Label>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2  control-label" Text="Size Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox>
                                 </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2  control-label" Text="Brand"></asp:Label>
                
                <div class="col-md-3">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
            </div>


            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2  control-label" Text="Category"></asp:Label>
              
                <div class="col-md-3">
                      <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                                          </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2  control-label" Text="Sub Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control"></asp:DropDownList>
                                         </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2  control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control"></asp:DropDownList>
                                          </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-3">
                    <asp:Button ID="AddBrand" runat="server" Text="Add" CssClass="btn btn-default" OnClick="AddBrand_Click"/>
                    
                </div>
            </div>
        </div>
           <h1>Size</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">All Size</div>

            <asp:Repeater ID="rptrCategory" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Brand</th>
                                <th>Category</th>
                                <th>Sub Category</th>
                                <th>Gender</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SizeId") %></th>
                        <th><%# Eval("SizeName") %></th>
                        <th><%# Eval("BrandName") %></th>
                        <th><%# Eval("CategoryName") %></th>
                        <td><%# Eval("SubCatName") %></td>
                        <td><%# Eval("GenderName") %></td>
                        <td>Edit</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
        
</asp:Content>

