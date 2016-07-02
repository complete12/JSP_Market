<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, dbp.*, java.sql.*"%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="css/style.css" rel="stylesheet" />
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
                            <li><a href="market_control.jsp?action=list">상품관리</a></li>
                            <li><a href="market_control.jsp?action=sales_list">매출관리</a></li>
                            <li><a href="market_control.jsp?action=stock_list">재고관리</a></li>
                             <li><a class="menu-top-active" href="market_control.jsp?action=search_list">상품위치</a></li>
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
                    <h4 class="page-head-line">상품검색</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success">
                     <div class ="row">
                     
                        <div class="col-md-3">
                        </div> 

                        <div class="col-md-6">
                  <div class="col-md-3">
                       <div class="dropdown">
                         <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">카테고리
                        <span class="caret"></span></button>
                         <ul class="dropdown-menu">
                           <li class="dropdown-header"><a href="market_control.jsp?action=search_page_category&name=p_major_category&sub=식품"><b>식품</b></a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=가공/즉석/냉동">가공/즉석/냉동</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=수산">수산</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=축산">축산</a></li>
                           <li class="divider"></li>
                           <li class="dropdown-header"><a href="market_control.jsp?action=search_page_category&name=p_major_category&sub=위생"><b>위생</b></a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=방향/제습/살충제">방향/제습/살충제</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=세탁세제/섬유유연제">세탁세제/섬유유연제</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=주방세제">주방세제</a></li>
                           <li class="divider"></li>
                           <li class="dropdown-header"><a href="market_control.jsp?action=search_page_category&name=p_major_category&sub=욕실"><b>욕실</b></a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=수건/가운">수건/가운</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=바디/헤어">바디/헤어</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=욕실잡화">욕실잡화</a></li>
                           <li class="divider"></li>
                           <li class="dropdown-header"><a href="market_control.jsp?action=search_page_category&name=p_major_category&sub=사무"><b>사무</b></a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=잉크/토너">잉크/토너</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=문구류">문구류</a></li>
                           <li><a href="market_control.jsp?action=search_page_category&name=p_minor_category&sub=디자인문구">디자인문구</a></li>
                         </ul>
                     </div>
                  </div>
                  
                  <div class="col-md-7">
                  <form name = "form_stock1" method = post action = "market_control.jsp">
                        <input type = hidden name = "action" value ="search_page_name">
                        <input type=search placeholder="상품별" class="form-control" id="error" name="pname">
                   </div>
                   <div class="col-md-2">
                        <input type=submit  class="btn btn-default" value="검색">
                   </form>
                   </div>
                     </div>

                  <div class="col-md-3">
                        </div>

                 </div> 

<div class ="row">
                     
                        <div class="col-md-3">
                        </div> 

                        <div class="col-md-6">
 <div class="col-md-4">
</div>
<div class="col-md-4">
<%
                     ArrayList<Product> dataDisplay = (ArrayList<Product>)datas;
                  
                          String str = dataDisplay.get(0).getP_display().substring(0,1);
                          if(str.equals("A")){
                             out.println("<img src=\"./images/a.png\"/>");
                  
                    }
                  
                          if(str.equals("B")){
                             out.println("<img src=\"./images/b.png\"/>");
                          }
                    
                          if(str.equals("C")){
                             out.println("<img src=\"./images/c.png\"/>");
                          }
                  
                          if(str.equals("D")){
                             out.println("<img src=\"./images/d.png\"/>");
                          }
                  %>
</div>
<div class="col-md-4">
</div>                 

                     </div>

                  <div class="col-md-3">
                        </div>

                 </div>


            </div>
      </div>
</div>                 

<div class="row">
                 <center>
	<div class="table-responsive">
	    
	          
		 <table class="table table-hover">
		                  <thead>
		                     <tr>
		                        <th>상품번호</th>
		                           <th>상품명</th>
		                           <th>가격</th>
		                           <th>재고량</th>
		                           <th>대분류</th>
		                           <th>소분류</th>
		                           <th>진열번호</th>
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
		      out.println("<tr><td><a href=\"market_control.jsp?action=edit&p_id="+ data.get(i).getP_id() + "\">" + data.get(i).getP_id() + "</a></td><td>" + data.get(i).getP_name()+ "</td><td>" + data.get(i).getP_price() + "</td><td>" + data.get(i).getP_stock() + "</td><td>" 
		               + data.get(i).getP_major_category() + "</td><td>" + data.get(i).getP_minor_category() + "</td><td>" + data.get(i).getP_display() +"</td></tr>");
		   }
		   out.println("</table>");
	 %>
	 </div>
	 <%
	   for(int j = 1; j <= pageCount; j++){
	      if(j != pageNumber)
	         out.println("<a href = \"market_control.jsp?action=search_list&index="+ j + "\">"+ j +"</a>");
	      else
	         out.println(j );
	   }
%>   

</div>
</div>

<!-- /container -->

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