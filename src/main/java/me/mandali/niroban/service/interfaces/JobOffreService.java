package me.mandali.niroban.service.interfaces;

import me.mandali.niroban.model.JobOffer;

import java.util.List;

public interface JobOffreService {

    JobOffer addJobOffer(JobOffer employee);
    JobOffer getJobOfferById(Long id);
    List<JobOffer> getAllJobOffers();
    JobOffer updateJobOffer(JobOffer employee);
    void deleteJobOffer(Long id);
}
