package com.enomyfinances.repositories;

import com.enomyfinances.models.Investment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface InvestmentRepository extends JpaRepository<Investment, Long> {
    List<Investment> findByUserId(Long userId);
}