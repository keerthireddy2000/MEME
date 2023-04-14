package com.mallmgt.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.DealDTO;


public interface DealDAO extends JpaRepository<DealDTO, Long> {

	public DealDTO findById(long id);
	public DealDTO findByDealName(String eventName);
}
