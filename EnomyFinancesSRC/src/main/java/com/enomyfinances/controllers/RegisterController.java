package com.enomyfinances.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.enomyfinances.models.User;
import com.enomyfinances.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;
    
    @GetMapping("/")
	public String viewIndexPage() {
		return "index";
	}
    
    @GetMapping("/register")
    public String viewRegisterPage() {
		return "register";
	}
    
    @GetMapping("/thankyou")
	public String viewThankyouPage() {
		return "thankyou";
	}
    
    @GetMapping("/about")
	public String viewAboutUsPage() {
		return "about";
	}
    
    @GetMapping("/login")
	public String showLoginPage(@RequestParam(name = "error", required = false) String error, Model model) {	 
		if (error != null) {
            model.addAttribute("loginError", "Invalid email or password. Please try again.");
        }
		return "login";
	}

	@GetMapping("/welcome")
    public String showWelcomePage() {
        return "welcome"; 
    }

    @PostMapping("/registerform")
    public String registerUser(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("phoneNumber") int phoneNumber,
            Model model, HttpServletRequest request) {

        // Check if email already exists
        if (userService.emailExists(email)) {
            model.addAttribute("emailExistsError", "Email already exists.");
            return "register";
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);

        userService.saveUser(user);

        HttpSession session = request.getSession();
        session.setAttribute("email", email);

        return "redirect:/thankyou";
    }

    
}
