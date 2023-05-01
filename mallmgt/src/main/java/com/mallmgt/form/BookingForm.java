package com.mallmgt.form;

import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.BookingDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookingForm extends BaseDTO {

	@NotEmpty(message = "First name is required")
	private String firstName;

	@NotEmpty(message = "Last name is required")
	private String lastName;
	
	@NotEmpty(message = "Email is required")
	private String email;
	
	@NotEmpty(message = "Phone number is required")
	private String phoneNumber;
	
	@NotEmpty(message = "Parking name is required")
	private String parkingName;
	
	@NotEmpty(message = "Slot ID is required")
	private String slotId;;
	
	@NotEmpty(message = "From Booking Date is required")
	private String fromBookingDate;
	
	@NotEmpty(message = "To Booking Date is required")
	private String toBookingDate;
	
	@NotEmpty(message = "From time is required")
	private String fromTime;
	
	@NotEmpty(message = "To time is required")
	private String toTime;
	
	@NotEmpty(message = "Address is required")
	private String address;
	
	private long slot;

	public BookingDTO getDTO() {
		
		BookingDTO bean=new BookingDTO();
		
		bean.setId(id);
		bean.setFirstName(firstName);
		bean.setLastName(lastName);
		bean.setEmail(email);
		bean.setPhoneNumber(phoneNumber);
		bean.setParkingName(parkingName);
		bean.setSlotId(DataUtility.getLong(slotId));
		bean.setFromBookingDate(DataUtility.getDate1(fromBookingDate));
		bean.setToBookingDate(DataUtility.getDate1(toBookingDate));
		bean.setFromTime(fromTime);
		bean.setToTime(toTime);
		bean.setAddress(address);
		bean.setSlot(slot);
		return bean;
	}

	public void populate(BookingDTO bean) {
		
		id = bean.getId();
		firstName=bean.getFirstName();
		lastName=bean.getLastName();
		email = bean.getEmail();
		phoneNumber = bean.getPhoneNumber();
		parkingName = bean.getParkingName();
		slotId = DataUtility.getStringData(bean.getSlotId());
		fromBookingDate = DataUtility.getStringData(bean.getFromBookingDate());
		toBookingDate = DataUtility.getStringData(bean.getToBookingDate());
		fromTime = bean.getFromTime();
		toTime = bean.getToTime();
		address = bean.getAddress();
		slot = bean.getSlot();
	}

	@Override
	public String toString() {
		return "BookingForm [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", phoneNumber="
				+ phoneNumber + ", parkingName=" + parkingName + ", slotId=" + slotId + ", fromBookingDate="
				+ fromBookingDate + ", toBookingDate=" + toBookingDate + ", fromTime=" + fromTime + ", toTime=" + toTime
				+ "]";
	}
	
	
	
	
}
