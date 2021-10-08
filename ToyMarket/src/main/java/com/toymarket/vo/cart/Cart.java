package com.toymarket.vo.cart;

import java.util.Date;

public class Cart {
	
	private int cartNo;
	private int productNo;
	private int customerNo;
	private int price;
	private int amount;
	private Date createdDate;
	private String productName;
	private String productImage;
	private double  discountRate;
	

public Cart() {}


public Cart(int cartNo, int productNo, int customerNo, int price, int amount, Date createdDate, String productName,
		String productImage, double discountRate) {
	super();
	this.cartNo = cartNo;
	this.productNo = productNo;
	this.customerNo = customerNo;
	this.price = price;
	this.amount = amount;
	this.createdDate = createdDate;
	this.productName = productName;
	this.productImage = productImage;
	this.discountRate = discountRate;
}


public int getCartNo() {
	return cartNo;
}


public void setCartNo(int cartNo) {
	this.cartNo = cartNo;
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


public int getPrice() {
	return price;
}


public void setPrice(int price) {
	this.price = price;
}


public int getAmount() {
	return amount;
}


public void setAmount(int amount) {
	this.amount = amount;
}


public Date getCreatedDate() {
	return createdDate;
}


public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
}


public String getProductName() {
	return productName;
}


public void setProductName(String productName) {
	this.productName = productName;
}


public String getProductImage() {
	return productImage;
}


public void setProductImage(String productImage) {
	this.productImage = productImage;
}


public double getDiscountRate() {
	return discountRate;
}


public void setDiscountRate(double discountRate) {
	this.discountRate = discountRate;
}



}