package com.wedding.app.vo;

public class ChangeVO {
	private int no;
	private String reason;
	private String writedate;
	private String change;
	private String userid;
	
	@Override
	public String toString() {
		return "ChangeVO [no=" + no + ", reason=" + reason + ", writedate=" + writedate + ", change=" + change
				+ ", userid=" + userid + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
