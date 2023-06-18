package com.modernhome.domain;

public class InorderVO {
	
	private Integer io_id;
	private String io_num;
	private Integer ma_id;
	private Integer io_cnt;
	private Integer io_amount;
	private String io_unit;
	private java.util.Date io_date;
	private String io_state;
	private java.util.Date rec_date; 
	private Integer clt_id;
	private Integer emp_id;
	
	
	// join 할 테이블
	private MaterialVO materialVO;
	private ClientVO clientVO;
	
	
	public Integer getIo_id() {
		return io_id;
	}
	public void setIo_id(Integer io_id) {
		this.io_id = io_id;
	}
	public String getIo_num() {
		return io_num;
	}
	public void setIo_num(String io_num) {
		this.io_num = io_num;
	}
	public Integer getMa_id() {
		return ma_id;
	}
	public void setMa_id(Integer ma_id) {
		this.ma_id = ma_id;
	}
	public Integer getIo_cnt() {
		return io_cnt;
	}
	public void setIo_cnt(Integer io_cnt) {
		this.io_cnt = io_cnt;
	}
	public Integer getIo_amount() {
		return io_amount;
	}
	public void setIo_amount(Integer io_amount) {
		this.io_amount = io_amount;
	}
	public String getIo_unit() {
		return io_unit;
	}
	public void setIo_unit(String io_unit) {
		this.io_unit = io_unit;
	}
	public java.util.Date getIo_date() {
		return io_date;
	}
	public void setIo_date(java.util.Date io_date) {
		this.io_date = io_date;
	}
	public String getIo_state() {
		return io_state;
	}
	public void setIo_state(String io_state) {
		this.io_state = io_state;
	}
	public java.util.Date getRec_date() {
		return rec_date;
	}
	public void setRec_date(java.util.Date rec_date) {
		this.rec_date = rec_date;
	}
	public Integer getClt_id() {
		return clt_id;
	}
	public void setClt_id(Integer clt_id) {
		this.clt_id = clt_id;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	
	public MaterialVO getMaterialVO() {
		return materialVO;
	}
	public ClientVO getClientVO() {
		return clientVO;
	}
	
	@Override
	public String toString() {
		return "InorderVO [io_id=" + io_id + ", io_num=" + io_num + ", ma_id=" + ma_id + ", io_cnt=" + io_cnt
				+ ", io_amount=" + io_amount + ", io_unit=" + io_unit + ", io_date=" + io_date + ", io_state="
				+ io_state + ", rec_date=" + rec_date + ", clt_id=" + clt_id + ", emp_id=" + emp_id + "]";
	}
	
}