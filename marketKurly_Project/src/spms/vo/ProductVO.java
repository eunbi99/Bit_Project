package spms.vo;

public class ProductVO {
	
	int p_id;
	String p_name;
	int p_price;
	String p_content;
	int p_category;
	int p_count; //상품 수량
	String p_file_upload; //상품이미지
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public String getP_file_upload() {
		return p_file_upload;
	}
	public void setP_file_upload(String p_file_upload) {
		this.p_file_upload = p_file_upload;
	}
	
	
	
	
}
