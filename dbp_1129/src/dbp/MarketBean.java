package dbp;  

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class MarketBean {
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   String jdbc_driver = "com.mysql.jdbc.Driver";
   String jdbc_url = "jdbc:mysql://localhost/dbpdb";
   
   void connect(){
      try{
         Class.forName(jdbc_driver);
         conn = DriverManager.getConnection(jdbc_url, "DBP", "1234");
         
      }catch(Exception e){
         e.printStackTrace();
      }
   }
   
   void disconnect() {
      if(pstmt != null){
         try{
            pstmt.close();
         }catch(SQLException e){
            e.printStackTrace();
         }
      }
      if(conn != null){
         try{
            conn.close();
         }catch(SQLException e){
            e.printStackTrace();
         }
      }
   }
   
   public boolean insertDB(Product product){
         connect();
         String sql = "insert into product(p_name, p_price, p_stock, p_major_category, p_minor_category, p_display) values(?,?,?,?,?,?)";
         
         try{
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, product.getP_name());
            pstmt.setInt(2, product.getP_price());
            pstmt.setInt(3, product.getP_stock());
            pstmt.setString(4, product.getP_major_category());
            pstmt.setString(5, product.getP_minor_category());
            pstmt.setString(6, product.getP_display());
            pstmt.executeUpdate();
         }catch(SQLException e){
            e.printStackTrace();
            return false;
         }finally{
            disconnect();
         }
         return true;
      }
   
   public boolean updateDB(Product product){
      connect();
      String sql = "update product set p_name=?, p_price=?, p_stock=?, p_major_category=?, p_minor_category=?, p_display=? where p_id=?";
      
      try{
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, product.getP_name());
         pstmt.setInt(2, product.getP_price());
         pstmt.setInt(3, product.getP_stock());
         pstmt.setString(4, product.getP_major_category());
         pstmt.setString(5, product.getP_minor_category());
         pstmt.setString(6, product.getP_display());
         pstmt.setInt(7, product.getP_id());
         pstmt.executeUpdate();
      }catch(SQLException e){
         e.printStackTrace();
         return false;
      }finally{
         disconnect();
      }
      return true;
   }
   
   public boolean updateS_DB(Product product){
         connect();
         //sql.Date를 이용하여 얻어온 Date
         Date sqlDate = new java.sql.Date(System.currentTimeMillis());
         
         String sql = "update product set p_stock=? where p_id=?";
                  
         Sales sales = new Sales();
         String sql_s = "insert into sales(s_id, p_id, s_quantity, s_date) values(?,?,?,?)";
         
         try{
            pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, product.getP_stock()-1);
            pstmt.setInt(2, product.getP_id());
            pstmt.executeUpdate();
         }catch(SQLException e){
            e.printStackTrace();
            return false;
         }
         try{
            pstmt = conn.prepareStatement(sql_s);
            pstmt.setInt(1, sales.getS_id());
            pstmt.setInt(2, product.getP_id());
            pstmt.setInt(3, sales.getS_quantity()+1);
            pstmt.setDate(4, sqlDate);
            pstmt.executeUpdate();
         }catch(SQLException e){
            e.printStackTrace();
            return false;
            }finally{
               disconnect();
         }
         return true;
      }
   
   public boolean updateSales_DB(Product product){
         connect();
         Sales sales = getS_DB(product.getP_id());
         String sql = "update sales set s_quantity=? where p_id=?";
         
         try{
            pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, sales.getS_quantity()+1);
            pstmt.setInt(2, product.getP_id());                                                                                                                                                                                         
            pstmt.executeUpdate();
         }catch(SQLException e){
            e.printStackTrace();
            return false;
         }finally{
               disconnect();
         }
         return true;
      }
   
   public boolean deleteDB(int gb_id){
      connect();
      String sql = "delete from product where p_id=?";
      
      try{
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, gb_id);
         pstmt.executeUpdate();
         
      }catch(SQLException e){
         e.printStackTrace();
         return false;
      }finally{
         disconnect();
      }
      return true;
   }

   public Product getP_DB(int gb_id){
      connect();
      String sql = "select * from product where p_id=?";
      Product product = new Product();
      
      try{
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, gb_id);
         ResultSet rs = pstmt.executeQuery();
         
         rs.next();
         product.setP_id(rs.getInt("p_id"));
         product.setP_name(rs.getString("p_name"));
         product.setP_price(rs.getInt("p_price"));
         product.setP_stock(rs.getInt("p_stock"));
         product.setP_major_category(rs.getString("p_major_category"));
         product.setP_minor_category(rs.getString("p_minor_category"));
         product.setP_display(rs.getString("p_display"));
         rs.close();
      }catch(SQLException e){
         e.printStackTrace();
      }finally{
         disconnect();
      }
      return product;
   }
   
   public Sales getS_DB(int gb_id){
      connect();
      String sql = "select * from sales where p_id=?";
      Sales sales = new Sales();
      
      try{
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, gb_id);
         ResultSet rs = pstmt.executeQuery();
         
         rs.next();
         sales.setS_id(rs.getInt("s_id"));
         sales.setP_id(rs.getInt("p_id"));
         sales.setS_quantity(rs.getInt("s_quantity"));
         sales.setS_Date(rs.getDate("s_date"));  
         rs.close();
      }catch(SQLException e){
         e.printStackTrace();
      }finally{
         disconnect();
      }
      return sales;
   }
   
   public ArrayList<Product> getP_DBList(){
      connect();
      ArrayList<Product> datas = new ArrayList<Product>();
      
      String sql = "select * from product order by p_id";
      try{
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()){
            Product product = new Product();
            
            product.setP_id(rs.getInt("p_id"));
            product.setP_name(rs.getString("p_name"));
            product.setP_price(rs.getInt("p_price"));
            product.setP_stock(rs.getInt("p_stock"));
            product.setP_major_category(rs.getString("p_major_category"));
            product.setP_minor_category(rs.getString("p_minor_category"));
            product.setP_display(rs.getString("p_display"));
            datas.add(product);
         }
         rs.close();
      }catch(SQLException e){
         e.printStackTrace();
      }finally{
         disconnect();
      }
      return datas;
   }
   
   public ArrayList<Sell> getS_DBList(){
      connect();
      ArrayList<Sell> data = new ArrayList<Sell>();
      String sql="select sales.s_id, product.p_id, product.p_major_category, product.p_minor_category, product.p_name, sum(sales.s_quantity) s_quantity, sales.s_date, sum(product.p_price*sales.s_quantity) s_amount from product inner join sales on product.p_id=sales.p_id group by sales.s_date, product.p_id";
      
      try{
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()){
            Sell sell = new Sell();
            
            sell.setS_id(rs.getInt("s_id"));
            sell.setP_id(rs.getInt("p_id"));
            sell.setP_major_category(rs.getString("p_major_category"));
            sell.setP_minor_category(rs.getString("p_minor_category"));
            sell.setP_name(rs.getString("p_name"));
            sell.setS_quantity(rs.getInt("s_quantity"));
            sell.setS_Date(rs.getDate("s_date"));
            sell.setS_amount(rs.getInt("s_amount"));
            data.add(sell);
         }
         rs.close();
      }catch(SQLException e){
         e.printStackTrace();
      }finally{
         disconnect();
      }
      return data;
   }
   
   public ArrayList<Product> getP_Search_DBList(String str1, String str2){
         connect();
         ArrayList<Product> searchdatas = new ArrayList<Product>();
         
         String sql = "SELECT p_id, p_major_category, p_minor_category, p_name, p_stock FROM product WHERE " + str1 + " LIKE '%" + str2 + "%'";
         try{
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
               Product product = new Product();
               
               product.setP_id(rs.getInt("p_id"));
               product.setP_major_category(rs.getString("p_major_category"));
               product.setP_minor_category(rs.getString("p_minor_category"));
               product.setP_name(rs.getString("p_name"));
               product.setP_stock(rs.getInt("p_stock"));
               searchdatas.add(product);
         
            }
            rs.close();
         }catch(SQLException e){
            e.printStackTrace();
         }finally{
            disconnect();
         }
         return searchdatas;
      }
   
   public ArrayList<Product> getP_Search_page_DBList(String str1, String str2){
         connect();
         ArrayList<Product> searchdatas = new ArrayList<Product>();
         
         String sql = "SELECT p_id, p_price, p_major_category, p_minor_category, p_name, p_stock, p_display FROM product WHERE " + str1 + " LIKE '%" + str2 + "%'";
         try{
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
               Product product = new Product();
               
               product.setP_id(rs.getInt("p_id"));
               product.setP_name(rs.getString("p_name"));
               product.setP_price(rs.getInt("p_price"));
               product.setP_major_category(rs.getString("p_major_category"));
               product.setP_minor_category(rs.getString("p_minor_category"));
               product.setP_stock(rs.getInt("p_stock"));
               product.setP_display(rs.getString("p_display"));
               searchdatas.add(product);
         
            }
            rs.close();
         }catch(SQLException e){
            e.printStackTrace();
         }finally{
            disconnect();
         }
         return searchdatas;
      }
   
   public ArrayList<Sell> getS_Search_DBList(String str1, String str2){
         connect();
         ArrayList<Sell> searchdatas = new ArrayList<Sell>();
         String sql = "SELECT sales.s_id, product.p_id, product.p_major_category, product.p_minor_category, product.p_name, sum(sales.s_quantity) s_quantity, sales.s_date, sum(product.p_stock*sales.s_quantity) s_amount  FROM product inner join sales on product.p_id=sales.p_id  WHERE " + str1 + " LIKE '%" + str2 + "%'" +"group by sales.s_date, product.p_id";

         try{
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
               Sell sell = new Sell();

               sell.setS_id(rs.getInt("s_id"));
               sell.setP_id(rs.getInt("p_id"));
               sell.setP_major_category(rs.getString("p_major_category"));
               sell.setP_minor_category(rs.getString("p_minor_category"));
               sell.setP_name(rs.getString("p_name"));
               sell.setS_quantity(rs.getInt("s_quantity"));
               sell.setS_Date(rs.getDate("s_date"));
               sell.setS_amount(rs.getInt("s_amount"));
                searchdatas.add(sell);
                
            }
            rs.close();
         }catch(SQLException e){
            e.printStackTrace();
         }finally{
            disconnect();
         }
         return searchdatas;
      }

   public ArrayList<Sell> getS_Search_date_DBList(String date1, String date2){
         connect();
         ArrayList<Sell> searchdatas = new ArrayList<Sell>();
         String sql = "SELECT sales.s_id, product.p_id, product.p_major_category, product.p_minor_category, product.p_name, sum(sales.s_quantity) s_quantity, sales.s_date, sum(product.p_stock*sales.s_quantity) s_amount  FROM product inner join sales on product.p_id=sales.p_id WHERE s_date >= '"+ date1 + "' and s_date <= '" + date2 +"' group by sales.s_date, product.p_id";

         try{
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
               Sell sell = new Sell();

               sell.setS_id(rs.getInt("s_id"));
               sell.setP_id(rs.getInt("p_id"));
               sell.setP_major_category(rs.getString("p_major_category"));
               sell.setP_minor_category(rs.getString("p_minor_category"));
               sell.setP_name(rs.getString("p_name"));
               sell.setS_quantity(rs.getInt("s_quantity"));
               sell.setS_Date(rs.getDate("s_date"));
               sell.setS_amount(rs.getInt("s_amount"));
                searchdatas.add(sell);
                
            }
            rs.close();
         }catch(SQLException e){
            e.printStackTrace();
         }finally{
            disconnect();
         }
         return searchdatas;
      }
}