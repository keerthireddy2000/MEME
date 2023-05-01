package com.mallmgt.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mallmgt.dto.ParkingDTO;


public interface ParkingDAO extends JpaRepository<ParkingDTO, Long>{

	public ParkingDTO findByParkingName(String parkingName);
	public ParkingDTO findById(long id);
	public ParkingDTO findTopByOrderByIdDesc();
}
