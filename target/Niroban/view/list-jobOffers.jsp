<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="fa" dir="rtl">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./resources/css/style2.css">
    <title>مدیریت پیشنهادات شغلی</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Vazirmatn', sans-serif;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-briefcase"></i> مدیریت پیشنهادات شغلی</h2>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <div class="btn-container">
        <a href="joboffre?action=add" class="btn btn-primary"><i class="fas fa-plus-circle"></i> افزودن پیشنهاد شغلی</a>
    </div>
    <div class="job-offers-container">
        <c:if test="${empty jobOffers}">
            <div class="alert alert-warning">هیچ پیشنهاد شغلی یافت نشد.</div>
        </c:if>
        <c:forEach var="jobOffer" items="${jobOffers}">
            <div class="job-offer-card">
                <h3>${jobOffer.title}</h3>
                <p class="posted-date"><strong>تاریخ ارسال:</strong> ${jobOffer.postDate}</p>
                <p>${jobOffer.description}</p>
                <p>
                    <span style="color: ${jobOffer.status == 'Open' ? 'red' : 'green'}; font-weight: bold;">
                            ${jobOffer.status == 'Open' ? 'غیرفعال' : 'فعال'}
                    </span>
                </p>
                <div class="card-actions">
                    <a href="joboffre?action=edit&id=${jobOffer.id}" class="btn btn-secondary"><i class="fas fa-edit"></i> ویرایش</a>
                    <a href="joboffre?action=delete&id=${jobOffer.id}" class="btn btn-danger" onclick="return confirm('آیا مطمئن هستید که می‌خواهید این پیشنهاد شغلی را حذف کنید؟');"><i class="fas fa-trash-alt"></i> حذف</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>