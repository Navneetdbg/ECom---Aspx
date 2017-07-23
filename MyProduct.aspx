<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="MyProduct.aspx.cs" Inherits="MyProduct"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row" style="padding-top:80px;">
        <div class="form-control center control-label">
            <div class="col-md-2  ">
                <asp:DropDownList ID="Gender" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Gender_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="GenderName" DataValueField="GenderName"></asp:DropDownList>
                    </div>
            <div class="col-md-3">
                <asp:DropDownList ID="Category" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Category_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="CategoryName"></asp:DropDownList>
                            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="Brand" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Brand_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="BrandName" DataValueField="BrandName"></asp:DropDownList>
            </div>
   <br />
            <br />
        <asp:Repeater ID="Repeater1" runat="server"> 
            <ItemTemplate>
                <div class="col-sm-6 col-md-3" >
                    <a href="ProductDetail.aspx?PID=<%# Eval("Pid") %>" style="text-decoration: none">
                        <div class="thumbnail">
                           
                            <asp:Image ID="Image1" CssClass="bilder" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "P1")%>' runat="server" />
  
                            <div class="caption">

                                <div class="proName"><%# Eval("PName") %></div>
                                <div class="proPrice"><span class="proOgPrice"><%#Eval("PPrice") %></span><%#Eval("PSellPrice") %></div>

                            </div>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
            </div>
               <script src="js/ImageHover.js"></script>

    </div>

</asp:Content>

