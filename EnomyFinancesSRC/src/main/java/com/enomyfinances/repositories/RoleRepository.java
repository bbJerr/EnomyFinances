package com.enomyfinances.repositories;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.enomyfinances.models.Role;

@Repository
public interface RoleRepository extends JpaRepository <Role, Long>{
	
	@Query("SELECT r FROM Role r WHERE r.roleName IN :roles")
	Set<Role> findBySpecificRoles(@Param("roles") String role);
	
	Role findByRoleName(String roleName);
	
}
