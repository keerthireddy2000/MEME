package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="applyjob")
@Getter
@Setter
public class ApplyJobDTO  extends BaseDTO{

	@Column(name = "jobId")
	private long jobId;
	
	@Column(name = "jobName")
	private String jobName;
	
	@Column(name = "userId")
	private long userId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phoneNumber")
	private String phoneNumber;
	
	@Column(name = "experience", length = 755)
	private String experience;
	
	@Column(name = "status", length = 755)
	private String status;
	
	 @Column(name = "file", columnDefinition = "LONGBLOB")
	  private byte[] file;

	@Override
	public String toString() {
		return "ApplyJobDTO [jobId=" + jobId + ", userId=" + userId + ", name=" + name + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", experience=" + experience + ", status=" + status + " , jobName=" + jobName + "]";
	}
	
	
	
	
}
