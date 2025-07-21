package me.mandali.niroban.repository.interfaces;

import me.mandali.niroban.model.JobOffer;

import java.util.List;

public interface JobOffreRepository {

    JobOffer save(JobOffer jobOffer);
    List<JobOffer> findAll();
    JobOffer findById(Long id);
    void delete(Long id);
    JobOffer update(JobOffer jobOffer);

}
