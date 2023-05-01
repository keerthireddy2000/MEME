package com.mallmgt.form;

import javax.validation.constraints.NotEmpty;

import com.mallmgt.dto.BaseDTO;
import com.mallmgt.dto.FoodPaymentDTO;
import com.mallmgt.dto.PaymentDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodPaymentForm extends BaseDTO {

	@NotEmpty(message = "Card Number is required")
	private String cardNumber;
	
	@NotEmpty(message = "Name On Card is required")
	private String nameOnCard;
	
	@NotEmpty(message = "Expiry Date is required")
	private String expireDate;
	
	private long totalPrice;
	

	
	public FoodPaymentDTO getDTO() {
		
		FoodPaymentDTO bean=new FoodPaymentDTO();
		bean.setId(id);
		bean.setCardNumber(cardNumber);
		bean.setNameOnCard(nameOnCard);
		bean.setExpireDate(expireDate);
		bean.setTotalPrice(totalPrice);


		return bean;
	}

	public void populate(FoodPaymentDTO bean) {
		id = bean.getId();
		cardNumber = bean.getCardNumber();
		nameOnCard = bean.getNameOnCard();
		expireDate = bean.getExpireDate();
		totalPrice = bean.getTotalPrice();

	}
}
