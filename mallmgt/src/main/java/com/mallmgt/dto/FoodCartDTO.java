package com.mallmgt.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="foodcart")
@Getter
@Setter
public class FoodCartDTO extends BaseDTO {

	@Column(name = "stallId")
	private long stallId;
	
	@Column(name = "userId")
	private long userId;
	
	@Column(name = "foodId")
	private long foodId;
	
	@Column(name = "orderby", length = 755)
	private String orderby;
	
	@Column(name = "stallName", length = 755)
	private String stallName;
	
	@Column(name = "foodName", length = 755)
	private String foodName;
	
	@Column(name = "foodPrice")
	private long foodPrice;
	
	@Column(name = "unitPrice")
	private long unitPrice;
	
	@Column(name = "quantity")
	private long quantity;
	
	@Column(name = "deliveryTime", length = 755)
	private String deliveryTime;
	
	@Column(name = "paymentStatus", length = 755)
	private String paymentStatus;
	
	@Column(name = "deliveryStatus", length = 755)
	private String deliveryStatus;
	
	@Column(name = "status", length = 755)
	private String status;

	@Override
	public String toString() {
		return "FoodCartDTO [stallId=" + stallId + ", stallName=" + stallName + ", foodName=" + foodName
				+ ", foodPrice=" + foodPrice + ", deliveryTime=" + deliveryTime + ", paymentStatus=" + paymentStatus
				+  ", quantity=" + quantity + ", unitPrice=" + unitPrice + "]";
	}
	
	
}
