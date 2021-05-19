package spms.vo;

import java.util.Date;


public class MemberVO {
   protected String userId;
   protected String userPassword;
   protected String userName;
   protected String userPhoneNum;
   protected String userAddress;
   
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getUserPassword() {
      return userPassword;
   }
   public void setUserPassword(String userPassword) {
      this.userPassword = userPassword;
   }
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getUserPhoneNum() {
      return userPhoneNum;
   }
   public void setUserPhoneNum(String userPhoneNum) {
      this.userPhoneNum = userPhoneNum;
   }
   public String getUserAddress() {
      return userAddress;
   }
   public void setUserAddress(String userAddress) {
      this.userAddress = userAddress;
   }
   @Override
   public String toString() {
      return "MemberVO [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
            + ", userPhoneNum=" + userPhoneNum + ", userAddress=" + userAddress + "]";
   }
   
  
   
}








