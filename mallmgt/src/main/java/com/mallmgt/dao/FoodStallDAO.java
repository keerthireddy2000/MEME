package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mallmgt.dto.FoodStallDTO;


public interface FoodStallDAO extends JpaRepository<FoodStallDTO, Long>{

	public FoodStallDTO findByStallName(String stallName);
	public FoodStallDTO findById(long id);
	@Query(value = "SELECT * FROM foodstall where cuisine like %?1% ", nativeQuery = true)
	public List<FoodStallDTO> findByCuisine(String filter);

}