package com.mallmgt.form;

import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.GameRechargeDTO;
import com.mallmgt.utility.DataUtility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameRechargeForm extends BaseDTO{

	@NotEmpty(message = "Amount is required")
	private String amount;
	
	public GameRechargeDTO getDTO() {		
		GameRechargeDTO bean=new GameRechargeDTO();		
			bean.setId(id);
			bean.setAmount(DataUtility.getLong(amount));

			return bean;
		}

		public void populate(GameRechargeDTO bean) {
			id = bean.getId();
			amount = DataUtility.getStringData(bean.getAmount());
		}

	
	
}
