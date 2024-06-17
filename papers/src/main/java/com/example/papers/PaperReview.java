package com.example.papers;


import lombok.Data;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
public class PaperReview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;
    
    private Integer score;
    private String justification;
    
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    @ManyToOne
    @JoinColumn(name = "paper_id")
    private Paper paper;
    
    @ManyToOne
    @JoinColumn(name = "reviewer_id")
    private User reviewer;
}
