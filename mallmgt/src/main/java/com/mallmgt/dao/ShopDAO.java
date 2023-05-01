package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.ShopDTO;

public interface ShopDAO extends JpaRepository<ShopDTO, Long> {

	public ShopDTO findById(long id);
	public ShopDTO findByShopName(String shopName);
	public List<ShopDTO> findByUserId(long userId);
	public ShopDTO findByShopId(String shopId);
	public void deleteByShopId(String shopId);
}
