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

@WebServlet("/view/admin/productUpdate")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductUpdate() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd=request.getRequestDispatcher("updateForm.jsp"); 
		rd.forward(request, response);
	}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			ProductVO pVo = new ProductVO();
			pVo.setP_id(Integer.parseInt(req.getParameter("p_ic")));
			pVo.setP_category(Integer.parseInt(req.getParameter("p_category")));
			pVo.setP_price(Integer.parseInt(req.getParameter("p_price")));
			pVo.setP_count(Integer.parseInt(req.getParameter("p_count")));
			pVo.setP_content(req.getParameter("p_content"));
			pVo.setP_file_upload(req.getParameter("p_file_upload"));
			
			int p_id = Integer.parseInt(req.getParameter("p_id"));
			ServletContext sc = req.getSession().getServletContext();
			ProductDao ProductDao = (ProductDao)sc.getAttribute("ProductDao");
			
			try {
				ProductDao.update(pVo);
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			
			resp.sendRedirect("/admin/productUpdate.jsp");

		}
	
}