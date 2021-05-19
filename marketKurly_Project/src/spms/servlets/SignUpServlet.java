package spms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;

@WebServlet("/view/join/signUp")
@SuppressWarnings("serial")
public class SignUpServlet extends HttpServlet {
   
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      RequestDispatcher rd = 
            req.getRequestDispatcher("/view/join/signUp.jsp");
      rd.forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html;charset=UTF-8");
      
      String userId = req.getParameter("userId");
      String userPassword1 = req.getParameter("userPassword1");
      String userPassword2= req.getParameter("userPassword2");
      String userName = req.getParameter("userName");
      String userPhoneNum = req.getParameter("userPhoneNum");
      String userAddress = req.getParameter("userAddress");
      
      // 값이 입력되지 않았을 떄,
      if(userId == null || userId.equals("") || userPassword1 == null || userPassword1.equals("") || 
            userPassword2 == null || userPassword2.equals("") || 
            userName == null || userName.equals("") || userPhoneNum == null || userPhoneNum.equals("") ||
                  userAddress == null || userAddress.equals("")) {
         req.getSession().setAttribute("messageType", "오류 메시지");
         req.getSession().setAttribute("messageContent","모든 내용을 입력해주세요");
         resp.sendRedirect("signUp.jsp");
         System.out.println("모든내용");
         return;
      }
      
      // 정보가 일치하지 않을 떄,
      if(!userPassword1.equals(userPassword2)) {
         req.getSession().setAttribute("messageType", "오류 메시지");
         req.getSession().setAttribute("messageContent","비밀번호가 일치하지 않습니다");
         resp.sendRedirect("signUp.jsp");
         System.out.println("불일치");
         return;
      }
      
      // 성공적으로 정보가 입력되었을 떄,
      int result = new MemberDao()
                  .register(userId, userPassword1, userName, userPhoneNum, userAddress);
      if(result == 1) {
         // 회원정보가 기존에 없다면
         req.getSession().setAttribute("messageType", "성공 메시지");
         req.getSession().setAttribute("messageContent","회원가입에 성공했습니다");
         System.out.println("success");
         resp.sendRedirect("logIn.jsp");
         return;
      }
      else {
         // 회원정보가 기존에 있다면
         req.getSession().setAttribute("messageType", "오류 메시지");
         req.getSession().setAttribute("messageContent","이미 존재하는 회원입니다");
         System.out.println("이미 존재");
         resp.sendRedirect("signUp.jsp");
         return;
      }
      
   }
}

