package com.mallmgt.form;


import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.ApplyJobDTO;
import com.mallmgt.dto.BaseDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApplyJobForm extends BaseDTO {

	private String jobId;
	
	private String jobName;
	
	private String userId;
	
	@NotEmpty(message =  "Name is required")
	private String name;
	
	@NotEmpty(message =  "Email is required")
	private String email;
	
	@NotEmpty(message =  "Phone Number is required")
	private String phoneNumber;
	
	@NotEmpty(message =  "Experience is required")
	private String experience;
	

	
	
	public ApplyJobDTO getDTO() {	
		ApplyJobDTO bean=new ApplyJobDTO();
			bean.setId(id);
			bean.setName(name);
			bean.setEmail(email);
			bean.setPhoneNumber(phoneNumber);
			bean.setExperience(experience);
			bean.setUserId(DataUtility.getLong(userId));
			bean.setJobId(DataUtility.getLong(jobId));
			bean.setJobName(jobName);

			return bean;
		}

		public void populate(ApplyJobDTO bean) {
			id = bean.getId();
	        name = bean.getName();
	        email = bean.getEmail();
	        phoneNumber = bean.getPhoneNumber();
	        experience = bean.getExperience();
	        userId = DataUtility.getStringData(bean.getUserId());
	        jobId = DataUtility.getStringData(bean.getJobId());
	        jobName = DataUtility.getStringData(bean.getJobName());

		}
}
