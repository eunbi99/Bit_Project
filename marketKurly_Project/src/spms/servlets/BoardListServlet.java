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

import spms.dao.BoardDao;
import spms.vo.Board;

@SuppressWarnings("serial")
@WebServlet("/view/reviewboard/list")
public class BoardListServlet extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      ServletContext sc = this.getServletContext();
      BoardDao boardDao = (BoardDao)sc.getAttribute("boardDao");
      
      try {         
         List<Board> boards = boardDao.selectList();
         
         resp.setContentType("text/html; charset=UTF-8"); // 먼저 호출
   
         req.setAttribute("boards", boards);
         
         RequestDispatcher rd = 
               req.getRequestDispatcher("reviewBoard.jsp");  // 우리 jsp로 연결
         rd.include(req, resp);
         
      }catch(Exception e) {
         req.setAttribute("error", e);
         RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
         rd.forward(req, resp);
      }
   }
}