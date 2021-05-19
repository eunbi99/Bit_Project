package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.CartDao;
import spms.vo.CartVO;

@SuppressWarnings("serial")
@WebServlet("/view/detail/add")
public class CartAddServlet extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      RequestDispatcher rd = req.getRequestDispatcher("/view/cart/cart.jsp");
      rd.forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("/view/detail/add - doPost");
      
      try {
         ServletContext sc = this.getServletContext();
         CartDao cartDao = (CartDao)sc.getAttribute("cartDao");
         
         int productCnt= cartDao.selectUseProductYn(Integer.parseInt(req.getParameter("p_id")),req.getParameter("u_id"));
         System.out.println("productCnt>>>"+productCnt);
         
         if(productCnt>0) {
            cartDao.cartAmountUpdate(new CartVO()
                    .setU_id(req.getParameter("u_id"))
                    .setAmount(Integer.parseInt(req.getParameter("amount")))
                    .setP_id(Integer.parseInt(req.getParameter("p_id")))
                    .setP_name(req.getParameter("p_name"))
                    .setP_content(req.getParameter("p_content")));
   
         }else {
            cartDao.cartinsert(new CartVO()
                    .setU_id(req.getParameter("u_id"))
                    .setAmount(Integer.parseInt(req.getParameter("amount")))
                    .setP_id(Integer.parseInt(req.getParameter("p_id")))
                    .setP_name(req.getParameter("p_name"))
                    .setP_content(req.getParameter("p_content")));
         }
         
         resp.sendRedirect("../cart/cart");   
         
      }catch(Exception e) {
         //throw new ServletException(e);
         e.printStackTrace();
         req.setAttribute("error", e);
         RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
         rd.forward(req, resp);
      }
   }
}














