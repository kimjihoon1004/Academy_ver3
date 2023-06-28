package com.eugene.crs.item;

public class CrsItem {
	private int crsId;
	private String crsName;
	private String crsMemo;
	
	
	public void setCrsId(int id) {
		crsId = id;
	}
	public int getCrsId() {
		return crsId;
	}
	
	public void setCrsName(String name) {
		crsName = name;
	}
	public String getCrsName() {
		return crsName;
	}
	
	public void setCrsMemo(String memo) {
		crsMemo = memo;
	}
	public String getCrsMemo() {
		return crsMemo;
	}
}