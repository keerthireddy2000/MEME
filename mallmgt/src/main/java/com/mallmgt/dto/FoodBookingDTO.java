package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="foodbooking")
@Getter
@Setter
public class FoodBookingDTO extends BaseDTO{

	@Column(name = "stallId")
	private long stallId;
	
	@Column(name = "foodName", length = 755)
	private String foodName;
	
	@Column(name = "foodPrice")
	private long foodPrice;
	
	@Column(name = "deliveryTime", length = 755)
	private String deliveryTime;
	
	@Column(name = "totalFoodPrice", length = 755)
	private String totalFoodPrice;
	
	@Column(name = "orderBy", length = 755)
	private String orderBy;
}
