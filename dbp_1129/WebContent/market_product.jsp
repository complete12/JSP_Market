<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, dbp.*, java.sql.*"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>
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
<script language=JavaScript>
	function check(p_id){
		prompt('수정/삭제를 하시겠습니까?');
	}
</script>
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
                            <li><a href="market_control.jsp?action=p_list">판매</a></li>
                            <li><a class="menu-top-active" href="market_control.jsp?action=list">상품관리</a></li>
                            <li><a href="market_control.jsp?action=sales_list">매출관리</a></li>
                            <li><a href="market_control.jsp?action=stock_list">재고관리</a></li>
                             <li><a href="market_control.jsp?action=search_list">상품위치</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <br>
            </div>
            
            <div class="row">

<form name = form1 method = post action = "product_form.jsp">
<input type = hidden name = "action" value ="insert">

<div class="table-responsive">
                                <table class="table table-hover">
<thead>
<tr align = center>
   <th><center>상품번호</center></th>
   <th><center>분류</center></th>
   <th><center>상품명</center></th>
   <th><center>가격</center></th>
   <th><center>재고량</center></th>
   <th><center>진열번호</center></th>
</tr>
</thead>

<tbody>
<%
   ArrayList<Product> data = (ArrayList<Product>)datas;

   int pageCount;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
   if(data.size() % 10 == 0)
      pageCount = data.size() / 10;
   else
      pageCount = data.size() / 10 + 1;
   
   int pageNumber = 1;
   String num = request.getParameter("index");
   if(num != null)
      pageNumber = Integer.parseInt(num);
   
   int start = (pageNumber - 1) * 10;
   int end;
   if(data.size() >= pageNumber * 10)
      end = 10;
   else
      end = data.size() - start; 
   
   for(int i = start; i < start + end; i++){
      out.println("<tr align = center><td align = center><a href=\"market_control.jsp?action=edit&p_id="+ data.get(i).getP_id() + "\">" + data.get(i).getP_id() + "</a></td><td>" 
   				+ data.get(i).getP_major_category()+ ">" + data.get(i).getP_minor_category() + "</td><td>" + data.get(i).getP_name()+ "</td><td>" 
    		  + data.get(i).getP_price() + "</td><td>" + data.get(i).getP_stock() + "</td><td>" + data.get(i).getP_display() +"</td></tr>");
   }
   out.println("<tr align = center><td></td><td></td><td></td><td></td><td></td><td><input type = submit class=\"btn btn-danger\" value = \"상품등록\"></td></tr></tbody></table></form><br>");
   out.println("<center>");
   for(int j = 1; j <= pageCount; j++){
      if(j != pageNumber)
         out.println("<a href = \"market_control.jsp?action=list&index="+ j + "\">"+ j +"</a>");
      else
         out.println(j );
   }
   out.println("</center>");
%> 
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