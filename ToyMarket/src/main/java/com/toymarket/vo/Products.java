package com.toymarket.vo;

import java.util.Date;

public class Products {

	private int no;
	private int categoryNo;
	private String brand;
	private String name;
	private int price;
	private double discountRate;
	private String discountYN;
	private int likeCount;
	private String sellUnit;
	private String weight;
	private String morningDeliveryYN;
	private String description;
	private int stock;
	private Date createdDate;
	private String status;
	private String image;
	private String subTitle;
	
	public Products() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public double getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(double discountRate) {

		this.discountRate = discountRate;
	}

	public String getDiscountYN() {
		return discountYN;
	}

	public void setDiscountYN(String discountYN) {
		this.discountYN = discountYN;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getSellUnit() {
		return sellUnit;
	}

	public void setSellUnit(String sellUnit) {
		this.sellUnit = sellUnit;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getMorningDeliveryYN() {
		return morningDeliveryYN;
	}
	
	public String getMorningDeliveryMessage() {
		if ("N".equals(morningDeliveryYN)) {
			return "택배배송";
		}
		return "샛별배송";
	}

	public void setMorningDeliveryYN(String morningDeliveryYN) {
		this.morningDeliveryYN = morningDeliveryYN;
	}
}
