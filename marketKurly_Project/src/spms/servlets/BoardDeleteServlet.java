package spms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.BoardDao;
import spms.vo.Board;

@SuppressWarnings("serial")
@WebServlet("/view/reviewboard/delete")
public class BoardDeleteServlet extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         ServletContext sc = this.getServletContext();
         BoardDao boardDao = (BoardDao) sc.getAttribute("boardDao");

         int boardNo =(Integer.parseInt(req.getParameter("no")));
         boardDao.delete(boardNo);

         resp.sendRedirect("list");

      } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("error", e);
         RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
         rd.forward(req, resp);

      } 
   }
}