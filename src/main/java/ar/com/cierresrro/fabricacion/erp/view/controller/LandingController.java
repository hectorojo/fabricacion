package ar.com.cierresrro.fabricacion.erp.view.controller;

import java.util.List;

import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ar.com.cierresrro.fabricacion.erp.core.domain.Bike;
import ar.com.cierresrro.fabricacion.erp.core.domain.Product;
import ar.com.cierresrro.fabricacion.erp.core.domain.dao.ProductDao;
import ar.com.cierresrro.fabricacion.erp.core.service.BikeService;

import org.springframework.ui.ModelMap;



/**
 * Landing page's controller. 
 * 
 * 
 * @author hectorrrojo@gmail.com
 *
 */
@Controller
@RequestMapping("/landing")
public class LandingController {
	
	
@Autowired
private BikeService bikes;
	 /**
		 * Method called for GET requests. This is used for rendering the page the
		 * first time.
		 * 
		 * @param model model used by the view.
		 * @return name of the view page (the jsp's filename).
		 */
		@RequestMapping(method = RequestMethod.GET)
		public String form(final ModelMap model) {
	    	Validate.notNull(model);
	    	List<Bike> bikes = this.bikes.getAllBikes();
			
			model.addAttribute("bikes", bikes);
			
			//List<Product> products = this.products.getProducts();
			
			//model.addAttribute("products", products);
			
			return "landing";
		}

}
