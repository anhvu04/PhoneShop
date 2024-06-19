<%-- 
    Document   : home
    Created on : Jan 26, 2024, 9:48:35 AM
    Author     : Dash F15
--%>

<%@page import="model.AdminDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>HOME FPTU_HCM PRJ301</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .dropbtn {
                background-color: #1E1F29;
                color: whitesmoke;
                padding: 10px;
                font-size: 13px;
                border: none;
                cursor: pointer;
            }

            /* Dropdown button on hover & focus */
            .dropbtn:hover, .dropbtn:focus {
                font-weight: bolder;
            }

            /* The container <div> - needed to position the dropdown content */
            .dropdown {
                position: relative;
                display: inline-block;
            }

            /* Dropdown Content (Hidden by Default) */
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            /* Links inside the dropdown */
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            /* Change color of dropdown links on hover */
            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            /* Show the dropdown menu on hover */
            .dropdown:hover .dropdown-content {
                display: block;
            }
        </style>
    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left" style="color: white">
                        <li><i class="fa fa-phone"></i> +84 0123456789</li>
                        <li><i class="fa fa-envelope-o"></i> vupase183291@fpt.edu.vn</li>
                        <li><i class="fa fa-map-marker"></i> Khu CNC, TP.Thủ Đức, TP. Hồ Chí Minh</li>
                    </ul>
                    <ul class="header-links pull-right" >
                        <c:if test="${(sessionScope.account == null)}">
                            <li><a href="login"><i class="fa fa-user-o"></i>Login</a></li>   
                            </c:if>

                        <c:if test="${(sessionScope.account != null)}">                               
                            <div class="dropdown">
                                <button class="dropbtn"><i class="fa fa-user-o"></i>&nbsp;Hello ${sessionScope.account.username}</button>
                                <div class="dropdown-content">
                                    <a href="profile">Edit Profile</a>
                                    <a href="logout">Logout</a>
                                </div>
                            </div>
                        </c:if>

                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    <img src="./img/icon.jpg" alt="" height="100px" width="130px">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="list" method="get">
                                    <select class="input-select" name="id">
                                        <option value="0">All Categories</option>
                                        <c:forEach items="${sessionScope.list}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                    <input class="input" placeholder="Search here" name="key">
                                    <input type="submit" class="search-btn" value="Search"/>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div class="dropdown">
                                    <a href="cart.jsp">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <c:if test="${(sessionScope.account != null)}">
                                            <span>(${sessionScope.size})</span>
                                        </c:if>
                                    </a>
                                </div>
                                <!-- /Cart -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->

                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="home">Home</a></li>
                            <c:forEach items="${sessionScope.list}" var="c">
                            <li><a href="list?id=${c.id}">${c.name}</a></li>
                            </c:forEach>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${requestScope.ip1.image}" alt="" height="100%">
                            </div>
                            <div class="shop-body">
                                <h3>Iphone<br>Collection</h3>
                                <a href="list?id=${requestScope.ip1.category.id}" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${requestScope.sam1.image}" alt="" height="100%">
                            </div>
                            <div class="shop-body">
                                <h3>Samsung<br>Collection</h3>
                                <a href="list?id=${requestScope.sam1.category.id}" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${requestScope.op1.image}" alt="" height="100%">
                            </div>
                            <div class="shop-body">
                                <h3>Oppo<br>Collection</h3>
                                <a href="list?id=${requestScope.op1.category.id}" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->

                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div>
                                        <!-- product -->
                                        <c:forEach items="${requestScope.top4N}" var="c">
                                            <form action="cart" method="">
                                                <input type="hidden" name="proId" value="${c.id}"/>
                                                <div class="product col-md-3" >
                                                    <div class="product-img">
                                                        <img src="${c.image}" alt="">
                                                        <div class="product-label">
                                                            <span class="sale">-30%</span>
                                                            <span class="new">NEW</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">                                                   
                                                        <h3 class="product-name"><a href="product?id=${c.id}">${c.name}</a></h3>
                                                        <h4 class="product-price">${c.price}</h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <input type="submit" value="Add to cart" class="add-to-cart-btn"/>
                                                    </div>
                                                </div>
                                            </form>
                                        </c:forEach>                                      
                                        <!-- /product -->
                                    </div>
                                    <div></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>

                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">          
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Top selling</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->

                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div>
                                        <!-- product -->
                                        <c:forEach items="${requestScope.top4Q}" var="c">
                                            <form action="cart" method="">
                                                <input type="hidden" name="proId" value="${c.id}"/>
                                                <div class="product col-md-3" >
                                                    <div class="product-img">
                                                        <img src="${c.image}" alt="">
                                                        <div class="product-label">
                                                            <span class="sale">-30%</span>
                                                            <span class="new">NEW</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-body"> 
                                                        <h3 class="product-name"><a href="product?id=${c.id}">${c.name}</a></h3>
                                                        <h4 class="product-price">${c.price}</h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <input type="submit" value="Add to cart" class="add-to-cart-btn"/>
                                                    </div>
                                                </div></form>

                                        </c:forEach> 
                                    </div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

