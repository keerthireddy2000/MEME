package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.ApplyJobDTO;

public interface ApplyJobDAO extends JpaRepository<ApplyJobDTO, Long> {

	public ApplyJobDTO findById(long id);
	
	public List<ApplyJobDTO> findByUserId(long id);
}
