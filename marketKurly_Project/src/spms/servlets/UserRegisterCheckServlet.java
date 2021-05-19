package spms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;

@WebServlet("/view/join/UserRegisterCheckServlet")
@SuppressWarnings("serial")
public class UserRegisterCheckServlet extends HttpServlet {
   
   private static final long serialVersionUID = 1L;

   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html;charset=UTF-8");
      
      String userId = req.getParameter("userId");
      resp.getWriter().write(new MemberDao().registerCheck(userId)+"");
   }
}

