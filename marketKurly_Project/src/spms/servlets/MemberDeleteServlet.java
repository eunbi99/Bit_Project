package spms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dao.MemberDao;
import spms.vo.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/view/mypage/delete")
public class MemberDeleteServlet extends HttpServlet {

   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
//      System.out.println("MemberDeleteServlet - doGet");
      try {
         HttpSession session = request.getSession();
         // 현재 로그인 된 객체의 정보를 담음
         MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
         MemberDao memberDao = new MemberDao();
         memberDao.delete(memberVO.getUserId());
         
         session.invalidate();

         response.sendRedirect("../index.jsp");

      } catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("error", e);
         RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
         rd.forward(request, response);

      } 
   }
}