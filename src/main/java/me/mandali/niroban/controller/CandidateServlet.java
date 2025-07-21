package me.mandali.niroban.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.mandali.niroban.model.Application;
import me.mandali.niroban.model.ApplicationJobOffer;
import me.mandali.niroban.repository.ApplicationRepositoryImpl;
import me.mandali.niroban.service.ApplicationJobOfferServiceImpl;
import me.mandali.niroban.service.ApplicationServiceImpl;
import me.mandali.niroban.service.interfaces.ApplicationJobOfferService;
import me.mandali.niroban.service.interfaces.ApplicationService;

import java.io.IOException;
import java.util.List;

@WebServlet("/candidate")
public class CandidateServlet extends HttpServlet {

    private ApplicationService applicationService;
    private ApplicationJobOfferService applicationJobOfferService;

    @Override
    public void init() {
        applicationService = new ApplicationServiceImpl(new ApplicationRepositoryImpl());
        applicationJobOfferService = new ApplicationJobOfferServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            List<Application> applications = applicationService.findAll();
            request.setAttribute("applications", applications);
            List<String> skills = applicationService.findAllSkills();
            request.setAttribute("skills", skills);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("flashMessage", "Error retrieving applications.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/candidate.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String statusParam = request.getParameter("status");
        String skillsParam = request.getParameter("skills");

        Boolean status = null;
        if ("true".equals(statusParam)) {
            status = true;
        } else if ("false".equals(statusParam)) {
            status = false;
        }

        List<ApplicationJobOffer> filteredApplications = applicationJobOfferService.findByStatus(status);
        request.setAttribute("applications", filteredApplications);


        List<String> skills = applicationService.findAllSkills();
        request.setAttribute("skills", skills);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/candidate.jsp");
        dispatcher.forward(request, response);

        String applicationIdStr = request.getParameter("applicationId");
        String jobOfferIdStr = request.getParameter("jobOfferId");

        if (applicationIdStr == null || applicationIdStr.isEmpty() || jobOfferIdStr == null || jobOfferIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Application or job offer IDs cannot be empty.");
            return;
        }

        Long applicationId = Long.parseLong(applicationIdStr);
        Long jobOfferId = Long.parseLong(jobOfferIdStr);

        String message;

        try {
            applicationJobOfferService.acceptApplication(applicationId, jobOfferId);

            boolean newStatus = applicationJobOfferService.findByJobOfferIdAndApplicationId(applicationId, jobOfferId).isStatus();
            message = newStatus ? "Application successfully accepted." : "Application successfully rejected.";

            request.getSession().setAttribute("flashMessage", message);
            response.sendRedirect(request.getHeader("referer"));
        } catch (RuntimeException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }
}