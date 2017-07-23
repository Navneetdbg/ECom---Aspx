<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>NaviWorld | Index</title>
     <script
        src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous">
    </script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/Cart.aspx";
            });
        });
    </script>
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

                        <a class="navbar-brand" href="Index.aspx"><span>
                            <img alt="Logo" src="images/tc only 512.png" height="30" /></span>NaviWorld</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a>
                                <asp:Label ID="txt" runat="server" CssClass="text-info" Font-Bold="True" Font-Size="Larger"></asp:Label></a>
                            </li>
                            <li class="active"><a href="Index.aspx">Home</a></li>
                            <li><a href="About.aspx">About Us</a></li>
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
                                    <li><a href="MyProduct.aspx">Shirt</a></li>
                                    <li><a href="#">Top</a></li>
                                    <li><a href="#">Denim</a></li>
                                </ul>
                            </li>
                            <li class="dropdown" id="l1" runat="server">
                                <a class="dropdown-toggle" data-toggle="dropdown">Account<b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li role="separator" class="divider"></li>
                                    <li><a href="SignIn.aspx">Login</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="SignUp.aspx">SignUp</a></li>
                                </ul>
                            </li>
                            <li>
                                <button id="btnCart" class="btn btn-primary navbar-btn" type="button" role="button">
                                    Cart <span class="badge" id="pCount" runat="server"></span>
                                </button>
                            </li>
                            <li>
                                <asp:Button ID="SignOut" CssClass="btn btn-default navbar-btn" Text="Log Out" runat="server" />

                            </li>

                        </ul>
                    </div>
                </div>
            </div>

            <div class="container">
                <h2 class="col-md-2">About Us</h2>
                <div class="center-page">
                <h3 >
                    When you have a great story about how your product or service was built to change lives, share it. The "About Us" page is a great place for it to live, too. Good stories humanize your brand, providing context and meaning for your product. What’s more, good stories are sticky -- which means people are more likely to connect with them and pass them on.

Yellow Leaf Hammocks tells users about its product by describing how the hammocks empower artisan weavers and their families. The company breaks down different pieces of the story into sections that combine words and easily digestible graphics, painting a picture instead of big chunks of text. They're clear about why they're different: "Not a Charity," the page reads. And then: "This is the basis for a brighter future, built on a hand up, not a handout."
                </h3>
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
    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
