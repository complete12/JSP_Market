<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, dbp.*, java.sql.*"%>
<jsp:useBean id="pfolio" scope = "request" class="dbp.Product"/>
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
<script language=JavaScript>
	function delcheck(){
		result = confirm("정말로 삭제하시겠습니까?");
		if(result){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<title>edit_form</title>
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
    
  
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="market_control.jsp?action=p_list">상품</a></li>
                            <li><a class="menu-top-active" href="market_control.jsp?action=list">상품관리</a></li>
                            <li><a href="market_control.jsp?action=sales_list">매출관리</a></li>
                            <li><a href="market_control.jsp?action=stock_list">재고관리</a></li>
                             <li><a href="market_control.jsp?action=market_serch">상품검색</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">상품 수정 & 삭제</h4>
                </div>
            </div>
            
            <div class="row">
<form name = form1 method = post action = market_control.jsp>
<input type = hidden name = "p_id" value = "<%= pfolio.getP_id()%>">
<input type = hidden name = "action" value="update">
<div class="table-responsive">
                                <table class="table table-hover">
<tr align=center><td>상품번호</td><td><input type = text name = p_id value="<%=pfolio.getP_id()%>"></td></tr>
<tr align=center><td>상품이름</td><td><input type = text name = p_name value="<%=pfolio.getP_name()%>"></td></tr>
<tr align=center><td>가격</td><td><input type = text name = p_price value="<%=pfolio.getP_price()%>"></td></tr>
<tr align=center><td>재고량</td><td><input type = text name = p_stock value="<%=pfolio.getP_stock()%>"></td></tr>
<tr align=center><td>대분류</td><td><input type = text name = p_major_category value="<%=pfolio.getP_major_category()%>"></td></tr>
<tr align=center><td>소분류</td><td><input type = text name = p_minor_category value="<%=pfolio.getP_minor_category()%>"></td></tr>
<tr align=center><td>진열번호</td><td><input type = text name = p_display value="<%=pfolio.getP_display()%>"></td></tr>
<tr><td></td><td align=right><input type = submit class="btn btn-danger" value = "수정">
<input type = button value = "삭제" class="btn btn-primary" onClick="delcheck()">
<input type = button value = "취소" class="btn btn-default" onClick="document.location='market_control.jsp?action=list'"></td></tr>
</table>
</form>

 </div>
            </div>
        </div>
</div>
    
    
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