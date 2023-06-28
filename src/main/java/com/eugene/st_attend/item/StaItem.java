package com.eugene.st_attend.item;

public class StaItem {
	private String staId;
	private String staIn;
	private String staOut;
	private String staAbsent;
	private String staAttendId;
	private String staMemo;
	
	public void setStaMemo(String staMemo)	{
		this.staMemo = staMemo;
	}
	
	public String getStaMemo()	{
		return staMemo;
	}
	
	public String getStaAttendId() {
		return staAttendId;
	}
	public void setStaAttendId(String staAttendId) {
		this.staAttendId = staAttendId;
	}
	public String getStaId() {
		return staId;
	}
	public void setStaId(String staId) {
		this.staId = staId;
	}
	public String getStaIn() {
		return staIn;
	}
	public void setStaIn(String staIn) {
		this.staIn = staIn;
	}
	public String getStaOut() {
		return staOut;
	}
	public void setStaOut(String staOut) {
		this.staOut = staOut;
	}
	public String getStaAbsent() {
		return staAbsent;
	}
	public void setStaAbsent(String staAbsent) {
		this.staAbsent = staAbsent;
	}
	
	
}
