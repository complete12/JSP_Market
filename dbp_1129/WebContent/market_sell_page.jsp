<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, dbp.*, java.sql.*"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>   
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
  
<title>sell_page</title>
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
                            <li><a class="menu-top-active" href="market_control.jsp?action=p_list">판매</a></li>
                            <li><a href="market_control.jsp?action=list">상품관리</a></li>
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
                <div class="col-md-12">
                    <h4 class="page-head-line">상품판매</h4>
                </div>
            </div>
            <div class="row">
                 <center>
<form name = form1 method = post action = "product_form.jsp">
<input type = hidden name = "action" value ="insert">

<div class="table-responsive">
                                <table class="table table-hover" cellspadding="10">

<tbody>
  <%
  ArrayList<Product> data = (ArrayList<Product>)datas;

 int pageCount;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
 if(data.size() % 36 == 0)
    pageCount = data.size() / 36;
 else
    pageCount = data.size() / 36 + 1;
 
 int pageNumber = 1;
 String num = request.getParameter("index");
 if(num != null)
    pageNumber = Integer.parseInt(num);
 
 int start = (pageNumber - 1) * 36;
 int end;
 if(data.size() >= pageNumber * 36)
    end = 36;
 else
    end = data.size() - start;
  %>
<form name = form1 method = post action = market_control.jsp>
    <table align = center>
    <tr align = center>
    <%
    int count = 0;
   for(int i = start; i < start + end; i++){
	   out.println("<td><img src = \"images/" + data.get(i).getP_name() + ".jpg\"width=150 height=150><br>"
			   + data.get(i).getP_name() + "<a class=\"btn btn-danger\" href = \"market_control.jsp?action=sell_update&p_id=" + data.get(i).getP_id() + "\">판매</a></td>");
      count++;
      if(count % 6 == 0)
      {
         out.println("</tr><tr align = center>");
      }
   }
   out.println("</tr></table>");
   
   for(int j = 1; j <= pageCount; j++){
      if(j != pageNumber)
         out.println("<a href = \"market_control.jsp?action=p_list&index="+ j + "\">"+ j +"</a>");
      else
         out.println(j );
   }
    %>
    </form>
</center>
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