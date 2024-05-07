package com.enomyfinances.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.enomyfinances.models.User;
import com.enomyfinances.repositories.UserRepository;

@Controller
public class ResetPasswordController {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @GetMapping("/resetpassword")
    public String viewResetPasswordPage() {
		return "resetpassword";
	}
    
    @PostMapping("/resetpasswordform")
    public String resetPassword(HttpServletRequest request, Model model) {

        String email = request.getParameter("email");
        String password = request.getParameter("newPassword");
        String passwordConfirmation = request.getParameter("newPasswordConfirmation");
        String encodedPassword = passwordEncoder.encode(password);

        if (!password.equals(passwordConfirmation)) {
            model.addAttribute("passwordMismatchError", "Passwords do not match.");
            return "resetpassword";
        }
        
        

        // Validate email and reset password logic
        User user = userRepository.findByEmail(email);
        if (user != null) {
            // Email found, update password
        	user.setPassword(encodedPassword);
        	userRepository.save(user);
            return "login";
        } else {
            // Email not found
        	model.addAttribute("error", "Email does not exist.");
            return "resetpassword";
        }
    }
}
