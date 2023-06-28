package com.eugene.tc.item;

import java.util.List;
import java.util.ArrayList;

public class TeacherItem {
  private String tcId, tcName, tcDate, tcGender, tcPhone, tcMemo, tcPw, tcIssuper, tcMail;

  public String getId() {
    return tcId;
  }

  public void setId(String id) {
    this.tcId = id;
  }
  public String getName() {
    return tcName;
  }

  public void setName(String name) {
    this.tcName = name;
  }
  public String getDate() {
    return tcDate;
  }

  public void setDate(String date) {
    this.tcDate = date;
  }
  public String getGender() {
    return tcGender;
  }

  public void setGender(String gender) {
    this.tcGender = gender;
  }
  public String getMemo() {
    return tcMemo;
  }

  public void setMemo(String memo) {
    this.tcMemo = memo;
  }
  public String getPw() {
    return tcPw;
  }

  public void setPw(String pw) {
    this.tcPw = pw;
  }
  public String getIssuper() {
    return tcIssuper;
  }

  public void setIssuper(String issuper) {
    this.tcIssuper = issuper;
  }
  public String getPhone() {
    return tcPhone;
  }
  public void setPhone(String phone) {
    this.tcPhone = phone;
  }

public String getTcMail() {
	return tcMail;
}

public void setTcMail(String tcMail) {
	this.tcMail = tcMail;
}

  
}
