<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="portfolio_error.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/dbpdb";
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);

		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"DBP","1234");

		String sql = "insert into product(p_name, p_price, p_stock, p_major_category, p_minor_category, p_display) values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("p_name"));
		pstmt.setInt(2, Integer.parseInt(request.getParameter("p_price")));
		pstmt.setInt(3, Integer.parseInt(request.getParameter("p_strock")));
		pstmt.setString(4, request.getParameter("p_major_category"));
		pstmt.setString(5, request.getParameter("p_minor_category"));
		pstmt.setString(6, request.getParameter("p_display"));
		
		// 값을 입력한 경우 sql 문장을 수행.
		if(request.getParameter("p_name") != null && request.getParameter("p_price") != null && request.getParameter("p_stock") != null) {
			pstmt.executeUpdate(sql);
		}
	}
	catch(Exception e) {
		System.out.println(e);
	}
	
%>
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
<title>Insert_form</title>
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
                    <h4 class="page-head-line">상품판매</h4>
                </div>
            </div>
            
            <div class="row">

<form name = form1 method = post action = market_control.jsp>
<input type = hidden name = "action" value ="insert">
<div class="table-responsive">
                                <table class="table table-hover">
<tbody>
<tr align=center><td>상품이름</td><td><input type = text name = p_name></td></tr>
<tr align=center><td>가격</td><td><input type = text name = p_price></td></tr>
<tr align=center><td>재고량</td><td><input type = text name = p_stock></td></tr>
<tr align=center><td>대분류</td><td><input type = text name = p_major_category></td></tr>
<tr align=center><td>소분류</td><td><input type = text name = p_minor_category></td></tr>
<tr align=center><td>진열번호</td><td><input type = text name = p_display></td></tr>
<tr align=right><td colspan = 2><input type = submit class="btn btn-danger" value = "저장"><input type = reset class="btn btn-default" value = "취소"></td></tr>
</tbody>
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