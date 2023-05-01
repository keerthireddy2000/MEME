package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="deal")
@Getter
@Setter
public class DealDTO extends BaseDTO{

	@Column(name = "dealName", length = 755)
	private String dealName;
	
	@Column(name = "description", length = 755)
	private String description;
	
	@Column(name = "dealType", length = 755)
	private String dealType;
		
	 @Column(name = "image", columnDefinition = "LONGBLOB")
	    private byte[] image;
}
