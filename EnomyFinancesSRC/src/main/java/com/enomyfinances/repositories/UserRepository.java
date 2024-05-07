package com.enomyfinances.repositories;

import com.enomyfinances.models.User;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u WHERE u.userId = :userId")
    Optional<User> findById(@Param("userId") Long userId);

    User findByEmail(String email);

    void deleteById(Long userId);

	boolean existsByEmail(String email);


}