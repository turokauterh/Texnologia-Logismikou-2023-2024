package com.example.papers;
import org.springframework.data.jpa.repository.JpaRepository;
public interface PaperRepository extends JpaRepository<Paper, Long> {
}
