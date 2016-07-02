<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="css/style.css" rel="stylesheet" />
  
<title>produc_management</title>
</head>
 <body>
 <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                    <img src="images/logo.png" />
            </div>
            <div class="left-div">
                <div class="user-settings-wrapper">
                            <div class="dropdown-menu dropdown-settings">
                                <div class="media">
                                    <div class="media-body">
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br>
    <section id="two">
        <div class="container">
            <div class="row">
            <div class="col-lg-1 col-md-1 text-center">
                </div>
                <div class="col-lg-2 col-md-2 text-center">
                    <div class="feature">
						<a href="market_control.jsp?action=p_list"><img src="images/sell.png" width=70 height=70></a>
                        <h3>상품</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 text-center">
                    <div class="feature">
                       <a href="market_control.jsp?action=list"><img src="images/product.png" width=70 height=70></a>
                        <h3>상품관리</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 text-center">
                    <div class="feature">
                        <a href="market_control.jsp?action=sales_list"><img src="images/sales.png" width=70 height=70></a>
                        <h3>매출관리</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 text-center">
                    	<div class="feature">
                        	<a href="market_control.jsp?action=stock_list"><img src="images/list.png" width=70 height=70></a>
                        	<h3>재고관리</h3>
                    	</div>
                </div>
                    <div class="col-lg-2 col-md-2 text-center">
                    <div class="feature">
                        <a href="market_control.jsp?action=search_list"><img src="images/search.png" width=70 height=70></a>
                        <h3>상품검색</h3>
                    </div>
                </div>
                <div class="col-lg-1 col-md-1 text-center">
                </div>
            </div>
        </div>
    </section>
   
   <br><br><br><br><br><br>   
   
   <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                   <br><br>
                    <center>&copy; 2015 DONGDUKUNIVERSITY | By : DATABASE PROJECT</center>
                    <br><br>
                </div>
            </div>
        </div>
    </footer>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>