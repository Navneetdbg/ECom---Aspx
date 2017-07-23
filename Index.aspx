<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

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
                    
                    <a class="navbar-brand" href="Index.aspx"><span><img alt="Logo" src="images/tc only 512.png" height="30"/></span>NaviWorld</a>
                </div>
                <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a><asp:Label ID="txt" runat="server" CssClass="text-info" Font-Bold="True" Font-Size="Larger"></asp:Label></a>
          </li>
                    <li class="active"><a href="Index.aspx">Home</a></li>
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
                     <li > 
                   <asp:Button ID="SignOut" CssClass="btn btn-default navbar-btn" Text="Log Out" runat="server" OnClick="SignOut_Click"/>
                 
                        </li>
                   
                </ul>
                    </div>
            </div>
        </div>
        <!----- corasole-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/Carousel 01.jpg" alt="..."/>
      <div class="carousel-caption">
          <h3>Iphone 7</h3>
          <p><a class="btn btn-lg btn-primary" role="button" href="SignIn.aspx">Buy Now</a></p>
        ...
      </div>
    </div>
    <div class="item">
      <img src="images/Carousel 02.jpg" alt="..."/>
      <div class="carousel-caption">
          <h3>Samsung Note</h3>
          <p><a class="btn btn-lg  btn-primary" role="button" href="SignIn.aspx">Buy Now</a></p>
        ...
      </div>
    </div>
      <div class="item">
      <img src="images/Carousel 03.jpg" alt="..."/>
      <div class="carousel-caption">
          <h3>Windows 10</h3>
          <p><a class="btn btn-lg btn-primary" role="button"  href="SignIn.aspx">Buy Now</a></p>
        ...
      </div>
    </div>
    ...
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
        <br />
        <br />
        <!----- corasole-->
        <!--- Middle---->
        <div class="container Custom">
        <div class="row">
            <div class="col-lg-4">
                <img class="img-circle" src="images/Thumb01.jpeg" alt="thumb01" width="140" height="140"/>
                <h2>Mobile</h2>
                <p>t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
            <p><a class="btn btn-default" role="button" href="#">View</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-circle" src="images/Thumb02.jpg" alt="thumb02" width="140" height="140"/>
                <h2>Men Wear</h2>
                <p>t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
            <p><a class="btn btn-default" role="button" href="#">View</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-circle" src="images/Thumb03.jpg" alt="thumb03" width="140" height="140"/>
                <h2>Shoes</h2>
                <p>t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
            <p><a class="btn btn-default" role="button" href="#">View</a></p>
            </div>
        </div>
            </div>
        <!--- Middle---->
        <!--footer---->
        <hr />
        <footer>
            <div class="container">
                <p class="pull-right">Back to Top</p>
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
