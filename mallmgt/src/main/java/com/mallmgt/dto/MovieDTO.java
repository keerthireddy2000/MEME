package com.mallmgt.dto;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="movie")
@Getter
@Setter
public class MovieDTO extends BaseDTO {
	
	@Column(name = "title", length = 755)
	private String title;

	@Column(name = "description", length = 755)
	private String description;
	
	@Column(name = "show1")
	private String show1;
	
	@Column(name = "show2", length = 755)
	private String show2;

	@Column(name = "show3", length = 755)
	private String show3;
	
	@Column(name = "show4", length = 755)
	private String show4;
	
	@Column(name = "show5", length = 755)
	private String show5;
	
	@Column(name = "duration")
	private String duration;
	
	@Column(name = "price", length = 755)
	private String price;

	@Column(name = "language", length = 755)
	private String language;
	
	@Column(name = "genre", length = 755)
	private String genre;
	
	@Column(name = "format", length = 755)
	private String format;
	
	@Column(name = "releaseDate", length = 755)
	private String releaseDate;
	
	@Column(name = "status", length = 755)
	private String status;
	
	@Column(name = "image", columnDefinition = "LONGBLOB")
    private byte[] image;
	
	@Column(name = "numberOfSeat")
	private long numberOfSeat;

	@Override
	public String toString() {
		return "MovieDTO [title=" + title + ", description=" + description + ", show1=" + show1 + ", show2=" + show2
				+ ", show3=" + show3 + ", show4=" + show4 + ", show5=" + show5 + ", duration=" + duration + ", price="
				+ price + ", language=" + language + ", genre=" + genre + ", format=" + format + ", releaseDate="
				+ releaseDate + ", status=" + status + ", image=" + Arrays.toString(image) + ", numberOfSeat="
				+ numberOfSeat + "]";
	}
	
	


}
