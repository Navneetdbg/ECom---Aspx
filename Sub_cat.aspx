<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="Sub_cat.aspx.cs" Inherits="Sub_cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <div class="form-horizontal">
       <hr />
        <br />
        <h2>Add Sub Category</h2>
        <hr />
        <asp:Label ID="txt" runat="server"></asp:Label>
       <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2  control-label" Text="Category Name"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" ></asp:DropDownList>
                 
                                 </div>
            </div>
        
        <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2  control-label" Text="Sub Category Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="SubName" runat="server" CssClass="form-control"></asp:TextBox>
                                  </div>
            </div>
        <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-3">
                    <asp:Button ID="Add" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="Add_Click"/>
                   
              </div>
            </div>
       <div>
       <br/> 
         
        <br />
           <br/>
           <br />
           <br/>

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">All Sub Categories</div>
            <div class="panel-body">
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Sub Catogory</th>
                        <th>Categories</th>
                        <th></th>
                    </tr>

                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SubCatId") %></th>
                        <th><%# Eval("SubCatName") %></th>
                        <th><%# Eval("CategoryName") %></th>
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

