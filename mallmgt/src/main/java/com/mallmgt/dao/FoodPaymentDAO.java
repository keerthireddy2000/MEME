package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.FoodPaymentDTO;
import com.mallmgt.dto.PaymentDTO;

public interface FoodPaymentDAO extends JpaRepository<FoodPaymentDTO, Long> {
	
	public FoodPaymentDTO findById(long id);
	public List<FoodPaymentDTO> findByEmail(String email);
	

}
