package com.mallmgt.form;

import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.dto.ParkingDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodStallForm extends BaseDTO {

	@NotEmpty(message = "Stall Name is required")
	private String stallName;
	
	@NotEmpty(message = "Stall Location is required")
	private String stallLocation;
	
	@NotEmpty(message = "Cuisine is required")
	private String cuisine;
	
	private String operation;
	
	public FoodStallDTO getDTO() {
		FoodStallDTO bean=new FoodStallDTO();
		bean.setId(id);
		bean.setStallName(stallName);
		bean.setCuisine(cuisine);
		bean.setStallLocation(stallLocation);
		return bean;
	}

	public void populate(FoodStallDTO bean) {
		id = bean.getId();
		stallName = bean.getStallName();
		stallLocation = bean.getStallLocation();
		cuisine = bean.getCuisine();
	}

}
