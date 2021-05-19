package spms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import spms.vo.MemberVO;

public class MemberDao {
   
   private Connection conn;
   PreparedStatement pstmt;
   ResultSet rs;
   
   public MemberDao() {
      try {
         String url = "jdbc:mysql://112.169.196.142/studydb?serverTimezone=UTC";
         String id = "study";
         String pw = "study";
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection(url, id, pw);
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   // 회원 탈퇴
   public int delete(String userId) throws Exception {
      int result = 0;
      Statement stmt = conn.createStatement();
      String SQL = "DELETE FROM user WHERE u_id='"+userId+"'";

      try {
         result = stmt.executeUpdate(SQL);

      } catch (Exception e) {
         throw e;

      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
         } catch (Exception e) {
         }
         try {
            if (conn != null)
               conn.close();
         } catch(Exception e) {
            e.printStackTrace();
         }
      }

      return result;
   }
   
   // 회원 정보 수정
   public int update(MemberVO member) throws Exception {
      // 로그인 정보가 일치한 경우 그 로그인 객체가 담김
      MemberVO memberVO = selectOne(member.getUserId(), member.getUserPassword());
      int result = 0;
      String SQL = 
            "UPDATE user SET u_pw=?, u_name=?, u_phone=?, u_address=? WHERE u_id=?";

      // 현재 비밀 번호와 id는 꼭 같아야 하고,
      // 만약, 새 비밀번호 입력값이 있으면 없뎃
      try {
         
         if(memberVO != null) {
            // 로그인한 객체일 때, 
            pstmt = conn.prepareStatement(SQL);
            
            // 새로 입력된 비밀번호
            pstmt.setString(1, member.getUserPassword());
            pstmt.setString(2, member.getUserName());
            pstmt.setString(3, member.getUserPhoneNum());
            pstmt.setString(4, member.getUserAddress());
            pstmt.setString(5, member.getUserId());
            
            result = pstmt.executeUpdate();
         }
         
      } catch (Exception e) {
         throw e;
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
         } catch (Exception e) {
         }
         
         try {
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

      return result;
   }
   
   // 로그인 객체 반환
   public MemberVO selectOne(String userId, String userPassword) {
      String SQL = 
            "SELECT * FROM user WHERE u_id=? AND u_pw=?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userId);
         pstmt.setString(2, userPassword);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            // 로그인 성공
            if(rs.getString(2).equals(userPassword)) {
               MemberVO memberVO = new MemberVO();
               memberVO.setUserId(rs.getString("u_id"));
               memberVO.setUserPassword(rs.getString("u_pw"));
               memberVO.setUserName(rs.getString("u_name"));
               memberVO.setUserPhoneNum(rs.getString("u_phone"));
               memberVO.setUserAddress(rs.getString("u_address"));
               return memberVO;
            } 
            else {
               return null; // 비밀번호 불일치
            }
         }
         return null; // ID없음
         
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
         } catch(Exception e) {
            e.printStackTrace();
         }
      }
      return null; //DB오류      
   }
   
   // 로그인
   public int login(String userId, String userPassword) {
      String SQL = 
            "SELECT * FROM user WHERE u_id=? AND u_pw=?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userId);
         pstmt.setString(2, userPassword);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            if(rs.getString(2).equals(userPassword)) {
               return 1; //로그인 성공
            } 
            else {
               return 0; // 비밀번호 불일치
            }
         }
         return -1; // ID없음
         
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
         } catch(Exception e) {
            e.printStackTrace();
         }
      }
      return -2; //DB오류
   }
   
   // 중복 아이디 확인
   public int registerCheck(String userID) {
      
      String SQL = "SELECT * FROM user WHERE u_id = ?";
      
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userID);  
         rs = pstmt.executeQuery();
         
         if(rs.next()) { // 이미 존재하는 회원
            // userID가 admin일 때, 
            return 0; 
            
         } else if(userID.equals("")) {
            return -2;
         }
         else {
            return 1; // 가입 가능한 회원
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
         } catch(Exception e) {
            e.printStackTrace();
         }
      }
      return -1; // DB 오류
   }
   
   // 새로운 회원 가입
   public int register(String userId, String userPassword, String userName, String userPhoneNum, String userAddress) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
      
      try {
         // 입력 받은 값을 업데이트 
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userId);
         pstmt.setString(2, userPassword);
         pstmt.setString(3, userName);
         pstmt.setString(4, userPhoneNum);
         pstmt.setString(5, userAddress);
         return pstmt.executeUpdate(); // 성공적으로 업뎃된 수만큼 리턴
         
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
         } catch(Exception e) {
            e.printStackTrace();
         }
      }
      return -1; // DB 오류
   }

}