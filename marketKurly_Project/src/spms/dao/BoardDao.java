package spms.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.vo.Board;

public class BoardDao {

	DataSource ds = null;

	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}

	public List<Board> selectList() throws Exception {
		Connection connection = null;
		Statement stmt = null; // Statement객체를 생성하여 질의 수행을 해준다.
		ResultSet rs = null; // ResultSet 객체를 생성하여 결과를 저장해준다.
		final String sqlSelect = "SELECT rboard_no,writer,rboard_title,reg_date" + "\r\n"
				+ "FROM reviewboard" + "\r\n" + "ORDER BY rboard_no ASC";
		try {
			connection = ds.getConnection();

			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);

			ArrayList<Board> boards = new ArrayList<Board>();

			while (rs.next()) {
				boards.add(new Board().setBoardNo(rs.getInt("rboard_no"))
						.setWriter(rs.getString("writer"))
						.setBoardTitle(rs.getString("rboard_title"))
//						.setBoardContent(rs.getString("rboard_content"))
						.setRegistrationDate(rs.getDate("reg_date")));
			}
			return boards;
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
				/*
				 * DataSource가 빌려준 Connection은 close()시 연결이 종료되는 것이 아니라 반납하는 의미이다
				 */
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public int insert(Board board) throws Exception {
		Connection connection = null;
		int result = 0;
		PreparedStatement stmt = null;
		final String sqlInsert = "INSERT INTO reviewboard(writer,rboard_title,rboard_content,reg_date) "
									+ "VALUES(?, ?, ?, NOW())";

		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlInsert);
//			stmt.setInt(1, board.getBoardNo());
			stmt.setString(1, board.getWriter());
			stmt.setString(2, board.getBoardTitle());
			stmt.setString(3, board.getBoardContent());			
			result = stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
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

		return result;
	}
	public int delete(int boardNo) throws Exception {
		Connection connection = null;
		int result = 0;
		Statement stmt = null;
		final String sqlDelete = "DELETE FROM REVIEWBOARD WHERE RBOARD_NO=";

		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.createStatement();
			result = stmt.executeUpdate(sqlDelete + boardNo);

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
	public Board selectOne(int boardNo) throws Exception {
		Connection connection = null;
		Board board = null;
		Statement stmt = null;
		ResultSet rs = null;

		final String sqlSelectOne = "SELECT RBOARD_NO,WRITER,RBOARD_TITLE,RBOARD_CONTENT,REG_DATE FROM REVIEWBOARD" 
										+ " WHERE RBOARD_NO=";

		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelectOne + boardNo);
			if (rs.next()) {
				board = new Board()
						.setBoardNo(rs.getInt("RBOARD_NO"))
						.setWriter(rs.getString("WRITER"))
						.setBoardTitle(rs.getString("RBOARD_TITLE"))
						.setBoardContent(rs.getString("RBOARD_CONTENT"))
						.setRegistrationDate(rs.getDate("REG_DATE"));						

			} else {
				throw new Exception("해당 번호의 글을 찾을 수 없습니다.");
			}

		} catch (Exception e) {
			throw e;
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

		return board;
	}
	public int update(Board board) throws Exception {
		Connection connection = null;
		int result = 0;
		PreparedStatement stmt = null;
		final String sqlUpdate = "UPDATE REVIEWBOARD SET RBOARD_TITLE=?,,RBOARD_CONTENT=?,REG_DATE=now()" 
									+ " WHERE RBOARD_NO=?";
		try {
			// 커넥션 풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlUpdate);
			stmt.setString(1, board.getBoardTitle());
			stmt.setString(2, board.getBoardContent());			
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
	

}