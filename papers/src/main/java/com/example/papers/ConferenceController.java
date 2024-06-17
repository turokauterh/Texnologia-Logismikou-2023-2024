package com.example.papers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@RestController
@RequestMapping("/api/conferences")
public class ConferenceController {
    @Autowired
    private ConferenceService conferenceService;

    @PostMapping
    public Conference createConference(@RequestBody Conference conference) {
        return conferenceService.save(conference);
    }

    @GetMapping("/{id}")
    public Conference getConferenceById(@PathVariable Long id) {
        return conferenceService.findById(id);
    }

    @GetMapping
    public List<Conference> getAllConferences() {
        return conferenceService.findAll();
    }
}

