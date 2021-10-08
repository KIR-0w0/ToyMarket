package com.toymarket.vo;

import java.util.Date;

public class ProductInquiry {
	
	private int no;
	private String title;
	private String content;
	private String replyContent;
	private String status;
	private Date createdDate;
	private Date replyCreatedDate;
	private int productNo;
	private int customerNo;
	private String secretYN;
	
	public ProductInquiry() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getReplyCreatedDate() {
		return replyCreatedDate;
	}

	public void setReplyCreatedDate(Date replyCreatedDate) {
		this.replyCreatedDate = replyCreatedDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getSecretYN() {
		return secretYN;
	}

	public void setSecretYN(String secretYN) {
		this.secretYN = secretYN;
	}
}
