package spms.vo;

import java.util.Date;


public class CartVO {
   private String u_id;
   private int p_id;
   private int amount;
   private String p_name;
   private String p_price;
   private String p_content;
   private String cart_id;
   private int cnt;
   
   public String getP_name() {
      return p_name;
   }
   public CartVO setP_name(String p_name) {
      this.p_name = p_name;
      return this;
   }
   public String getP_price() {
      return p_price;
   }
   public CartVO setP_price(String p_price) {
      this.p_price = p_price;
      return this;
   }
   public String getP_content() {
      return p_content;
   }
   public CartVO setP_content(String p_content) {
      this.p_content = p_content;
      return this;
   }
   public String getU_id() {
      return u_id;
   }
   public CartVO setU_id(String u_id) {
      this.u_id = u_id;
      return this;
   }

   public int getP_id() {
      return p_id;
   }
   public CartVO setP_id(int p_id) {
      this.p_id = p_id;
      return this;
   }
   public int getAmount() {
      return amount;
   }
   public CartVO setAmount(int amount) {
      this.amount = amount;
      return this;
   }
   
   public String getCart_id() {
      return cart_id;
   }
   public CartVO setCart_id(String cart_id) {
      this.cart_id = cart_id;
      return this;
   }
   
   
   public int getCnt() {
      return cnt;
   }
   public CartVO setCnt(int cnt) {
      this.cnt = cnt;
      return this;
   }
   
   @Override
   public String toString() {
      return "CartVO [u_id=" + u_id + ", p_id=" + p_id + ", amount=" + amount + ", p_name=" + p_name + ", p_price="
            + p_price + ", p_content=" + p_content + ", cart_id=" + cart_id + ", cnt=" + cnt + "]";
   }

   
   
   
}








