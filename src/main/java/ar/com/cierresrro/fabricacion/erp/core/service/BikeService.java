package ar.com.cierresrro.fabricacion.erp.core.service;

import java.util.List;

import ar.com.cierresrro.fabricacion.erp.core.domain.Bike;
 
public interface BikeService {
 
	List<Bike> getAllBikes();
	
	Bike getBike(Integer bikeId);
	
	Bike createBike(Bike bike);
	
	Bike updateBike(Bike bike);
 
	void deleteBike(Integer bikeId);
 
}