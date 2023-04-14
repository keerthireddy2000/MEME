package com.mallmgt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.FoodPaymentDAO;
import com.mallmgt.dao.PaymentDAO;
import com.mallmgt.dto.FoodPaymentDTO;
import com.mallmgt.dto.PaymentDTO;

@Service
public class FoodPaymentService {

	@Autowired
	public FoodPaymentDAO dao;
	
	public FoodPaymentDTO Add(FoodPaymentDTO dto) {
		FoodPaymentDTO  payment = dao.save(dto);
       return  payment;
	}
	

	public List<FoodPaymentDTO> list(){
		List<FoodPaymentDTO> dto = dao.findAll();
		return dto;
	}
	
	public List<FoodPaymentDTO> list(String email){
		List<FoodPaymentDTO> dto = dao.findByEmail(email);
		return dto;
	}
}
