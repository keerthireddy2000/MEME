package com.mallmgt.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.JobDTO;

public interface JobDAO extends JpaRepository<JobDTO, Long> {

	public JobDTO findById(long id);
	public JobDTO findByJobName(String name);
}
