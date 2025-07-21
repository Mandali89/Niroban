package me.mandali.niroban.repository.interfaces;

import me.mandali.niroban.model.ApplicationJobOffer;

import java.util.List;

public interface ApplicationJobOfferRepository {
    void save(ApplicationJobOffer applicationJobOffer);
    List<ApplicationJobOffer> findAll();
    ApplicationJobOffer findById(Long applicationId);
    void delete(Long id);
    List<ApplicationJobOffer> findByStatus(Boolean status);
    void update(ApplicationJobOffer applicationJobOffer);
    void acceptApplication(Long applicationId, Long jobOfferId);
    ApplicationJobOffer findByApplicationIdAndJobOfferId(Long jobOfferId, Long applicationId);
}
