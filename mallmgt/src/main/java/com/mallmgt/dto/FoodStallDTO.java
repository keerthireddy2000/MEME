package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="foodstall")
@Getter
@Setter
public class FoodStallDTO extends BaseDTO {

	@Column(name = "stallName", length = 755)
	private String stallName;
	
	@Column(name = "image", columnDefinition = "LONGBLOB")
    private byte[] image;


}
