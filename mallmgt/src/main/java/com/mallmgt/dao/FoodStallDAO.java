package com.mallmgt.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.FoodStallDTO;


public interface FoodStallDAO extends JpaRepository<FoodStallDTO, Long>{

	public FoodStallDTO findByStallName(String stallName);
	public FoodStallDTO findById(long id);

}