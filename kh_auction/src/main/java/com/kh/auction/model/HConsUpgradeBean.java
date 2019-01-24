package com.kh.auction.model;

public class HConsUpgradeBean {
	private int cons_no;
	
	private String button_info;
	private String  cons_result1;
	private String cons_result1_date;
	
	private String cons_go_date;
	private String i_s_time;
	private String i_e_time;
	private String cons_go_content;
	
	private String cons_ant_price;
	private String cons_ans;
	private String cons_result2;
	private String cons_result2_date;
	
	private String identify_update;//수정할 경우 식별
	
	private String auc_price;
	private String auc_interval;
	
	private String cons_commit;
	
	//

	public int getCons_no() {
		return cons_no;
	}

	public String getCons_result1_date() {
		return cons_result1_date;
	}

	public void setCons_result1_date(String cons_result1_date) {
		this.cons_result1_date = cons_result1_date;
	}

	public String getCons_go_content() {
		return cons_go_content;
	}

	public void setCons_go_content(String cons_go_content) {
		this.cons_go_content = cons_go_content;
	}

	public String getCons_result2() {
		return cons_result2;
	}

	public void setCons_result2(String cons_result2) {
		this.cons_result2 = cons_result2;
	}

	public String getCons_result2_date() {
		return cons_result2_date;
	}

	public void setCons_result2_date(String cons_result2_date) {
		this.cons_result2_date = cons_result2_date;
	}

	public String getButton_info() {
		return button_info;
	}

	public void setButton_info(String button_info) {
		this.button_info = button_info;
	}

	public void setCons_no(int cons_no) {
		this.cons_no = cons_no;
	}

	public String getCons_result1() {
		return cons_result1;
	}

	public void setCons_result1(String cons_result1) {
		this.cons_result1 = cons_result1;
	}

	public String getCons_go_date() {
		return cons_go_date;
	}

	public void setCons_go_date(String cons_go_date) {
		this.cons_go_date = cons_go_date;
	}

	public String getI_s_time() {
		return i_s_time;
	}

	public void setI_s_time(String i_s_time) {
		this.i_s_time = i_s_time;
	}

	public String getI_e_time() {
		return i_e_time;
	}

	public void setI_e_time(String i_e_time) {
		this.i_e_time = i_e_time;
	}

	public String getCons_ant_price() {
		return cons_ant_price;
	}

	public void setCons_ant_price(String cons_ant_price) {
		this.cons_ant_price = cons_ant_price;
	}

	public String getCons_ans() {
		return cons_ans;
	}

	public void setCons_ans(String cons_ans) {
		this.cons_ans = cons_ans;
	}

	public String getIdentify_update() {
		return identify_update;
	}

	public void setIdentify_update(String identify_update) {
		this.identify_update = identify_update;
	}

	public String getAuc_price() {
		return auc_price;
	}

	public void setAuc_price(String auc_price) {
		this.auc_price = auc_price;
	}

	public String getAuc_interval() {
		return auc_interval;
	}

	public void setAuc_interval(String auc_interval) {
		this.auc_interval = auc_interval;
	}

	public String getCons_commit() {
		return cons_commit;
	}

	public void setCons_commit(String cons_commit) {
		this.cons_commit = cons_commit;
	}
	
	
}
