package com.example.papers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserTokenService {
    @Autowired
    private UserTokenRepository userTokenRepository;

    public UserToken save(UserToken userToken) {
        return userTokenRepository.save(userToken);
    }

    public UserToken findByToken(String token) {
        return userTokenRepository.findByToken(token);
    }

    public List<UserToken> findAll() {
        return userTokenRepository.findAll();
    }
}
