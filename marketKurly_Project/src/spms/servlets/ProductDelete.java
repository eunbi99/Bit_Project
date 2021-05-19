package spms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.ProductDao;
import spms.vo.ProductVO;

@WebServlet("/view/admin/productDelete")
public class ProductDelete extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    
    public ProductDelete() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 
	         ServletContext sc = this.getServletContext();
	         ProductDao productDao = (ProductDao) sc.getAttribute("productDao");
	         
	         int p_id = Integer.parseInt(request.getParameter("p_id") == null?"":request.getParameter("p_id"));
	         productDao.delete(p_id);
	         
	     
	         response.sendRedirect(request.getContextPath()  + "/view/admin/list");

	      } catch (Exception e) {
	         e.printStackTrace();
	         request.setAttribute("error", e);
	         RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
	         rd.forward(request, response);
	      }
	   }
}
