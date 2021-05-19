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
@WebServlet("/view/reviewboard/detail")
public class BoardDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			ServletContext sc = this.getServletContext();
			BoardDao boardDao = (BoardDao) sc.getAttribute("boardDao");

//			Board board = boardDao.selectOne(Integer.parseInt(req.getParameter("boardNo")));
			
			int boardNo = (Integer.parseInt(req.getParameter("boardNo")));
			Board boards = boardDao.selectOne(boardNo);
			
			
			req.setAttribute("boards", boards);

			RequestDispatcher rd = req.getRequestDispatcher("boardContent.jsp");  //링크
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
	}
}
