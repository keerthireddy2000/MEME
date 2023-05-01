package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="game")
@Getter
@Setter
public class GameDTO extends BaseDTO {

	@Column(name = "gameName", length = 755)
	private String gameName;
	
	@Column(name = "pricePerHour")
	private long pricePerHour;
	
	@Column(name = "instrcutions", length = 755)
	private String instructions;
	
	@Column(name = "videoLink", length = 755)
	private String videoLink;

	 @Column(name = "image", columnDefinition = "LONGBLOB")
	    private byte[] image;

	@Override
	public String toString() {
		return "GameDTO [gameName=" + gameName + ", pricePerHour=" + pricePerHour + ", instructions=" + instructions
				+ ", videoLink = " + videoLink + "]";
	}
	
	
	
	
	
	
}
