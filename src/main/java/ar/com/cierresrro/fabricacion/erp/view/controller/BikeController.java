package ar.com.cierresrro.fabricacion.erp.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ar.com.cierresrro.fabricacion.erp.core.domain.Bike;
import ar.com.cierresrro.fabricacion.erp.core.service.BikeService;
 

 
@RestController
public class BikeController {
 
	@Autowired
	private BikeService bikeService;
 
	@RequestMapping(value = "/bike/", method = RequestMethod.GET)
	public List<Bike> getAllBikes() {
 
		return bikeService.getAllBikes();
	}
 
	@RequestMapping(value = "/bike/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public Bike getBike(@PathVariable("bikeId") Integer bikeId) {
		return bikeService.getBike(bikeId);
	}
 
	@PostMapping("/bike/")
	public Bike createBike(@RequestBody Bike bike) {
		return bikeService.createBike(bike);
	}
 
	 @RequestMapping(value = "/bike/{id}", method = RequestMethod.PUT)
	public Bike updateBike(@RequestBody Bike bike) {
		return bikeService.updateBike(bike);
	}
	
	 @PostMapping("/bike/delete/")
		public void deleteBike(@RequestBody Integer bikeId) {
		 bikeService.deleteBike(bikeId);
	 }
	 
/*	 @DeleteMapping("/bike/{id}")
	public void deleteBike(@PathVariable("bikeId") Integer bikeId) {
		bikeService.deleteBike(bikeId);
	}*/
 
 
}