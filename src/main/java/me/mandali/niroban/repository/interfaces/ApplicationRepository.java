package me.mandali.niroban.repository.interfaces;



import me.mandali.niroban.model.Application;

import java.util.List;

public interface ApplicationRepository {
    Application save(Application application);
    Application findById(Long id);
    List<Application> findAll();
    public List<String> findAllSkills();
    List<Application> findDistinctByCompetencies(String competency);
}
