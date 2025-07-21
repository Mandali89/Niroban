package me.mandali.niroban.service;

import me.mandali.niroban.exception.InvalidInputException;
import me.mandali.niroban.model.JobOffer;
import me.mandali.niroban.repository.interfaces.JobOffreRepository;
import me.mandali.niroban.service.interfaces.JobOffreService;
import java.util.List;

public class JobOffreServiceImpl implements JobOffreService {
    private JobOffreRepository jobOffreRepository;

    public JobOffreServiceImpl(JobOffreRepository jobOffreRepository) {
        this.jobOffreRepository = jobOffreRepository;
    }


    @Override
    public JobOffer addJobOffer(JobOffer jobOffer) {
        validateJobOffer(jobOffer);
        return jobOffreRepository.save(jobOffer);
    }

    @Override
    public JobOffer getJobOfferById(Long id) {
        JobOffer jobOffer = jobOffreRepository.findById(id);
        if (jobOffer == null) {
            throw new InvalidInputException("JobOffer with ID " + id + " not found");
        }
        return jobOffer;
    }

    @Override
    public List<JobOffer> getAllJobOffers() {
        return jobOffreRepository.findAll();
    }

    @Override
    public void deleteJobOffer(Long id) {
        JobOffer jobOffer = getJobOfferById(id);
        jobOffreRepository.delete(jobOffer.getId());
    }

    @Override
    public JobOffer updateJobOffer(JobOffer jobOffer) {
        JobOffer existingJobOffer = getJobOfferById(jobOffer.getId());
        if (existingJobOffer == null) {
            throw new InvalidInputException("Cannot update. JobOffer with ID " + jobOffer.getId() + " not found");
        }

        existingJobOffer.setTitle(jobOffer.getTitle());
        existingJobOffer.setDescription(jobOffer.getDescription());
        existingJobOffer.setStatus(jobOffer.isStatus());
        return jobOffreRepository.update(existingJobOffer);
    }

    /**
     * Validate the JobOffer before saving or updating.
     */
    private void validateJobOffer(JobOffer jobOffer) {
        if (jobOffer == null) {
            throw new InvalidInputException("JobOffer cannot be null");
        }

        if (jobOffer.getTitle() == null || jobOffer.getTitle().isEmpty()) {
            throw new InvalidInputException("JobOffer title cannot be empty");
        }

        if (jobOffer.getDescription() == null || jobOffer.getDescription().isEmpty()) {
            throw new InvalidInputException("JobOffer description cannot be empty");
        }

        if (jobOffer.getPostDate() == null) {
            throw new InvalidInputException("JobOffer post date cannot be null");
        }

    }
}