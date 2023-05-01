package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="foodmenu")
@Getter
@Setter
public class FoodMenuDTO extends BaseDTO {

	@Column(name = "stallId")
	private long stallId;
	
	@Column(name = "stallName", length = 755)
	private String stallName;
	
	@Column(name = "cuisine", length = 755)
	private String cuisine;
	
	@Column(name = "foodName", length = 755)
	private String foodName;
	
	@Column(name = "foodPrice")
	private long foodPrice;
	
	@Column(name = "deliveryTime", length = 755)
	private String deliveryTime;
	
	@Column(name = "image", columnDefinition = "LONGBLOB")
	private byte[] image;

	@Override
	public String toString() {
		return "FoodMenuDTO [stallId=" + stallId + ", stallName=" + stallName + ", foodName=" + foodName
				+ ", foodPrice=" + foodPrice + ", deliveryTime=" + deliveryTime +  ", cuisine=" + cuisine +"]";
	}
	
	
	
	
}
