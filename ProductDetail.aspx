<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  <div style="padding-top: 50px">
        <div class="col-md-5">
            <div style="max-width: 480px" class="thumbnail">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <asp:Repeater ID="rptrImages" runat="server">
                            <ItemTemplate>
                                <div class="item <%# GetActiveClass(Container.ItemIndex) %>">
                                  <%--  <img src="Img/<%#Eval("Pid") %>/<%#Eval("PName") %><%#Eval("P1") %>" onerror="this.src='images/noimage.jpg'">--%>
                                <asp:Image ID="Image1" CssClass="bilder" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "P1")%>' runat="server"/>
                           <%--     <asp:Image ID="Image2" CssClass="bilder" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "P2")%>' runat="server"/>
                                <asp:Image ID="Image3" CssClass="bilder" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "P3")%>' runat="server"/>
                                <asp:Image ID="Image4" CssClass="bilder" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "P4")%>' runat="server"/>
                                <asp:Image ID="Image5" CssClass="bilder" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "P5")%>' runat="server"/>
                                </div>--%>
                                    </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <asp:Repeater ID="rptrProductDetails" OnItemDataBound="rptrProductDetails_ItemDataBound" runat="server">
                <ItemTemplate>
                    <div class="divDet1">
                        <h1 class="proNameView"><%#Eval("PName") %></h1>
                        <span class="proOgPriceView"><%#Eval("PPrice") %></span><span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSellPrice"))) %> OFF</span>
                        <p class="proPriceView"><%#Eval("PSellPrice") %></p>
                    </div>
                    <div>
                        <h5 class="h5Size">SIZE</h5>
                        <div>
                            <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="divDet1">
                        <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="mainButton" runat="server" Text="ADD TO CART" />
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="divDet1">
                        <h5 class="h5Size">Description</h5>
                        <p>
                            <%#Eval("PDescription") %>
                        </p>
                        <h5 class="h5Size">Product Details</h5>
                        <p>
                            <%#Eval("PDetail") %>
                        </p>
                        <h5 class="h5Size">Material & Care</h5>
                        <p>
                            <%#Eval("PMet") %>
                        </p>
                    </div>
                    <div>
                        <p><%# ((int)Eval("Free")==1)?"Free Delivery":"" %></p>
                        <p><%# ((int)Eval("Return")==1)?"30 Days Returns":"" %></p>
                        <p><%# ((int)Eval("COD")==1)?"Cash on Delivery":"" %></p>
                    </div>

                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("PCatId") %>' runat="server" />
                    <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />
                    <asp:HiddenField ID="hfGenderID" Value='<%# Eval("PGender") %>' runat="server" />
                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandId") %>' runat="server" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

