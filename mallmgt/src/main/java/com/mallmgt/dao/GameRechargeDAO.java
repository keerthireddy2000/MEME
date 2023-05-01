package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.GameRechargeDTO;

public interface GameRechargeDAO extends JpaRepository<GameRechargeDTO, Long>{

	List<GameRechargeDTO> findAmountByUserId(long id);
	
}
