package com.enomyfinances.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.enomyfinances.auth.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		System.out.println("Configure Authentication");
		auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		System.out.println("Configure HttpSecurity");
 		
    	http        		
            .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/welcome", true)
                .permitAll()              
            
            .and()
            .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/css/**", "/images/**", "/js/**").permitAll()
                .antMatchers("/login", "/register", "/about").permitAll()
                .antMatchers(HttpMethod.POST, "/registerform", "/resetpasswordform").permitAll()
                .antMatchers("/welcome", "/currency", "/investment","/converter","/dashboard").hasAnyRole("Client","Admin")
                .antMatchers(HttpMethod.POST, "/converter", "/calculateInvestment").hasAnyRole("Client","Admin")
//                .antMatchers(HttpMethod.POST, "/new").hasAnyRole("Client","Admin")
                .antMatchers(HttpMethod.POST,"/users", "/delete", "/edit").hasRole("Admin")
            .and()
            .logout()
            	.logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("SESSIONID")
                .permitAll();
	    		
	}
	
}
