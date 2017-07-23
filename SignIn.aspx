<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>NaviWorld|SignIn</title>
    
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
    <form id="form1" runat="server">
       <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    <a class="navbar-brand" href="Index.aspx"><span><img alt="Logo" src="images/tc only 512.png" height="30"/></span>NaviWorld</a>
                </div>
                <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li ><a href="Index.aspx">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Gallary</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Product<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">Men</li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Shirt</a></li>
                            <li><a href="#">Pants</a></li>
                            <li><a href="#">Denim</a></li>
                             <li role="separator" class="divider"></li>
                               <li class="dropdown-header">Women</li>
                             <li role="separator" class="divider"></li>
                            <li><a href="#">Shirt</a></li>
                            <li><a href="#">Top</a></li>
                            <li><a href="#">Denim</a></li>
                        </ul>
                    </li>
                    <li class="active"><a href="SignUp.aspx">SignUp</a></li>
                        
                    
                </ul>
                    </div>
            </div>
        </div>
        <!--- signIn---->
    <div class="container body">
        <div class="form-horizontal">
            <h2>Login</h2>
            <hr/>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2  control-label" Text="Username"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="User" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="User Name is Reqired" ControlToValidate="User"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2  control-label" Text="Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Pass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="Password is required" ControlToValidate="Pass"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <asp:Label ID="Label3" runat="server" CssClass=" control-label" Text="Remember me"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-md-2  control-label"></asp:Label>
                <div class="col-md-3">
                    <asp:LinkButton ID="lnk_fgt" runat="server" OnClick="lnk_fgt_Click">Forget Password</asp:LinkButton>
                    </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2  control-label"></asp:Label>
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Submit" cssClass="btn btn-success" OnClick="Button1_Click"/>
                   
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2  control-label"></asp:Label>
                <div class="col-md-3">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/fb_icon_325x325.png" Height="40px" Width="40px" />      

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/google-plus.png" Height="40px" Width="40px" />      
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/Qfy0kRIP_400x400.jpg" Height="40px" Width="40px" />      
     </div>

                </div>
            </div>
            <div>
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Label ID="txt_error" runat="server" Text="" CssClass="text-danger"></asp:Label>
                    </div>
            </div>
             
        </div>
    </div>
   
          <hr />
        <footer class="footer-pos">
            <div class="container">
                
                <p>&copy; 2017 NaviWorld.com &middot; <a href="Index.aspx">Home</a>&middot; <a href="#">Contact Us</a>&middot; <a href="#">About Us</a>&middot; <a href="#">Product</a></p>
            </div>
        </footer>
        <!--footer---->
        </div>
    </form>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
