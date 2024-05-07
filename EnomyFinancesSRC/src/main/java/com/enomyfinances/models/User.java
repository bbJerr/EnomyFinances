package com.enomyfinances.models;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long userId;
	
	@Column(name = "user_name")
	private String name; 
	
	@Column(name = "user_email")
	private String email;

	@Column(name = "user_password")
	private String password;
	
	@Column(name = "user_number")
	private int phoneNumber;
		
	@ManyToMany
	@JoinTable( name = "user_role",
				joinColumns = @JoinColumn(name = "user_id"),
				inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<>();
	
	
	
	public User() {
		
	}
	
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public User(String email, String password, Set<Role> roles) {
		super();
		this.email = email;
		this.password = password;
		this.roles = roles;
	}

	public User(Long userId, String name, String email, int phoneNumber, String password) {
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
	}
	
	public User(Long userId, String name, String email, int phoneNumber, String password,
			Set<Role> roles) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.roles = roles;
	}

	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	// Equals method to compare objects based on email and password
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User User = (User) o;
        return email.equals(User.email) && password.equals(User.password);
    }

    // HashCode method to generate a hash code based on email and password
    @Override
    public int hashCode() {
        return Objects.hash(email, password);
    }

	public String getUserName() {
		// TODO Auto-generated method stub
		return email;
	}
}