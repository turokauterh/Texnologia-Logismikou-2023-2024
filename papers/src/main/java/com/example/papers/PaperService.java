
package com.example.papers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaperService {
    @Autowired
    private PaperRepository paperRepository;

    public Paper save(Paper paper) {
        return paperRepository.save(paper);
    }

    public Paper findById(Long paperId) {
        return paperRepository.findById(paperId).orElse(null);
    }

    public List<Paper> findAll() {
        return paperRepository.findAll();
    }
}
