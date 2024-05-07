package com.enomyfinances.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enomyfinances.models.User;
import com.enomyfinances.repositories.UserRepository;
import com.enomyfinances.repositories.RoleRepository;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }
    public boolean isValidPhoneNumber(int phoneNumber) {        
    	return phoneNumber > 0;
    }

    public User saveUser(User user) {    	
    	
    	String encodedPassword = passwordEncoder.encode(user.getPassword());
        
    	user.setPassword(encodedPassword);
        
    	System.out.println("---------------------------------------" + roleRepository.findAll());
    	
    	System.out.println("Before Set user role" + roleRepository.findBySpecificRoles("Client"));
    	
    	user.setRoles (new HashSet<>(roleRepository.findBySpecificRoles("Client")));
    	
    	System.out.println("Set user role done");
    	
    	return userRepository.save(user);
    
    }    
    
    public List<User> listAll() {
		return (List<User>) userRepository.findAll();
	}

	public User get(Long userId) {
		return userRepository.findById(userId).get();
	}
    
    public void delete(Long userId) {
		userRepository.deleteById(userId);
	}

}