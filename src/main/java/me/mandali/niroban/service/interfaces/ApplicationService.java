package me.mandali.niroban.service.interfaces;

import me.mandali.niroban.model.Application;

import java.util.List;

public interface ApplicationService {
    Application save(Application application);
    Application findById(Long id);
    List<Application> findAll();
    public List<String> findAllSkills();
    List<Application> findDistinctByCompetencies(String competency);
}
