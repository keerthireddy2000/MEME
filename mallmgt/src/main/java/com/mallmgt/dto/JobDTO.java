package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="job")
@Getter
@Setter
public class JobDTO extends BaseDTO {

	   @Column(name = "userId")
	   private long userId;
	   
	   @Column(name = "jobName", length = 755)
	   private String jobName;
	   
	   @Column(name = "description", length = 755)
	   private String description;
	   
	   @Column(name = "contactNumber", length = 755)
	   private String contactNumber;
	   
	   @Column(name = "email", length = 755)
	   private String email;
	   

	   
}
