package spms.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

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
@WebServlet("/view/reviewboard/update")

public class BoardUpdateServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			ServletContext sc = this.getServletContext();
			BoardDao boardDao = (BoardDao) sc.getAttribute("boardDao");

			Board board = boardDao.selectOne(Integer.parseInt(req.getParameter("boardNo")));

			req.setAttribute("board", board);

			RequestDispatcher rd = req.getRequestDispatcher("boardUpdate.jsp");
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			ServletContext sc = this.getServletContext();

			BoardDao boardDao = (BoardDao) sc.getAttribute("boardDao");
			
			DateFormat dateFormat = new SimpleDateFormat ("yyyy.MM.dd"); 


			boardDao.update(new Board()
					.setBoardNo(Integer.parseInt(req.getParameter("boardNo")))
					.setWriter(req.getParameter("writer"))
					.setBoardTitle(req.getParameter("boardTitle"))
					.setBoardContent(req.getParameter("boardContent"))

			        .setRegistrationDate(dateFormat.parse(req.getParameter("registrationDate"))));

			resp.sendRedirect("list");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		} finally {
		}
	}
}