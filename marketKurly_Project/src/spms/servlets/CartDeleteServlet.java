package spms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.CartDao;

@SuppressWarnings("serial")
@WebServlet("/view/cart/delete")
public class CartDeleteServlet  extends HttpServlet {
      @Override
      public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
            ServletContext sc = this.getServletContext();
            CartDao cartDao = (CartDao) sc.getAttribute("cartDao");

            String u_id= req.getParameter("u_id");
            int p_id = (Integer.parseInt(req.getParameter("p_id")));
            cartDao.delete(p_id,u_id);

            resp.sendRedirect("../cart/cart");

         } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", e);
            RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
            rd.forward(req, resp);

         } 
      }
   }
