package com.example.papers;

import org.springframework.data.jpa.repository.JpaRepository;
public interface UserTokenRepository extends JpaRepository<UserToken, Long> {
    UserToken findByToken(String token);
}

