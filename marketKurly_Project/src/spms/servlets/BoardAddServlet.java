package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet("/view/reviewboard/add")
public class BoardAddServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher
							("/view/reviewboard/boardWrite.jsp");  // 보여줄 경로
		rd.forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			ServletContext sc = this.getServletContext();
			BoardDao boardDao = (BoardDao)sc.getAttribute("boardDao");
			
			DateFormat dateFormat = new SimpleDateFormat ("yyyy.MM.dd");
			boardDao.insert(new Board()
//					.setBoardNo(Integer.parseInt(req.getParameter("boardNo")))
			        .setWriter(req.getParameter("writer"))
			        .setBoardTitle(req.getParameter("boardTitle"))
			        .setBoardContent(req.getParameter("boardContent")));
//			        .setRegistrationDate(dateFormat.parse(req.getParameter("registrationDate"))));
			
			// 묻지도 따지지도 않고 바로 add -> list로 이동
			resp.sendRedirect("list");		
			
		}catch(Exception e) {
			//throw new ServletException(e);
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
	}
}