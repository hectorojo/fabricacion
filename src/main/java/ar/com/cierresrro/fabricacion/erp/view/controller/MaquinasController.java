package ar.com.cierresrro.fabricacion.erp.view.controller;

import java.util.List;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/maquinas")
public class MaquinasController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(final ModelMap model) {
    	Validate.notNull(model);

		
		return "maquinas";
	}
	
}
