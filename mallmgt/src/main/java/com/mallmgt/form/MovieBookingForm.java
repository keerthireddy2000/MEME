package com.mallmgt.form;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.MovieBookingDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieBookingForm extends BaseDTO {

	@NotEmpty(message = "Title is required")
	private String title;

	@NotEmpty(message = "Number of seats is required")
	private List<String> seats;
	
	@NotEmpty(message = "Release date is required")
	private String date;
	
	
	@NotEmpty(message = "First Name is required")
	private String firstName;

	@NotEmpty(message = "Last Name is required")
	private String lastName;
	
	@NotEmpty(message = "Email is required")
	private String email;
	
	@NotEmpty(message = "Ticket price is required")
	private String price;

	
public MovieBookingDTO getDTO() {
		
	MovieBookingDTO bean=new MovieBookingDTO();
		
		bean.setId(id);
	    bean.setTitle(title);
        bean.setSeats(seats);
        bean.setDate(DataUtility.getDate1(date));
        bean.setFirstName(firstName);
        bean.setLastName(lastName);
        bean.setEmail(email);
        bean.setPrice(DataUtility.getLong(price));


		return bean;
	}

	public void populate(MovieBookingDTO bean) {
		id = bean.getId();
		title=bean.getTitle();
        seats = bean.getSeats();
        date = DataUtility.getDateString(bean.getDate());
        firstName = bean.getFirstName();
        lastName = bean.getLastName();
        email = bean.getEmail();
        price = DataUtility.getStringData(bean.getPrice());


	}
	
}
