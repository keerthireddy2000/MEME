package com.mallmgt.form;

import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.DealDTO;
import com.mallmgt.dto.EventDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DealForm extends BaseDTO{
	
	@NotEmpty(message = "Name is required")
	private String dealName;
	
	@NotEmpty(message = "Description is required")
	private String description;
		
	private String dealType;
	
	 public DealDTO getDTO() {			
		 DealDTO bean=new DealDTO();			
			bean.setId(id);
	        bean.setDealName(dealName);
	        bean.setDescription(description);
	        bean.setDealType(dealType);
			return bean;
		}

		public void populate(DealDTO bean) {
			id = bean.getId();
	       dealName = bean.getDealName();
	       description = bean.getDescription();
	       dealType = bean.getDealType();

		}


}
