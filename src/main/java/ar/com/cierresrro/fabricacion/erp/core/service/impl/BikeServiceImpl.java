package ar.com.cierresrro.fabricacion.erp.core.service.impl;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.com.cierresrro.fabricacion.erp.core.domain.Bike;
import ar.com.cierresrro.fabricacion.erp.core.domain.dao.BikeRepository;
import ar.com.cierresrro.fabricacion.erp.core.service.BikeService;
 

@Service
public class BikeServiceImpl implements BikeService {
 
	@Autowired
	private BikeRepository bikeRepository;
 
	public List<Bike> getAllBikes() {
		List<Bike> bikes = new ArrayList<Bike>();
		Iterator<Bike> iterator = bikeRepository.findAll().iterator();
		while (iterator.hasNext()) {
			bikes.add(iterator.next());
		}
 
		return bikes;
	}
 
	public Bike getBike(Integer bikeId) {
		return bikeRepository.findById(bikeId).get();
	}
 
	public Bike createBike(Bike bike) {
		return bikeRepository.save(bike);
	}
 
	public Bike updateBike(Bike bike) {
		return bikeRepository.save(bike);
	}
 
	public void deleteBike(Integer bikeId) {
		bikeRepository.deleteById(bikeId);
	}
 
}