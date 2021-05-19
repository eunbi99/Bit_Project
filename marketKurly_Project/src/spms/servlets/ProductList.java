package spms.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spms.dao.ProductDao;
import spms.vo.ProductVO;


@SuppressWarnings("serial")
@WebServlet("/view/admin/list")
public class ProductList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext sc = this.getServletContext();
		ProductDao ProductDao = (ProductDao)sc.getAttribute("ProductDao");
		
		System.out.println("확인1");
		
		try {			
			List<ProductVO> pVo = ProductDao.selectList();
			
			resp.setContentType("text/html; charset=UTF-8"); // 먼저 호출
	
			req.setAttribute("pVo", pVo);
			
			RequestDispatcher rd = 
					req.getRequestDispatcher("../admin/productList.jsp");
			rd.include(req, resp);
		
			
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
			System.out.println("확인3");
		}
		
	
	}
	
	
	
//	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable{
//		
//		req.setCharacterEncoding("UTF-8");
//		
//		System.out.println("1");
//		
//		ArrayList<ProductVO> registeredItemList = ProductDao.getInstance().selectList();
//	
//		
//		int cnt = registeredItemList.size();
//		
//		
//		System.out.println("13");
//		
//		if(cnt > 0) {
//			req.setAttribute("registeredItemList", registeredItemList);
//			
//		}
//		
//		req.setAttribute("type", new Integer(0));
//		req.setAttribute("cnt", new Integer(cnt));
//		
//		System.out.println("1234");
//		
//		return "view/admin/productList.jsp";
//		
//		
//		
//		
//	}
	
	
}
