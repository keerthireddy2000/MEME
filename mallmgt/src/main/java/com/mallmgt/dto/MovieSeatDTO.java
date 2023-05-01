package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="movieseat")
@Getter
@Setter
public class MovieSeatDTO extends BaseDTO {

	@Column(name = "movieId")
	private long movieId;
	
	@Column(name = "seat")
	private long seat;
	
	@Column(name = "status", length = 755)
	private String status;
	
	@Column(name = "showId")
	private long showId;
	
	
}
