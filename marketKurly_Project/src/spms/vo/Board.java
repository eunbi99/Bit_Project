package spms.vo;

import java.util.Date;

public class Board {
	protected int boardNo;
	protected String writer;
	protected String boardTitle;
	protected String boardContent;
	protected Date registrationDate;
	
	
	public int getBoardNo() {
		return boardNo;
	}
	public Board setBoardNo(int boardNo) {
		this.boardNo = boardNo;
		return this;
	}
	public String getWriter() {
		return writer;
	}
	public Board setWriter(String writer) {
		this.writer = writer;
		return this;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public Board setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
		return this;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public Board setBoardContent(String boardContent) {
		this.boardContent = boardContent;
		return this;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public Board setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
		return this;
	}


}