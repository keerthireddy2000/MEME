package com.mallmgt.dao;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.UserDTO;

public interface UserDAO extends JpaRepository<UserDTO, Long> {
	
	public UserDTO findByEmailAndPassword(String email, String password);
	public UserDTO findByEmail(String email);
	public UserDTO findById(long id);
	public List<UserDTO> findByFoodStallId(String stallId);

}
