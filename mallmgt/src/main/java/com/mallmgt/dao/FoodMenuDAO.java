package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.FoodMenuDTO;
import com.mallmgt.dto.FoodStallDTO;

public interface FoodMenuDAO extends JpaRepository<FoodMenuDTO, Long>{

	public FoodMenuDTO findByStallName(String stallName);
	public FoodMenuDTO findByFoodName(String foodName);
	public FoodMenuDTO findById(long id);
	public List<FoodMenuDTO> findByStallId(long id);

}
