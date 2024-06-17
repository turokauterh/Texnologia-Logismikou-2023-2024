package com.example.papers;

import lombok.Data;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
public class UserToken {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tokenId;
    
    private String token;
    
    private LocalDateTime createdAt;
    private LocalDateTime expiresAt;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
