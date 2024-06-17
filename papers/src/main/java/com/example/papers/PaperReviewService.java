package com.example.papers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PaperReviewService {
    @Autowired
    private PaperReviewRepository paperReviewRepository;

    public PaperReview save(PaperReview paperReview) {
        return paperReviewRepository.save(paperReview);
    }

    public PaperReview findById(Long reviewId) {
        return paperReviewRepository.findById(reviewId).orElse(null);
    }

    public List<PaperReview> findAll() {
        return paperReviewRepository.findAll();
    }
}
