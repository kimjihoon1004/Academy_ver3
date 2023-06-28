package com.eugene.tc_attend.item;

public class TcAttendItem {
	private int tcAttendId;
	private String tcAttendIn;
	private String tcAttendOut;
	private String tcAttendOff;
	private int atTcId;
	private String tcName; // 해당 tc_id의 부합하는 tc_name을 갖는 변수입니다.
	
	public void setAttendId(int id) {
		this.tcAttendId = id;
	}
	public int getAttendId() {
		return this.tcAttendId;
	}
	
	public void setAttendIn(String in) {
		this.tcAttendIn = in;
	}
	public String getAttendIn() {
		return this.tcAttendIn;
	}
	
	public void setAttendOut(String out) {
		this.tcAttendOut = out;
	}
	public String getAttendOut() {
		return this.tcAttendOut;
	}
	
	public void setAttendOff(String off) {
		this.tcAttendOff = off;
	}
	public String getAttendOff() {
		return this.tcAttendOff;
	}
	
	public void setAttendTcId(int id) {
		this.atTcId = id;
	}
	public int getAttendTcId() {
		return this.atTcId;
	}
	
	public void setTcName(String name) {
		this.tcName = name;
	}
	public String getTcName() {
		return this.tcName;
	}
	
	
}