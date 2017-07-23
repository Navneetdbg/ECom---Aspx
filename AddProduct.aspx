<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <div class="form-horizontal">
        <h2>Add Product</h2>
        <hr />
        <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2  control-label" Text="Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox>
                             </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2  control-label" Text="Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Price" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2  control-label" Text="Selling Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Selling" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                 </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2  control-label" Text="Brand"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="Brand" runat="server" CssClass="form-control"></asp:DropDownList>
                              </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2  control-label" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="Category" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Category_SelectedIndexChanged"></asp:DropDownList>
                             </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-2  control-label" Text="Sub-Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="Sub" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Sub_SelectedIndexChanged"></asp:DropDownList>
                                  </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label18" runat="server" CssClass="col-md-2  control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="Gender" runat="server" CssClass="form-control" OnSelectedIndexChanged="Gender_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2  control-label" Text="Size"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBoxList ID="Size" runat="server" CssClass="form-control" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:CheckBoxList>
                </div>
            </div>
       <%-- <div class="form-group">
                <asp:Label ID="Label20" runat="server" CssClass="col-md-2  control-label" Text="Quantity"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="text-danger" ErrorMessage="this feild is Reqired" ControlToValidate="Price"></asp:RequiredFieldValidator>
                </div>
            </div>--%>
         
        <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-md-2  control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Description" runat="server" CssClass="form-control"></asp:TextBox>
                          </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label9" runat="server" CssClass="col-md-2  control-label" Text="Product Detail"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Productdtl" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                           </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label10" runat="server" CssClass="col-md-2  control-label" Text="Meterial And Care"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="MetCare" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                         </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label11" runat="server" CssClass="col-md-2  control-label" Text="Upload File"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                             </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label12" runat="server" CssClass="col-md-2  control-label" Text="Upload File"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control"/>
                           </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label13" runat="server" CssClass="col-md-2  control-label" Text="Upload File"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control"/>
                              </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label14" runat="server" CssClass="col-md-2  control-label" Text="Upload File"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload4" runat="server" CssClass="form-control" />
                             </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label15" runat="server" CssClass="col-md-2  control-label" Text="Upload File"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload5" runat="server" CssClass="form-control"/>
                             </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label19" runat="server" CssClass="col-md-2  control-label" Text="Free Delivery"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="free" runat="server" />
                 </div>
            </div>
         <div class="form-group">
                <asp:Label ID="Label16" runat="server" CssClass="col-md-2  control-label" Text="30 Days Return"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="txt30" runat="server" />
                 </div>
            </div>
        <div class="form-group">
                <asp:Label ID="Label17" runat="server" CssClass="col-md-2  control-label" Text="COD"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="txtcod" runat="server" />
                   </div>
            </div>
        <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="Button1_Click"/>
                   
              </div>
            </div>

    </div>
</div>
</asp:Content>

