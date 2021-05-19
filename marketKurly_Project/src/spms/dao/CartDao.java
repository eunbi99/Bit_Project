package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.util.DBConnectionPool;
import spms.vo.CartVO;

public class CartDao {
   
   DataSource ds = null;
   
   public void setDataSource(DataSource ds) {
      this.ds = ds;
   }
   
   //장바구니 목록 확인 
   public List<CartVO> selectList(String loginUser) throws Exception{
      Connection connection= null;
      Statement stmt = null;
      ResultSet rs = null;
      
      final String sqlSelect = 
            "SELECT c.u_id, p.p_price, p.p_name, p.p_content, c.amount ,c.p_id "
            + "FROM Cart c inner join Product p "
            + "on c.p_id =p.p_id and c.u_id = '"+loginUser+"'";
      
      
      try {
         // 커넥션 풀에서 Connection 객체를 빌려온다
          connection = ds.getConnection();
         stmt = connection.createStatement();
         rs = stmt.executeQuery(sqlSelect);
         ArrayList<CartVO> carts = new ArrayList<CartVO>();
         
         
         while(rs.next()) {
            carts.add(new CartVO()
              .setP_price(rs.getString("p_price"))
               .setP_name(rs.getString("p_name"))
               .setP_content(rs.getString("p_content"))
               .setAmount(rs.getInt("amount"))
               .setP_id(rs.getInt("p_id"))
            );
         }
         
         return carts;
         
      }catch(Exception e) {
         throw e;
      }finally {
         try {if(rs!=null) rs.close();}
         catch(Exception e) {e.printStackTrace();}
         try {if(stmt!=null) stmt.close();}
         catch(Exception e) {e.printStackTrace();}      
         
         // 커넥션 풀로 반납
         connection.close();
      }
   }
   
   //장바구니에 담을 때
   public int cartinsert(CartVO cart) throws Exception{
      Connection connection= null;
      int result = 0;
      PreparedStatement stmt = null;
      final String sqlInsert = "INSERT INTO Cart(u_id,p_id,amount)" + "\r\n" +
                     "VALUES(?, ?, ?)";
      
      try {
         // 커넥션 풀에서 Connection 객체를 빌려온다
          connection = ds.getConnection();
         stmt = connection.prepareStatement(sqlInsert);
         stmt.setString(1, cart.getU_id());
         stmt.setInt(2, cart.getP_id());
         stmt.setInt(3, cart.getAmount());
         result = stmt.executeUpdate();   
      }catch(Exception e) {
         throw e;
      }finally {
         try {if(stmt!=null) stmt.close();}
         catch(Exception e) {e.printStackTrace();}   
         connection.close();
      }
      
      //장바구니에 정보를 담아서 결과를 서블릿에 리턴해준다.
      return result;
   }
   
   public int delete(int p_id,String u_id) throws Exception{
      
      System.out.println("p_id=" + p_id + ", u_id=" + u_id );
      Connection connection= null;
       int result = 0;
       Statement stmt = null;
       final String sqlDelete = "DELETE FROM Cart WHERE p_id='" + p_id + "' AND u_id = '" + u_id +"'" ;
       //
       try {
          // 커넥션 풀에서 Connection 객체를 빌려온다
          connection = ds.getConnection();
         stmt = connection.createStatement();
         result = stmt.executeUpdate(sqlDelete);

       } catch (Exception e) {
         throw e;

       } finally {
         try {if (stmt != null) stmt.close();} catch(Exception e) {}
      // 커넥션 풀로 반납
         connection.close();
       }      
      
      return result;
   }
   
   //장바구니 목록 확인 
   public int selectUseProductYn(int p_id,String u_id) throws Exception{
      Connection connection= null;
      Statement stmt = null;
      ResultSet rs = null;
      
      final String sqlSelect = 
            "SELECT count(*) as cnt"
            + " FROM Cart c inner join Product p "
            + "on c.p_id =p.p_id and c.p_id = '"+p_id+"' and c.u_id='"+u_id+"'";
      

      
      try {
         // 커넥션 풀에서 Connection 객체를 빌려온다
          connection = ds.getConnection();
         stmt = connection.createStatement();
         rs = stmt.executeQuery(sqlSelect);
         CartVO cart = null;
         
         if (rs.next()) {
           cart = new CartVO()
           .setCnt(rs.getInt("cnt"));
         }
         
         return cart.getCnt();
         
      }catch(Exception e) {
    	  e.printStackTrace();
         throw e;
      }finally {
         try {if(rs!=null) rs.close();}
         catch(Exception e) {e.printStackTrace();}
         try {if(stmt!=null) stmt.close();}
         catch(Exception e) {e.printStackTrace();}      
         
         // 커넥션 풀로 반납
//         connection.close();
      }
   }
   
   public int cartAmountUpdate(CartVO cart) throws Exception {
      Connection connection = null;
      int result = 0;
      PreparedStatement stmt = null;
   
      
      final String sqlUpdate = "UPDATE cart SET AMOUNT=(AMOUNT+?)" + " WHERE u_id=? and p_id=?";
      System.out.println("String::"+sqlUpdate);
      try {
         // 커넥션 풀에서 Connection객체를 빌려온다
         connection = ds.getConnection();
         stmt = connection.prepareStatement(sqlUpdate);
         stmt.setInt(1, cart.getAmount());
         stmt.setString(2, cart.getU_id());
         stmt.setInt(3, cart.getP_id());
         result = stmt.executeUpdate();

      } catch (Exception e) {
         throw e;
      } finally {
         try {
            if (stmt != null)
               stmt.close();
         } catch (Exception e) {
         }

         try {
            /* DataSource가 빌려준 Connection은
             * close()시 연결이 종료되는 것이 아니라
             * 반납하는 의미이다
             * */
            if(connection != null)
               connection.close();
         }catch(Exception e) {
            e.printStackTrace();
         }
      }

      return result;
   }
   
   public int update(CartVO cart) throws Exception{
      Connection connection = null;
      int result = 0;
      PreparedStatement stmt = null;
   
      
      final String sqlUpdate = "UPDATE cart SET amount=? WHERE u_id=? and p_id=?";
      System.out.println("String::"+sqlUpdate);
      try {
         // 커넥션 풀에서 Connection객체를 빌려온다
         connection = ds.getConnection();
         stmt = connection.prepareStatement(sqlUpdate);
         stmt.setInt(1, cart.getAmount());
         stmt.setString(2, cart.getU_id());
         stmt.setInt(3, cart.getP_id());
         result = stmt.executeUpdate();

      } catch (Exception e) {
         throw e;
      } finally {
         try {
            if (stmt != null)
               stmt.close();
         } catch (Exception e) {
         }

         try {
            /* DataSource가 빌려준 Connection은
             * close()시 연결이 종료되는 것이 아니라
             * 반납하는 의미이다
             * */
            if(connection != null)
               connection.close();
         }catch(Exception e) {
            e.printStackTrace();
         }
      }

      return result;
   }

}







