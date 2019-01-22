package com.kh.auction.model;

import org.springframework.web.multipart.MultipartFile;

public class HAucBean {
	private MultipartFile[] auc_img;
	private String auc_img1;
	private String auc_img2;
	
	private String user_id;
	private String auc_info1;
	private String auc_info2;
	private String guarantee;
	private String guarantee_info;
	
	private long auc_price;
	private int auc_interval;
	
	private String auc_add; //µÓ∑œ¿œ
	private String auc_start;
	private String auc_end;
	
	
	private String auto_date_s;
	private String auto_date_e;
	private String auc_start1;
	private int s_hour;
	private int s_min;
	
	private int e_date;
	private int e_hour;
	private int e_min;
	
	private String method;
	private int method_price;
	
	private String auc_category1;
	
	private String con_id;
	private String auc_title;
	private String auc_content;
	
	public MultipartFile[] getAuc_img() {
		return auc_img;
	}
	public void setAuc_img(MultipartFile[] auc_img) {
		this.auc_img = auc_img;
	}
	public String getAuc_img1() {
		return auc_img1;
	}
	public void setAuc_img1(String auc_img1) {
		this.auc_img1 = auc_img1;
	}
	public String getAuc_img2() {
		return auc_img2;
	}
	public void setAuc_img2(String auc_img2) {
		this.auc_img2 = auc_img2;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAuc_info1() {
		return auc_info1;
	}
	public void setAuc_info1(String auc_info1) {
		this.auc_info1 = auc_info1;
	}
	public String getAuc_info2() {
		return auc_info2;
	}
	public void setAuc_info2(String auc_info2) {
		this.auc_info2 = auc_info2;
	}
	public String getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}
	public String getGuarantee_info() {
		return guarantee_info;
	}
	public void setGuarantee_info(String guarantee_info) {
		this.guarantee_info = guarantee_info;
	}
	public long getAuc_price() {
		return auc_price;
	}
	public void setAuc_price(long auc_price) {
		this.auc_price = auc_price;
	}
	public int getAuc_interval() {
		return auc_interval;
	}
	public void setAuc_interval(int auc_interval) {
		this.auc_interval = auc_interval;
	}
	public String getAuc_add() {
		return auc_add;
	}
	public void setAuc_add(String auc_add) {
		this.auc_add = auc_add;
	}
	public String getAuc_start() {
		return auc_start;
	}
	public void setAuc_start(String auc_start) {
		this.auc_start = auc_start;
	}
	public String getAuc_end() {
		return auc_end;
	}
	public void setAuc_end(String auc_end) {
		this.auc_end = auc_end;
	}
	
	public String getAuto_date_s() {
		return auto_date_s;
	}
	public void setAuto_date_s(String auto_date_s) {
		this.auto_date_s = auto_date_s;
	}
	public String getAuto_date_e() {
		return auto_date_e;
	}
	public void setAuto_date_e(String auto_date_e) {
		this.auto_date_e = auto_date_e;
	}
	public String getAuc_start1() {
		return auc_start1;
	}
	public void setAuc_start1(String auc_start1) {
		this.auc_start1 = auc_start1;
	}
	public int getS_hour() {
		return s_hour;
	}
	public void setS_hour(int s_hour) {
		this.s_hour = s_hour;
	}
	public int getS_min() {
		return s_min;
	}
	public void setS_min(int s_min) {
		this.s_min = s_min;
	}
	public int getE_date() {
		return e_date;
	}
	public void setE_date(int e_date) {
		this.e_date = e_date;
	}
	public int getE_hour() {
		return e_hour;
	}
	public void setE_hour(int e_hour) {
		this.e_hour = e_hour;
	}
	public int getE_min() {
		return e_min;
	}
	public void setE_min(int e_min) {
		this.e_min = e_min;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public int getMethod_price() {
		return method_price;
	}
	public void setMethod_price(int method_price) {
		this.method_price = method_price;
	}
	public String getAuc_category1() {
		return auc_category1;
	}
	public void setAuc_category1(String auc_category1) {
		this.auc_category1 = auc_category1;
	}
	public String getCon_id() {
		return con_id;
	}
	public void setCon_id(String con_id) {
		this.con_id = con_id;
	}
	public String getAuc_title() {
		return auc_title;
	}
	public void setAuc_title(String auc_title) {
		this.auc_title = auc_title;
	}
	public String getAuc_content() {
		return auc_content;
	}
	public void setAuc_content(String auc_content) {
		this.auc_content = auc_content;
	}
}
