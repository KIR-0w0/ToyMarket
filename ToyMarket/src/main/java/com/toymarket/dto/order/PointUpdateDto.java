package com.toymarket.dto.order;

public class PointUpdateDto {

	private String userId;
	private int point;
	
	
	
	public PointUpdateDto(String userId, int point) {
		super();
		this.userId = userId;
		this.point = point;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "PointUpdateDto [userId=" + userId + ", point=" + point + "]";
	}
	
	
}
