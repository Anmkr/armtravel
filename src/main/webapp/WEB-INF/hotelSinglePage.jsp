
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>  Hotel</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/slick-theme.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="style.css">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome for icons -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- flex slider css -->
    <link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
    <!-- animated css  -->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="screen">
    <!-- Revolution Style-sheet -->
    <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css">
    <link rel="stylesheet" type="text/css" href="css/rev-style.css">
    <!--owl carousel css-->
    <link href="owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
    <link href="owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
    <!--mega menu -->
    <link href="css/yamm.css" rel="stylesheet" type="text/css">
    <!--cube css-->
    <link href="cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css">
    <!-- custom css-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="screen">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <style>

        .star{
            width: 20px;
          color:yellow
        }
    </style>
</head>

<body>
<div class="top-bar-dark">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 hidden-xs">

            </div>
            <div class="col-sm-8 text-right">
                <ul class="list-inline top-dark-right">
                    <li><a href="/loginPage"><i class="fa fa-lock"></i> Login</a></li>
                    <li><a class="topbar-icons" href="#"><span><i class="fa fa-search top-search"></i></span></a></li>
                </ul>
                <div class="search">
                    <form role="form" action="<c:url value="/search"/>">
                        <input type="text" class="form-control" autocomplete="off" name="searchResult" placeholder="Write something and press enter">
                        <span class="search-close"><i class="fa fa-times"></i></span>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="navbar navbar-default navbar-static-top yamm sticky" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <ul class="top-social-icons list-inline pull-right">
                <li><a href="http://www.facebook.com"rel="external nofollow"target="_blank"><i class="fa fa-facebook"></i></a></li>
                <li><a href="http://www.twitter.com"rel="external nofollow"target="_blank"><i class="fa fa-twitter"></i></a></li>
                <li><a href="http://www.instagram.com"rel="external nofollow"target="_blank"><i class="fa fa-instagram"></i></a></li>
                <li><a href="http://www.pinterest.com"rel="external nofollow"target="_blank"><i class="fa fa-pinterest"></i></a></li>
                <li><a href="http://www.google-plus.com"><i class="fa fa-google-plus"></i></a></li>

            </ul>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown active ">
                    <a href="/home">Home</a>
                </li>
                <!--menu home li end here-->
                <li class="dropdown">
                    <a href="index.html#" class="dropdown-toggle " data-toggle="dropdown">Hotel</a>
                    <ul class="dropdown-menu" role="menu">
                        <li> <a href="<c:url value="/allHotelPage"/>"> All Hotels</a></li>
                        <c:forEach items="${allHotels}" var="hotel">
                        </c:forEach>
                    </ul>
                </li>
                <!--menu Portfolio li end here-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Post</a>
                    <ul class="dropdown-menu" role="menu">
                        <li> <a href="<c:url value="/allrPpage"/>">All Posts</a></li>
                        <c:forEach items="${allRegionPosts}" var="regionPost">
                            <%--<li><a href="/rPSinglePage?rPostId=${regionPost.id}">${regionPost.region.name}</a> </li>--%>

                        </c:forEach>
                    </ul>
                </li>
                <!--menu blog li end here-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> City </a>

                    <ul class="dropdown-menu" role="menu">
                        <li><a href="<c:url value="/allCityPage"/>">All Cities</a> </li>
                        <c:forEach items="${allCities}" var="city">
                            <li><a href="/cSinglePage?cId=${city.id}">${city.name}</a> </li>
                        </c:forEach>
                    </ul>
                </li>
                <!--menu pages li end here-->

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Region </a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value="/allrpage"/>">All Regions</a> </li>
                        <c:forEach items="${allRegions}" var="region">
                            <li><a href="/rSinglePage?rId=${region.id}">${region.name} </a></li>
                        </c:forEach>
                    </ul>
                </li>

            </ul>
        </div>
    </div><!--/.nav-collapse -->
</div><!--container-->

<!--rev slider start-->
<div class="breadcrumb-wrap">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h4>Hotel&nbsp;Page</h4>
            </div>
        </div>
    </div>
</div><!--breadcrumbs-->
<div class="divide80"></div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="blog-post">
                <div>
                    <c:if test="${hotel.pictures!=null}">
                        <img src="<c:url value="/image?fileName=${hotel.pictures.get(0).picUrl}"/>" alt="workimg"/>
                    </c:if>
<p>  <c:forEach  var = "i" begin = "1" end = "${hotel.rating}">
    <i class="material-icons star">star_rate</i>
</c:forEach>
</p>
                </div>
                <ul class="list-inline post-detail">

                </ul>
                <h2><span> ${hotel.name}</span></h2>
                <p>
                    <span> ${hotel.description}</span>
                </p>
            </div>

        </div><!--col-->
        <div class="col-md-3 col-md-offset-1">
            <div class="sidebar-box margin40">
                <h4>Search</h4>
                <form role="form" action="<c:url value="/search"/>">
                    <input type="text" class="form-control" name="searchResult" placeholder="Search here ...">
                    <span class="search-close"><i class=""></i></span>

                </form>
            </div>
            <div class="sidebar-box margin40">
                <h4>Categories</h4>
                <ul class="list-unstyled cat-list">
                    <li> <a href="https://www.youtube.com/watch?v=ChYsTZ3wlHs">Marketing</a><i class="fa fa-angle-right"></i></li>
                    <li> <a href="https://www.youtube.com/watch?v=Rv3Yyr9IDsg">Videos</a> <i class="fa fa-angle-right"></i></li>
                    <li> <a href="http://blognews.am/arm/news/426991/hazvadep-handipox-haykakan-15-yurorinak-utestner.html">Foods</a> <i class="fa fa-angle-right"></i></li>
                    <li> <a href="https://hy.wikipedia.org/wiki/%D5%80%D5%A1%D5%B5%D5%AF%D5%A1%D5%AF%D5%A1%D5%B6_%D5%A1%D5%A6%D5%A3%D5%A1%D5%B5%D5%AB%D5%B6_%D5%B0%D5%A1%D5%A3%D5%B8%D6%82%D5%BD%D5%BF_(%D5%BF%D5%A1%D6%80%D5%A1%D5%A6)">Fashion</a> <i class="fa fa-angle-right"></i></li>
                    <li> <a href="https://www.youtube.com/watch?v=Ka_GqM8PSfE">Media</a> <i class="fa fa-angle-right"></i></li>
                    <li> <a href="https://www.google.am/search?q=hayastani+gexatesil+vayrer&rlz=1C1PRFC_enAM732AM732&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjdhKDUrsHaAhVRjqQKHVglAMsQ_AUICigB&biw=1366&bih=588">Pictures</a><i class="fa fa-angle-right"></i></li>
                    <li> <a href="https://tvkultura.ru/video/show/brand_id/21865/episode_id/1463983/video_id/1586418/">Culture</a> <i class="fa fa-angle-right"></i></li>
                </ul>
            </div><!--sidebar-box-->
        </div>
    </div>
    <div>
<div class="divide60"></div>
</div>
</div>
<footer id="footer">
    <div class="container">

        <div class="row">
            <div class="col-md-3 col-sm-6 margin30">
                <div class="footer-col">
                    <h3>About us</h3>
                    <p>



                    </p>
                    <ul class="list-inline footer-social">
                        <li>
                            <a href="http://www.facebook.com" class="social-icon si-dark si-gray-round si-colored-facebook">
                                <i class="fa fa-facebook"></i>
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.twitter.com" class="social-icon si-dark si-gray-round si-colored-twitter">
                                <i class="fa fa-twitter"></i>
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.google-plus.com" class="social-icon si-dark si-gray-round si-colored-google-plus">
                                <i class="fa fa-google-plus"></i>
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.instagram.com" class="social-icon si-dark si-gray-round si-colored-pinterest">
                                <i class="fa fa-pinterest"></i>
                                <i class="fa fa-pinterest"></i>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.instagram.com" class="social-icon si-dark si-gray-round si-colored-linkedin">
                                <i class="fa fa-linkedin"></i>
                                <i class="fa fa-linkedin"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div><!--footer col-->
            <div class="col-md-3 col-sm-6 margin30">
                <div class="footer-col">
                    <h3>Contact</h3>

                    <ul class="list-unstyled contact">
                        <li><p><strong><i class="fa fa-map-marker"></i> Address:</strong> Գյումրի</p></li>
                        <li><p><strong><i class="fa fa-envelope"></i> Mail Us:</strong> <a href="index.html#"></a></p></li>
                        <li> <p><strong><i class="fa fa-phone"></i> Phone:</strong> </p></li>
                        <li> <p><strong><i class="fa fa-print"></i> Fax</strong> </p></li>
                        <li> <p><strong><i class="fa fa-skype"></i> Skype</strong>  </p></li>

                    </ul>
                </div>
            </div><!--footer col-->
            <div class="col-md-3 col-sm-6 margin30">
                <div class="footer-col">
                    <h3>Armenia</h3>
                    <ul class="list-inline f2-work">
                        <li><a href="/home"><img src="img/1.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/2.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/3.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/17.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/33.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/61.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/51.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/60.jpg" class="img-responsive" alt=""></a></li>
                        <li><a href="/home"><img src="img/59.jpg" class="img-responsive" alt=""></a></li>
                    </ul>
                </div>
            </div><!--footer col-->
        </div>

        <div class="row">
            <div class="col-md-12 text-center">
                <div class="footer-btm">
                    <span>&copy;2018.ArmTrail </span>
                </div>
            </div>
        </div>
    </div>
</footer><!--default footer end here-->

<!--scripts and plugins -->
<!--must need plugin jquery-->
<script src="js/jquery.min.js"></script>
<!--bootstrap js plugin-->
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!--easing plugin for smooth scroll-->
<script src="js/jquery.easing.1.3.min.js" type="text/javascript"></script>
<!--sticky header-->
<script type="text/javascript" src="js/jquery.sticky.js"></script>
<!--flex slider plugin-->
<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
<!--parallax background plugin-->
<script src="js/jquery.stellar.min.js" type="text/javascript"></script>


<!--digit countdown plugin-->
<script src="js/waypoints.min.js"></script>
<!--digit countdown plugin-->
<script src="js/jquery.counterup.min.js" type="text/javascript"></script>
<!--on scroll animation-->
<script src="js/wow.min.js" type="text/javascript"></script>
<!--owl carousel slider-->
<script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<!--popup js-->
<script src="js/jquery.magnific-popup.min.js" type="text/javascript"></script>


<!--customizable plugin edit according to your needs-->
<script src="js/custom.js" type="text/javascript"></script>
</body>
</html>
