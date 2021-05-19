package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.vo.ProductVO;

public class ProductDao {
	DataSource ds = null;
	
	Connection connection = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	};
	
	public ProductDao() {
		
	};
	
	private static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() {
		return instance;
	}

	
	public List<ProductVO> selectList() throws Exception{
		
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		final String sqlSelect="SELECT p_id, p_category, p_name, p_price, p_count, p_content,  p_file_upload from product";
		
		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);
			
			ArrayList<ProductVO> pVo = new ArrayList<ProductVO>();
			
			while (rs.next()) {
				ProductVO product = new ProductVO();
				
				product.setP_id(rs.getInt("p_id"));
				product.setP_category(rs.getInt("p_category"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_count(rs.getInt("p_count"));
				product.setP_content(rs.getString("p_content"));
				product.setP_file_upload(rs.getString("p_file_upload"));
				
				pVo.add(product);
			}
			
			return pVo;

		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				/* DataSource가 빌려준 Connection은
				 * close()시 연결이 종료되는 것이 아니라
				 * 반납하는 의미이다
				 * */
				if(connection != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

		
	public  void insert(ProductVO product) throws Exception {
	
		try {
			
			connection = ds.getConnection();
			
			 int num = 0;
			 String sql = "SELECT MAX(p_id) from product";
			 pstmt = connection.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 num = rs.getInt(1);
			 }
			 
			 sql = "INSERT INTO product(p_id, p_category, p_name, p_price,";
			 sql += "p_count, p_content, p_file_upload) values (?,?,?,?,?,?,?)";
			 
			 
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, num +1);
			pstmt.setInt(2, product.getP_category());
			pstmt.setString(3, product.getP_name());
			pstmt.setInt(4, product.getP_price());
			pstmt.setInt(5, product.getP_count());
			pstmt.setString(6,product.getP_content());
			pstmt.setString(7, product.getP_file_upload());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				/* DataSource가 빌려준 Connection은
				 * close()시 연결이 종료되는 것이 아니라
				 * 반납하는 의미이다
				 * */
				if(connection != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
//	
//	public ArrayList<ProductVO> selectOne(int p_number){
//		ArrayList<ProductVO> p_list = new ArrayList<>();
//		
//		try {
//			
//			connection = ds.getConnection();
//			
//			String sql = "SELECT * FROM product WHERE p_number = ?";
//			pstmt = connection.prepareStatement(sql);
//			pstmt.setInt(1, p_number);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				ProductVO pVo = new ProductVO();
//				
//				pVo.setP_number(rs.getInt("p_number"));
//				pVo.setP_category(rs.getInt("p_category"));
//				pVo.setP_name(rs.getString("p_name"));
//				pVo.setP_price(rs.getInt("item_price"));
//				pVo.setP_count(rs.getInt("p_count"));
//				pVo.setP_file_upload(rs.getString("p_file_upload"));
//				pVo.setP_content(rs.getString("p_content"));
//		
//				
//				p_list.add(pVo);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(connection!=null) 
//				
//				try {connection.close();
//				
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//			
//				if(pstmt!=null) 
//					
//				try {
//					pstmt.close();
//					
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//				
//				if(rs!=null) 
//				
//				try {
//					rs.close();
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//			
//		}
//		
//		return p_list;
//	}

	

	public ProductVO selectOne(int p_id)  throws Exception {
		
		
		Connection connection = null;
		ProductVO pVo = null;
		Statement stmt = null;
		ResultSet rs = null;

		
		final String sqlSelectOne = "SELECT p_id, p_category, p_name, p_price, p_count, p_content, p_file_upload from product  WHERE p_id = "; 
		
		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			
	
			stmt = connection.createStatement();
	
			rs = stmt.executeQuery(sqlSelectOne + p_id);
			
			if (rs.next()) {
	
//			pVo = new ProductVO().setP_number(rs.getInt(columnIndex));


			 pVo = new ProductVO();				
			 pVo.setP_id(rs.getInt("p_id"));
			 pVo.setP_category(rs.getInt("p_category"));
			 pVo.setP_name(rs.getString("p_name"));
			 pVo.setP_price(rs.getInt("p_price"));
			 pVo.setP_count(rs.getInt("p_count"));
			 pVo.setP_content(rs.getString("p_content"));
			 pVo.setP_file_upload(rs.getString("p_file_upload"));
						
			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}

			try {
				/* DataSource가 빌려준 Connection은
				 * close()시 연결이 종료되는 것이 아니라
				 * 반납하는 의미이다
				 * */
				if(connection != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
		return pVo;
	}

	public void delete(int p_id) {

		try {
			
			connection = ds.getConnection();
			String sql = "DELETE from product where p_id = ?";
			 pstmt = connection.prepareStatement(sql);
			 pstmt.setInt(1,  p_id);
			
			 pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				/* DataSource가 빌려준 Connection은
				 * close()시 연결이 종료되는 것이 아니라
				 * 반납하는 의미이다
				 * */
				if(connection != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	public int update(ProductVO pVo) throws Exception {
		Connection connection = null;
		int result = 0;
		PreparedStatement stmt = null;
		final String sqlUpdate = "UPDATE product SET p_name=? , p_price=?, p_count=?, p_content=?, p_file_upload=?  WHERE p_id=? ";
		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlUpdate);
			stmt.setString(1, pVo.getP_name());
			stmt.setInt(2, pVo.getP_price());
			stmt.setInt(3, pVo.getP_count());
			stmt.setString(4, pVo.getP_content());
			stmt.setString(5, pVo.getP_file_upload());
			
			result = stmt.executeUpdate();

		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}

			try {
				/* DataSource가 빌려준 Connection은
				 * close()시 연결이 종료되는 것이 아니라
				 * 반납하는 의미이다
				 * */
				if(connection != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

//	public Member exist(String email, String password) throws Exception {
//		Connection connection = null;
//		Member member = null;
//		PreparedStatement stmt = null;
//		ResultSet rs = null;
//		final String sqlExist = "SELECT MNAME,EMAIL FROM MEMBERS" + " WHERE EMAIL=? AND PWD=?";
//
//		try {
//			// 커넥션 풀에서 Connection객체를 빌려온다
//			connection = ds.getConnection();
//			stmt = connection.prepareStatement(sqlExist);
//			stmt.setString(1, email);
//			stmt.setString(2, password);
//			rs = stmt.executeQuery();
//			if (rs.next()) {
//				member = new Member().setName(rs.getString("MNAME")).setEmail(rs.getString("EMAIL"));
//			} else {
//				return null;
//			}
//		} catch (Exception e) {
//			throw e;
//
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//			} catch (Exception e) {
//			}
//			try {
//				if (stmt != null)
//					stmt.close();
//			} catch (Exception e) {
//			}
//
//			try {
//				/* DataSource가 빌려준 Connection은
//				 * close()시 연결이 종료되는 것이 아니라
//				 * 반납하는 의미이다
//				 * */
//				if(connection != null)
//					connection.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//
//		return member;
//	}
	}

