package com.toymarket.dto.cart;

public class CartAddDto {
	
	private int productNo;
	private int amount;
	private int buyPrice;
	private String userId;

	public CartAddDto() {}
	
	public CartAddDto(int productNo, int amount, int buyPrice, String userId) {
		super();
		this.productNo = productNo;
		this.amount = amount;
		this.buyPrice = buyPrice;
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
