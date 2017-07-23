<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cat.aspx.cs" Inherits="Cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row" style="padding-top:80px;">
        <asp:Repeater ID="Repeater1" runat="server"> 
            <ItemTemplate>
                <div class="col-sm-6 col-md-3 " >
                    <a href="ProductDetail.aspx?PCatId=<%# Eval("PCatId") %>" style="text-decoration: none">
                        <br />
                        <div class="page-header" ><%# Eval("CategoryName") %></div>
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
               <script src="js/ImageHover.js"></script>
    </div>
</asp:Content>

