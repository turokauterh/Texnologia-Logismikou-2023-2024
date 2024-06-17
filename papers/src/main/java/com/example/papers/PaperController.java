package com.example.papers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/papers")
public class PaperController {
    @Autowired
    private PaperService paperService;

    @PostMapping
    public Paper createPaper(@RequestBody Paper paper) {
        return paperService.save(paper);
    }

    @GetMapping("/{id}")
    public Paper getPaperById(@PathVariable Long id) {
        return paperService.findById(id);
    }

    @GetMapping
    public List<Paper> getAllPapers() {
        return paperService.findAll();
    }
}
