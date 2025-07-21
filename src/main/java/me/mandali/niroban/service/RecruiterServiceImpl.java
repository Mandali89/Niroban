package me.mandali.niroban.service;

import me.mandali.niroban.model.Recruiter;
import me.mandali.niroban.repository.RecruiterRepositoryImpl;
import me.mandali.niroban.repository.interfaces.RecruiterRepository;
import me.mandali.niroban.service.interfaces.RecruiterService;

public class RecruiterServiceImpl implements RecruiterService {
    private RecruiterRepository recruiterRepository;

    public RecruiterServiceImpl(RecruiterRepository recruiterRepository) {
        this.recruiterRepository = new RecruiterRepositoryImpl();
    }

    @Override
    public Recruiter findById(Long id) {
        return recruiterRepository.findById(id);
    }

}