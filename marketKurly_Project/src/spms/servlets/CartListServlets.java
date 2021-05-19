package spms.servlets;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dao.CartDao;
import spms.vo.CartVO;
import spms.vo.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/view/cart/cart")
public class CartListServlets extends HttpServlet{
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      ServletContext sc = this.getServletContext();
      CartDao cartDao = (CartDao)sc.getAttribute("cartDao");
      
      HttpSession session = (HttpSession)req.getSession();
   
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      
      try {   
         
         List<CartVO> carts = cartDao.selectList(loginUser.getUserId());
         
         resp.setContentType("text/html; charset=UTF-8"); 
         req.setAttribute("carts", carts);
         
         RequestDispatcher rd = req.getRequestDispatcher("../cart/cart.jsp");
         rd.include(req, resp);
         
      }catch(Exception e) {
         req.setAttribute("error", e);
         RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
         rd.forward(req, resp);
      }
   }
}