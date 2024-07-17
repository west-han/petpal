package com.shop.petpal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.petpal.service.ProductListService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ProductListService productListService;
	
	@RequestMapping(value = {"/", "/{species}"}, method = RequestMethod.GET)
	public String home(@PathVariable(required = false) Integer species, Model model) {
		
		if (species == null) {
			species = 1;
		}
		
		List<Map<String, Object>> categories = productListService.listCategory(species);
		
		model.addAttribute("categories", categories);
		model.addAttribute("species", species);
		
		return ".home";
	}
	
	
}
