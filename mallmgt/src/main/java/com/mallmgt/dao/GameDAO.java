package com.mallmgt.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.GameDTO;



public interface GameDAO extends JpaRepository<GameDTO, Long> {

	public GameDTO findById(long id);
	public GameDTO findInstrcutionsById(long id);
	public GameDTO findBygameName(String gameName);
	
}
