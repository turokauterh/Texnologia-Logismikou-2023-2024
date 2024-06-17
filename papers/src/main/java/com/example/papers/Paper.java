package com.example.papers;


import lombok.Data;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;


@Entity
@Data
public class Paper {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paperId;
    
    @Column(nullable = false)
    private String title;
    
    private String abstractText;
    private String keywords;
    private String content;
    
    @Enumerated(EnumType.STRING)
    private Status status;
    
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    @ManyToOne
    @JoinColumn(name = "submitter_id")
    private User submitter;
    
    @ManyToOne
    @JoinColumn(name = "conference_id")
    private Conference conference;
    
    @ManyToMany
    @JoinTable(
        name = "PaperAuthor",
        joinColumns = @JoinColumn(name = "paperId"),
        inverseJoinColumns = @JoinColumn(name = "authorId"))
    private Set<User> authors;

    @OneToMany(mappedBy = "paper")
    private Set<PaperReview> reviews;
}
