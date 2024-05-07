package com.enomyfinances.controllers;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.enomyfinances.models.Investment;
import com.enomyfinances.models.User;
import com.enomyfinances.repositories.InvestmentRepository;
import com.enomyfinances.repositories.UserRepository;
import com.enomyfinances.service.UserService;

@Controller
public class DashboardController {
	
	private final UserRepository userRepository;
	private final InvestmentRepository investmentRepository;
	private final UserService userService;
	
	public DashboardController(UserRepository userRepository, InvestmentRepository investmentRepository, UserService userService) {
		this.userRepository = userRepository;
		this.investmentRepository = investmentRepository;
		this.userService = userService;
	}	
	@GetMapping("/dashboard")
	public String viewDashboardPage(Model model, Authentication authentication) {
		
		String email = authentication.getName();
		
		User user = userRepository.findByEmail(email);
		model.addAttribute("name", user.getName());
				
		List<Investment> userInvestments = investmentRepository.findByUserId(user.getUserId());
	    model.addAttribute("userInvestments", userInvestments);	
	    
	    List<User> users = userService.listAll();
	    model.addAttribute("user", users);
		 
		return "dashboard";
	}
		
	@RequestMapping("/delete")
	 public String deleteUsers(@RequestParam Long userId)
	 { userRepository.deleteById(userId);
	 return "redirect:/dashboard";
	 }
		
}