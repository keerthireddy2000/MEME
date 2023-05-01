package com.mallmgt.form;


import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.FoodMenuDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodMenuForm extends BaseDTO {

	private String stallId;

	@NotEmpty(message = "Stall Name is required")
	private String stallName;
	
	@NotEmpty(message = "Cuisine is required")
	private String cuisine;
	
	@NotEmpty(message = "Food Name is required")
	private String foodName;
	
	@NotEmpty(message = "Price is required")
	private String foodPrice;
	
	@NotEmpty(message = "Delivery Time is required")
	private String deliveryTime;
	
	
	public FoodMenuDTO getDTO() {
		FoodMenuDTO bean=new FoodMenuDTO();
		bean.setId(id);
		bean.setStallId(DataUtility.getLong(stallId));
		bean.setStallName(stallName);
		bean.setCuisine(cuisine);
		bean.setFoodName(foodName);
		bean.setFoodPrice(DataUtility.getLong(foodPrice));
		bean.setDeliveryTime(deliveryTime);
		return bean;
	}

	public void populate(FoodMenuDTO bean) {
		id = bean.getId();
		stallId = DataUtility.getStringData(bean.getStallId());
		stallName = bean.getStallName();
		foodName = bean.getFoodName();
		cuisine = bean.getCuisine();
		foodPrice = DataUtility.getStringData(bean.getFoodPrice());
		deliveryTime= bean.getDeliveryTime();

	}

	@Override
	public String toString() {
		return "FoodMenuForm [stallId=" + stallId + ", stallName=" + stallName + ", foodName=" + foodName
				+ ", foodPrice=" + foodPrice + ", deliveryTime=" + deliveryTime + ", cuisine=" + cuisine + "]";
	}
	
	
}
