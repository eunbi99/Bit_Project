package spms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dao.MemberDao;
import spms.vo.MemberVO;

@WebServlet("/view/join/login")
@SuppressWarnings("serial")
public class LogInServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/view/join/logIn.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();

		String userId = req.getParameter("userId");
		String userPassword = req.getParameter("userPassword");
		String userName = req.getParameter("userName");
		String userPhoneNum = req.getParameter("userPhoneNum");
		String userAddress = req.getParameter("userAddress");

				

		// 값이 입력되지 않았을 때,
		if (userId.equals("") || userId == null || userPassword.equals("") || userPassword == null) {
			out = resp.getWriter();
			out.println("<script>");
			out.println("alert('입력되지 않은 값이 있습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		} else {

			// 값이 입력됐다면,
			int result = new MemberDao().login(userId, userPassword);

			// 로그인 성공
			if (result == 1) {
				//MemberVO loginUser = new MemberVO();
				MemberVO loginUser = new MemberDao().selectOne(userId, userPassword);


				// 세션에 로그인 정보 저장
				// 로그인 정보를 session 공유 공간에 저장한다
				// 세션 timeout전까지는 보관된다
				HttpSession session = req.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setMaxInactiveInterval(60*60) ; // 1시간


				out.println("<script>");
//				out.println("alert('"+ userId +"님 로그인되었습니다.');");
				out.println("location.href = '../index.jsp'");
				out.println("</script>");
			} else if (result == 0) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else if (result == -1) {
				out.println("<script>");
				out.println("alert('존재하지 않는 아이디입니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else if (result == -2) {
				out.println("<script>");
				out.println("alert('데이터베이스 오류가 발생했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
			out.close();
		}
	}
}
