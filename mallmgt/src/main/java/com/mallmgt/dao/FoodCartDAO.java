package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.FoodCartDTO;


public interface FoodCartDAO extends JpaRepository<FoodCartDTO, Long>{

	public FoodCartDTO findByStallName(String stallName);
	public FoodCartDTO findByFoodName(String foodName);
	public FoodCartDTO findById(long id);
	public List<FoodCartDTO> findByStallId(long id);
	public List<FoodCartDTO> findByUserId(long id);
	public List<FoodCartDTO> findByPaymentStatus(String paymentStatus);
	
	
	
}
