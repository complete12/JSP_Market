package dbp;

import java.sql.Date;

public class Sell {
	private int s_id;
	private int p_id;
	private String p_major_category;
	private String p_minor_category;
	private String p_name;
	private Date s_Date;
	private int s_quantity;
	private int s_amount;
	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_major_category() {
		return p_major_category;
	}
	public void setP_major_category(String p_major_category) {
		this.p_major_category = p_major_category;
	}
	public String getP_minor_category() {
		return p_minor_category;
	}
	public void setP_minor_category(String p_minor_category) {
		this.p_minor_category = p_minor_category;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Date getS_Date() {
		return s_Date;
	}
	public void setS_Date(Date s_Date) {
		this.s_Date = s_Date;
	}
	public int getS_quantity() {
		return s_quantity;
	}
	public void setS_quantity(int s_quantity) {
		this.s_quantity = s_quantity;
	}
	public int getS_amount() {
		return s_amount;
	}
	public void setS_amount(int s_amount) {
		this.s_amount = s_amount;
	}
	
}
