package com.example.papers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class PaperReviewController {
    @Autowired
    private PaperReviewService paperReviewService;

    @PostMapping
    public PaperReview createReview(@RequestBody PaperReview paperReview) {
        return paperReviewService.save(paperReview);
    }

    @GetMapping("/{id}")
    public PaperReview getReviewById(@PathVariable Long id) {
        return paperReviewService.findById(id);
    }

    @GetMapping
    public List<PaperReview> getAllReviews() {
        return paperReviewService.findAll();
    }
}
