<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="dbp.*, java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="pofol" scope="page" class="dbp.MarketBean"/>
<jsp:useBean id="product" class="dbp.Product"/>
<jsp:useBean id="sales" class="dbp.Sales"/>
<jsp:useBean id="sell" class="dbp.Sell"/>
<jsp:setProperty name="product" property="*"/>
<%
   String action = request.getParameter("action");
   if(action.equals("list")){
      ArrayList<Product> datas = pofol.getP_DBList();
      request.setAttribute("datas", datas);
      String num = request.getParameter("index");
      request.setAttribute("index", num);
      pageContext.forward("market_product.jsp");
   }
   else if(action.equals("stock_list")){//재고관리
         ArrayList<Product> datas = pofol.getP_DBList();
         request.setAttribute("datas", datas);
         String num = request.getParameter("index");
         request.setAttribute("index", num);
         pageContext.forward("market_stock.jsp");
      }
   else if(action.equals("sales_list")){//매출관리
      ArrayList<Sell> data = pofol.getS_DBList();
      request.setAttribute("data", data);
      String num = request.getParameter("index");
      request.setAttribute("index", num);
      pageContext.forward("market_sales.jsp");
   }
   else if(action.equals("search_list")){//상품위치검색
	      ArrayList<Product> datas = pofol.getP_DBList();
	      request.setAttribute("datas", datas);
	      String num = request.getParameter("index");
	      request.setAttribute("index", num);
	      pageContext.forward("market_search.jsp");
	}
   else if(action.equals("insert")){
      if(pofol.insertDB(product)){
         response.sendRedirect("market_control.jsp?action=list");
      }
      else{
         throw new Exception("DB 입력 오류");
      }
   }
   else if(action.equals("edit")){
      Product pro = pofol.getP_DB(product.getP_id());
      request.setAttribute("pfolio", pro);
      pageContext.forward("product_edit_form.jsp");
   }
   else if(action.equals("update")){
      if(pofol.updateDB(product)){
         response.sendRedirect("market_control.jsp?action=list");
      }
      else{
         throw new Exception("DB 입력 오류");
      }
   }
   else if(action.equals("delete")){
      if(pofol.deleteDB(product.getP_id())){
         response.sendRedirect("market_control.jsp?action=list");
      }
      else{
         throw new Exception("DB 입력 오류");
      }
   }
   else if(action.equals("add")){
      response.sendRedirect("portfolio_form.jsp");
   }
   
   else if(action.equals("login")){
      if(request.getParameter("userId").equals("root") && (request.getParameter("password").equals("1234")))
            response.sendRedirect("market_main.jsp");
      else
         response.sendRedirect("index.jsp");
   }
   else if(action.equals("search_date")){
       ArrayList<Sell> search_date =pofol.getS_Search_date_DBList(request.getParameter("sdate1"),request.getParameter("sdate2"));
       request.setAttribute("data", search_date);
        String num = request.getParameter("index");
       request.setAttribute("index", num);
       pageContext.forward("market_sales.jsp");
   }
   else if(action.equals("search_category")){
      String str1 = request.getParameter("name");
      String str2 = request.getParameter("sub");
      ArrayList<Sell> search_category = pofol.getS_Search_DBList(str1, str2);
        request.setAttribute("data", search_category);
        String num = request.getParameter("index");
        request.setAttribute("index", num);
        pageContext.forward("market_sales.jsp");
   }
   else if(action.equals("search_product")){
      ArrayList<Sell> search_product = pofol.getS_Search_DBList("p_name", request.getParameter("pname"));
       request.setAttribute("data", search_product);
        String num = request.getParameter("index");
       request.setAttribute("index", num);
       pageContext.forward("market_sales.jsp");
   }

   else if(action.equals("searchByName")){
      ArrayList<Product> searchdatas = pofol.getP_Search_DBList("p_name", request.getParameter("pname"));
       request.setAttribute("datas", searchdatas);
        String num = request.getParameter("index");
       request.setAttribute("index", num);
       pageContext.forward("market_stock.jsp");
   }
   else if(action.equals("searchByCategory")){

      String str1 = request.getParameter("name");
      String str2 = request.getParameter("sub");
      ArrayList<Product> datas = pofol.getP_Search_DBList(str1, str2);
        request.setAttribute("datas", datas);
        String num = request.getParameter("index");
        request.setAttribute("index", num);
        pageContext.forward("market_stock.jsp");
   }
   else if(action.equals("search_page_name")){
      ArrayList<Product> datas = pofol.getP_Search_page_DBList("p_name", request.getParameter("pname"));
        request.setAttribute("datas", datas);
        String num = request.getParameter("index");
        request.setAttribute("index", num);
        pageContext.forward("market_search.jsp");
   }
   else if(action.equals("search_page_category")){
	   String str1 = request.getParameter("name");
	   String str2 = request.getParameter("sub");
      ArrayList<Product> datas = pofol.getP_Search_page_DBList(str1, str2);
        request.setAttribute("datas", datas);
        String num = request.getParameter("index");
        request.setAttribute("index", num);
        pageContext.forward("market_search.jsp");
   }
   else if(action.equals("p_list")){
      ArrayList<Product> datas = pofol.getP_DBList();
      request.setAttribute("datas", datas);
      String num = request.getParameter("index");
      request.setAttribute("index", num);
      pageContext.forward("market_sell_page.jsp");
   }
   //판매 될 경우 변경되는 부분
   else if(action.equals("sell_update")){ 
      Product pro = pofol.getP_DB(product.getP_id());
      request.setAttribute("pfolio", pro);
      if(pofol.updateS_DB(pro)){  
         response.sendRedirect("market_control.jsp?action=p_list");
      }
      else{
         throw new Exception("DB 입력 오류");
      }
   }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>