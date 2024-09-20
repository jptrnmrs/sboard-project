package com.sboard.repository;

import com.sboard.entity.Terms;
import com.sboard.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TermsRepository extends JpaRepository<Terms, Integer> {
}
