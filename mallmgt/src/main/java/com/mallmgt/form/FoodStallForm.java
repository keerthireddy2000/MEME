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

	@NotEmpty(message = "Stall name is required")
	private String stallName;

	public FoodStallDTO getDTO() {
		FoodStallDTO bean=new FoodStallDTO();
		bean.setId(id);
		bean.setStallName(stallName);

		return bean;
	}

	public void populate(FoodStallDTO bean) {
		id = bean.getId();
		stallName = bean.getStallName();

	}

}
