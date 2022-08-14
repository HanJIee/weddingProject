package com.wedding.app.vo;

public class UserVO {
	private String userid;
	private String userpwd;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String gender;
	private String writedate;
	
	
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpwd=" + userpwd + ", tel=" + tel + ", gender=" + gender
				+ ", writedate=" + writedate + "]";
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getTel() {
		return tel1+ "-" + tel2 + "-" +tel3;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String telSplit[] = tel.split("-");
		tel1= telSplit[0];
		tel2= telSplit[1];
		tel3= telSplit[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
	
	
	
}
