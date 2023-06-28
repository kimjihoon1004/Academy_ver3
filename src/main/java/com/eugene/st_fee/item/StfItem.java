package com.eugene.st_fee.item;

public class StfItem {
	private int feeId;
	private int stId;
	private int fee;
	private String feeCheck;
	private String feeMemo;
	private String feePrePay;
	
	
	public String getFeeMemo() {
		return feeMemo;
	}
	public void setFeeMemo(String feeMemo) {
		this.feeMemo = feeMemo;
	}
	public int getFeeId() {
		return feeId;
	}
	public void setFeeId(int feeId) {
		this.feeId = feeId;
	}
	public int getStId() {
		return stId;
	}
	public void setStId(int stId) {
		this.stId = stId;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getFeeCheck() {
		return feeCheck;
	}
	public void setFeeCheck(String feeCheck) {
		this.feeCheck = feeCheck;
	}
	public String getFeePrePay() {
		return feePrePay;
	}
	public void setFeePrePay(String feePrePay) {
		this.feePrePay = feePrePay;
	}
}
