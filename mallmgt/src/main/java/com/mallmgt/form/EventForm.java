package com.mallmgt.form;

import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.EventDTO;
import com.mallmgt.dto.ShopDTO;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class EventForm extends BaseDTO{
	
	
	@NotEmpty(message = "Event name is required")
	private String eventName;
	
	@NotEmpty(message = "Theatre Number is required")
	private String theatreNumber;
	
	@NotEmpty(message = "Venue is required")
	private String venue;
	
	@NotEmpty(message = "Event type is required")
	private String type;
	
	@NotEmpty(message = "Date is required")
	private String date;
	
	@NotEmpty(message = "Time is required")
	private String time;

	   public EventDTO getDTO() {			
		   EventDTO bean=new EventDTO();			
			bean.setId(id);
	        bean.setEventName(eventName);
	        bean.setTheatreNumber(theatreNumber);
	        bean.setVenue(venue);
	        bean.setType(type);
	        bean.setDate(date);
	        bean.setTime(time);

			return bean;
		}

		public void populate(EventDTO bean) {
			id = bean.getId();
	        eventName = bean.getEventName();
	        theatreNumber = bean.getTheatreNumber();
	        venue = bean.getVenue();
	        type = bean.getType();
	        date = bean.getDate();
	        time = bean.getTime();

		}
}
