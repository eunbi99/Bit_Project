package spms.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.ProductDao;
import spms.vo.ProductVO;



@WebServlet("/view/admin/productDetail")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductDetail() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 
	         ServletContext sc = this.getServletContext();
	         ProductDao ProductDao = (ProductDao) sc.getAttribute("ProductDao");
	         
	         
	         int p_number = Integer.parseInt(request.getParameter("p_number"));
	         System.out.println("selectOne p_number : " + p_number);
	         ProductVO pVo = ProductDao.selectOne(p_number);
	        
	         request.setAttribute("pVo", pVo);
	     
	         
	         RequestDispatcher rd = request.getRequestDispatcher("productDetail.jsp");  //링크
	         rd.forward(request, response);

	      } catch (Exception e) {
	         e.printStackTrace();
	         request.setAttribute("error", e);
	         RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
	         rd.forward(request, response);
	      }
	   }
	}
