package spms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import spms.dao.ProductDao;
import spms.vo.ProductVO;


@WebServlet("/view/admin/add")
public class ProductAdd extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	
	public ProductAdd() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher
							("../admin/insertProduct.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		//파일
//		String realFolder ="";
//		String fileName = "";
//		MultipartRequest imageup = null;
//		
//		String saveFolder = "/upload";
//		String encType = "UTF-8";
//		int max_size = 2 * 1024 * 1024;
//		
//		ServletContext context = req.getSession().getServletContext();
//		realFolder = context.getRealPath(saveFolder);
//		
//		try {
//			imageup = new MultipartRequest(req, realFolder, max_size, encType, new DefaultFileRenamePolicy());
//			Enumeration<?> files = imageup.getFileNames();
//			
//			while(files.hasMoreElements()) {
//				String name = (String)files.nextElement();
//				fileName = imageup.getFilesystemName(name);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		String p_name = imageup.getParameter("p_name");
//		String p_category = imageup.getParameter("p_category");
//		String p_price = imageup.getParameter("p_price");
//		String P_count = imageup.getParameter("p_count");
//		String p_content = imageup.getParameter("p_content");
//		
//		ProductVO pVo = new ProductVO();
//		pVo.setP_category(p_category);
//		pVo.setP_name(p_name);
//		pVo.setP_price(p_price);
//		pVo.setP_count(Integer.parseInt(P_count));
//		pVo.setP_content(p_content);
//		
//		if(fileName != null) {
//			
//			pVo.setP_file_upload(fileName);
//		}else {
//			pVo.setP_file_upload("이미지 출력안됨.");
//			
//			
//		}
//		
//		ProductDao dao = ProductDao.getInstance();
//		
//		try {
//			dao.insertProduct(pVo);
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
//		
//		req.setAttribute("type", new Integer(0));
//		
		
		
		ServletContext sc = req.getSession().getServletContext();
		
		System.out.println("확인1");
		
		ProductDao ProductDao = (ProductDao)sc.getAttribute("ProductDao");		
		int uploadFileSizeLimit= 5*1024*1024;
		String encType="UTF-8"; 
		String savePath="/upload"; 
		String uploadFilePath=sc.getRealPath(savePath);
		
		
		MultipartRequest multi= new MultipartRequest(req,
								uploadFilePath,
								uploadFileSizeLimit,
								encType,
								new DefaultFileRenamePolicy());
				
		//업로드된 파일이름 구하기
		String fileName = multi.getFilesystemName("uploadFile");
		
		if(fileName==null) { //파일업로드가 안되면
			System.out.println("파일 업로드가 안되었습니다.");
			
		
		}
		
				
		ProductVO pVo = new ProductVO();
		pVo.setP_file_upload(fileName);
		pVo.setP_category(Integer.parseInt(multi.getParameter("p_category")));
		pVo.setP_content(multi.getParameter("p_content"));
		pVo.setP_count(Integer.parseInt(multi.getParameter("p_count")));
		pVo.setP_name(multi.getParameter("p_name"));
		pVo.setP_price(Integer.parseInt(multi.getParameter("p_price")));
		

	
		try {
			
			 ProductDao.insert(pVo);
			 
			 req.setAttribute("type", 0);
			 // 묻지도 따지지도 않고 바로 add -> list로 이동
			 resp.sendRedirect("../admin/list");	
				
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
	  }	
	}

