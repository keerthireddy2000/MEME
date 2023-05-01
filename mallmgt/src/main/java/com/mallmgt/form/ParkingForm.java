package com.mallmgt.form;

import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.ParkingDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParkingForm extends BaseDTO{
	
	@NotEmpty(message = "Parking name is required")
	private String parkingName;

	@NotEmpty(message = "Address is required")
	private String address;
	
	@NotEmpty(message = "Number of slots is required")
	private String numberOfSlot;
	
	
	public ParkingDTO getDTO() {
		ParkingDTO bean=new ParkingDTO();
		bean.setId(id);
		bean.setParkingName(parkingName);
		bean.setAddress(address);
		bean.setNumberOfSlot(DataUtility.getLong(numberOfSlot));
		return bean;
	}

	public void populate(ParkingDTO bean) {
		id = bean.getId();
		parkingName=bean.getParkingName();
		address=bean.getAddress();
		numberOfSlot = DataUtility.getStringData(bean.getNumberOfSlot());
	}


	

}
