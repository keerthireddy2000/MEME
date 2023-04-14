package com.mallmgt.form;


import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieForm extends BaseDTO{
	
	@NotEmpty(message = "Title is required")
	private String title;

	@NotEmpty(message = "Description is required")
	private String description;
	
	@NotEmpty(message = "Show1 is required")
	private String show1;
	
	@NotEmpty(message = "Show2 is required")
	private String show2;

	@NotEmpty(message = "Show3 is required")
	private String show3;
	
	@NotEmpty(message = "Show4 is required")
	private String show4;
	
	@NotEmpty(message = "Show4 is required")
	private String show5;
	
	@NotEmpty(message = "Duration is required")
	private String duration;
	
	@NotEmpty(message = "Price is required")
	private String price;

	@NotEmpty(message = "Language is required")
	private String language;
	
	@NotEmpty(message = "Genre is required")
	private String genre;
	
	@NotEmpty(message = "Format is required")
	private String format;
	
	@NotEmpty(message = "Release Date is required")
	private String releaseDate;
	
	@NotEmpty(message = "Status is required")
	private String status;
	
	@NotEmpty(message = "Number of Seats is required")
	private String numberOfSeat;
	
	private String operation;
	
	public MovieDTO getDTO() {
		
		MovieDTO bean=new MovieDTO();
		
		bean.setId(id);
	    bean.setTitle(title);
	    bean.setDescription(description);
	    bean.setShow1(show1);
	    bean.setShow2(show2);
	    bean.setShow3(show3);
	    bean.setShow4(show4);
	    bean.setShow5(show5);
	    bean.setDuration(duration);
	    bean.setPrice(price);
	    bean.setLanguage(language);
	    bean.setGenre(genre);
	    bean.setFormat(format);
	    bean.setReleaseDate(releaseDate);
	    bean.setStatus(status);
	    bean.setNumberOfSeat(DataUtility.getLong(numberOfSeat));

		return bean;
	}

	public void populate(MovieDTO bean) {
		id = bean.getId();
		title=bean.getTitle();
		description=bean.getDescription();
		show1 = bean.getShow1();
		show2 = bean.getShow2();
		show3 = bean.getShow3();
		show4 = bean.getShow4();
		show5 = bean.getShow5();
		duration = bean.getDuration();
		price = bean.getPrice();
		language = bean.getLanguage();
		genre = bean.getGenre();
		format = bean.getFormat();
		releaseDate = bean.getReleaseDate();
		status = bean.getStatus();
		numberOfSeat = DataUtility.getStringData(bean.getNumberOfSeat());

	}


}
