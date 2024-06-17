package com.example.papers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConferenceService {
    @Autowired
    private ConferenceRepository conferenceRepository;

    public Conference save(Conference conference) {
        return conferenceRepository.save(conference);
    }

    public Conference findById(Long conferenceId) {
        return conferenceRepository.findById(conferenceId).orElse(null);
    }

    public List<Conference> findAll() {
        return conferenceRepository.findAll();
    }
}
