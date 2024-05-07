package com.enomyfinances.models;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Role {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		
		@Column (name="role_id")
		private Long roleId;
		
		@Column (name="role_name")
		private String roleName;
		
		@Column (name="role_description")
		private String roleDescription;
		
		@ManyToMany (mappedBy = "roles")
		private Set<User> users = new HashSet<>();
		
		public Role () {
				
		}

		public Long getRoleId() {
			return roleId;
		}

		public void setRoleId(Long roleId) {
			this.roleId = roleId;
		}

		public String getRoleName() {
			return roleName;
		}

		public void setRoleName(String roleName) {
			this.roleName = roleName;
		}

		public String getRoleDescription() {
			return roleDescription;
		}

		public void setRoleDescription(String roleDescription) {
			this.roleDescription = roleDescription;
		}

		public Set<User> getUsers() {
			return users;
		}

		public void setUsers(Set<User> users) {
			this.users = users;
		}
		
		@Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (o == null || getClass() != o.getClass()) return false;
	        Role role = (Role) o;
	        return roleName.equals(role.roleName);
	    }
	    @Override
	    public int hashCode() {
	        return Objects.hash(roleName);
	    }
}
