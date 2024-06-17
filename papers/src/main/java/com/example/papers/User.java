package com.example.papers;

import lombok.Data;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;
    
    @Column(nullable = false, unique = true)
    private String username;
    
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false)
    private String email;
    
    private String firstName;
    private String lastName;
    
    @Enumerated(EnumType.STRING)
    private Role role;
    
    @Enumerated(EnumType.STRING)
    private Status status;
    
    private LocalDateTime createdAt;
    
    @OneToMany(mappedBy = "submitter")
    private Set<Paper> submittedPapers;

    @ManyToMany(mappedBy = "authors")
    private Set<Paper> authoredPapers;
    
    @ManyToMany
    @JoinTable(
        name = "ConferencePCChair",
        joinColumns = @JoinColumn(name = "pcChairId"),
        inverseJoinColumns = @JoinColumn(name = "conferenceId"))
    private Set<Conference> chairedConferences;
    
    @ManyToMany
    @JoinTable(
        name = "ConferencePCMember",
        joinColumns = @JoinColumn(name = "pcMemberId"),
        inverseJoinColumns = @JoinColumn(name = "conferenceId"))
    private Set<Conference> memberConferences;
    



}
