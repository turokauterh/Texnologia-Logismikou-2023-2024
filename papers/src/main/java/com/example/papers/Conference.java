package com.example.papers;
import lombok.Data;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
public class Conference {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long conferenceId;
    
    @Column(nullable = false, unique = true)
    private String name;
    
    private String description;
    
    @Enumerated(EnumType.STRING)
    private Status status;
    
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    @OneToMany(mappedBy = "conference")
    private Set<Paper> papers;
    
    @ManyToMany
    @JoinTable(
        name = "ConferencePCChair",
        joinColumns = @JoinColumn(name = "conferenceId"),
        inverseJoinColumns = @JoinColumn(name = "pcChairId"))
    private Set<User> pcChairs;
    
    @ManyToMany
    @JoinTable(
        name = "ConferencePCMember",
        joinColumns = @JoinColumn(name = "conferenceId"),
        inverseJoinColumns = @JoinColumn(name = "pcMemberId"))
    private Set<User> pcMembers;
    

	public enum Status {
	    ACTIVE, INACTIVE, CREATED, SUBMISSION, ASSIGNMENT, REVIEW, DECISION, FINAL_SUBMISSION, FINAL, SUBMITTED, UNDER_REVIEW, APPROVED, REJECTED, FINAL_SUBMITTED, ACCEPTED
	}

}
