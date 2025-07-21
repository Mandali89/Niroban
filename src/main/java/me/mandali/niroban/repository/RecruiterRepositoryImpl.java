package me.mandali.niroban.repository;


import jakarta.persistence.EntityManager;
import me.mandali.niroban.model.Recruiter;
import me.mandali.niroban.repository.interfaces.RecruiterRepository;
import me.mandali.niroban.utils.JpaUtil;

public class RecruiterRepositoryImpl implements RecruiterRepository {

    @Override
    public Recruiter findById(Long id) {
        EntityManager entityManager = null;
        try {
            entityManager = JpaUtil.getInstance().getEntityManagerFactory().createEntityManager();
            entityManager.getTransaction().begin();
            Recruiter recruiter = entityManager.find(Recruiter.class, id);
            entityManager.getTransaction().commit();
            return recruiter;
        } finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }}