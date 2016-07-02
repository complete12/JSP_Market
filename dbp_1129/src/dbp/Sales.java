package dbp;
import java.sql.*;
public class Sales {
	private int s_id;
	private int p_id;
	private Date s_Date;
	private int s_quantity;
	
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
	
}
