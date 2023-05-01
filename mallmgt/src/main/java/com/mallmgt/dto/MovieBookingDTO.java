package com.mallmgt.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="moviebooking")
@Getter
@Setter
public class MovieBookingDTO extends BaseDTO {
	
	@Column(name = "title", length = 755)
	private String title;

	@ElementCollection // 1
	@CollectionTable(name = "seats") // 2
	@Column(name = "seat") 
	private List<String> seats;
	
	@Column(name = "firstName", length = 755)
	private String firstName;

	@Column(name = "lastName", length = 755)
	private String lastName;
	
	@Column(name = "email", length = 755)
	private String email;

	@Column(name = "price")
	private long price;
	
	@Column(name = "date")
	private Date date;
	
	private String dateString;
	
	@Column(name = "showTime", length = 755)
	private String showTime;
	
	@Column(name = "seatNumbers", length = 755)
	private String seatNumbers;

	@Override
	public String toString() {
		return "MovieBookingDTO [title=" + title + ", seats=" + seats + ", firstName=" + firstName + ", lastName="
				+ lastName + ", email=" + email + ", price=" + price + ", date=" + date + "]";
	}
	
	
	

}
