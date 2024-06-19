<%-- 
    Document   : ListProductServlet
    Created on : Jan 27, 2024, 7:30:32 AM
    Author     : Dash F15
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Cart</title>
        <link rel="stylesheet" href="css/style.css"/>
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .card{
                margin: auto;
                max-width: 1050px;
                width: 90%;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
            }

            .cart{
                background-color: #fff;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;
            }
            .summary{
                background-color: #ddd;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: rgb(65, 65, 65);
            }
            .summary .col-2{
                padding: 0;
            }
            .summary .col-10
            {
                padding: 0;
            }
            .title b{
                font-size: 1.5rem;
            }
            .main{
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }
            .back-to-shop{
                margin-top: 4.5rem;
            }
            form{
                padding: 2vh 0;
            }

            input{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input:focus::-webkit-input-placeholder
            {
                color:transparent;
            }
            .btn{
                background-color: #000;
                border-color: #000;
                color: white;
                width: 100%;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 0;
            }
            .btn:focus{
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }
            .btn:hover{
                color: white;
            }
            a{
                color: black;
            }
            a:hover{
                color: black;
                text-decoration: none;
            }
            #code{
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }

            .section {
                margin-top: 50px;
                padding-top: 0px;
                padding-bottom: 0px;
            }
        </style>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section" style="margin: 0 auto">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="breadcrumb-header">Shopping Cart</h3>
                            <ul class="breadcrumb-tree">
                                <li><a href="home">Home</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /BREADCRUMB -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- ASIDE -->
                        <div id="aside" class="col-md-3">
                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Shopping Cart
                                </h3>
                            </div>
                            <!-- /aside Widget -->
                        </div>
                        <!-- /ASIDE -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>


            <div class="col-md-12">
                <div class="card col-md-7 cart" style="
                     padding-left: 30px;
                     margin-left: 20px;
                     ">
                    <div class="row" style="margin: auto 0">
                        <div class="">
                            <div class="title">
                                <div class="row">
                                    <div class="col"><h4><b>Shopping Cart</b></h4></div>
                                            <c:if test="${(sessionScope.size > 1)}">
                                    <div class="col align-self-center text-right text-muted">${sessionScope.size} items</div>
                                </c:if>
                                <c:if test="${(sessionScope.size == 1)}">
                                    <div class="col align-self-center text-right text-muted">${sessionScope.size} item</div>
                                </c:if>
                            </div>
                        </div>                        
                        <c:forEach items="${sessionScope.listItem}" var="c">
                            <div class="row border-top border-bottom">
                                <div class="row main align-items-center">
                                    <div class="col-2"><img class="img-fluid" src="${c.product.image}"></div>
                                    <div class="col">
                                        <div class="row text-muted">${c.product.category.name}</div>
                                        <div class="row"><a href="product?id=${c.product.id}">${c.product.name}</a></div>
                                    </div>
                                    <div class="qty-label col-lg-2">
                                        <div class="input-number" id="quantityP">
                                            <input type="number" value="${c.quantity}" name="quantity">
                                            <a class="qty-up" href="process?num=1&proId=${c.product.id}">+</a>
                                            <a class="qty-down" href="process?num=-1&proId=${c.product.id}">-</a>
                                        </div>
                                    </div>
                                    <div class="col">${(c.price * c.quantity)} (VNĐ)
                                    </div>
                                    <div class="col">
                                        <form action="process" method="post">
                                            <input type="hidden" name="proId" value="${c.product.id}"/>
                                            <input class="close" type="submit" value="&#10005" style="width: 40px"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <div class="back-to-shop"><a href="list?id=0">&leftarrow; Back to shop</a></div>
                    </div>

                </div>
            </div>

            <div class="card col-md-5 row px-0">
                <div class="summary">
                    <div><h5><b>Summary</b></h5></div>
                    <hr>
                    <div class="row">
                        <div class="col">TOTAL ITEM(s)</div>
                        <div class="col text-right">${sessionScope.size}</div>
                    </div>
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TOTAL PRICE</div>
                        <div class="col text-right">${sessionScope.total}</div>
                    </div>
                    <c:if test="${(sessionScope.size > 0)}">
                        <div>
                            <form action="checkout" method="get">
                                <input type="submit" class="primary-btn order-submit" value="CHECKOUT"/>
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="col-md-12 px-0">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

