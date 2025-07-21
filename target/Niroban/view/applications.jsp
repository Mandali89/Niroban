<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/application.css">
    <title>درخواست‌های شغلی</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Vazirmatn', sans-serif;
            text-align: right;
        }
        .image-container img {
            width: 100%;
            max-width: 400px;
            border-radius: 10px;
            display: block;
        }
    </style>
</head>
<body>
<h1>🌟 درخواست‌های شغلی 🌟</h1>
<div class="welcome-message">
    به فرصت شغلی خود خوش آمدید! مشتاقیم در جستجوی شغل به شما کمک کنیم.
</div>
<div class="image-container">
    <img src="https://emeritus.org/in/wp-content/uploads/sites/3/2022/10/9-Things-to-Keep-in-Mind-When-Applying-for-Job.jpg.optimal.jpg" alt="تصویر درخواست شغلی">
</div>
<c:if test="${not empty message}">
    <div class="flash-message success-message" style="display: block;">${message}</div>
</c:if>
<c:if test="${not empty errorMessage}">
    <div class="flash-message error-message" style="display: block;">${errorMessage}</div>
</c:if>
<c:if test="${not empty successMessage}">
    <div class="flash-message success-message" style="display: block;">${successMessage}</div>
</c:if>
<div class="job-container">
    <c:forEach var="jobOffer" items="${jobOffers}">
        <div class="job-card">
            <div class="job-title">${jobOffer.title}</div>
            <div class="job-description">${jobOffer.description}</div>
            <a href="javascript:void(0);" class="apply-btn" onclick="openApplyModal(${jobOffer.id})">
                <i class="fas fa-paper-plane"></i> درخواست
            </a>
        </div>
    </c:forEach>
</div>
<div id="applyModal" style="display:none;">
    <div class="modal-content">
        <div class="modal-form">
            <span class="close" onclick="closeApplyModal()">×</span>
            <h2>درخواست برای شغل</h2>
            <form action="application" method="post" enctype="multipart/form-data">
                <label for="name">نام:</label>
                <input type="text" id="name" name="name" required><br><br>
                <label for="email">ایمیل:</label>
                <input type="email" id="email" name="email" required><br><br>
                <label for="password">رمز عبور:</label>
                <input type="password" id="password" name="password" required><br><br>
                <label for="birthDate">تاریخ تولد:</label>
                <input type="date" id="birthDate" name="birthDate" required><br><br>
                <label for="skills">مهارت‌ها:</label>
                <input type="text" id="skills" name="skills" required><br><br>
                <label for="document">بارگذاری سند:</label>
                <input type="file" id="document" name="document" required><br><br>
                <input type="hidden" id="jobOfferId" name="jobOfferId" value="">
                <input type="submit" value="ارسال" class="apply-btn">
            </form>
        </div>
    </div>
</div>
<script>
    function openApplyModal(jobOfferId) {
        document.getElementById('jobOfferId').value = jobOfferId;
        document.getElementById('applyModal').style.display = "block";
    }
    function closeApplyModal() {
        document.getElementById('applyModal').style.display = "none";
    }
    window.onload = function() {
        const flashMessages = document.querySelectorAll('.flash-message');
        flashMessages.forEach(msg => {
            if (msg.style.display === 'block') {
                setTimeout(() => {
                    msg.style.opacity = '0';
                    setTimeout(() => msg.style.display = 'none', 500);
                }, 3000);
            }
        });
    };
</script>
</body>
</html>