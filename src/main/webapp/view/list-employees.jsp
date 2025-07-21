<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="fa" dir="rtl">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./resources/css/style.css">
    <title>لیست کارکنان</title>
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
<c:if test="${not empty sessionScope.successMessage}">
    <div class="flash-message success">${sessionScope.successMessage}</div>
    <c:remove var="successMessage" scope="session"/>
</c:if>
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="flash-message error">${sessionScope.errorMessage}</div>
    <c:remove var="errorMessage" scope="session"/>
</c:if>
<div class="container">
    <h1><i class="fas fa-users"></i> لیست کارکنان</h1>
    <div class="add-new-btn">
        <a href="employee?action=add" class="action-btn add-btn"><i class="fas fa-plus-circle"></i> افزودن کارمند جدید</a>
    </div>
    <table class="styled-table">
        <thead>
        <tr>
            <th>شناسه</th>
            <th>نام</th>
            <th>ایمیل</th>
            <th>بخش</th>
            <th>موقعیت</th>
            <th>عملیات</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.name}</td>
                <td>${employee.email}</td>
                <td>${employee.department}</td>
                <td>${employee.position}</td>
                <td>
                    <a href="employee?action=edit&id=${employee.id}" class="action-btn edit-btn"><i class="fas fa-edit"></i> ویرایش</a>
                    <a href="employee?action=delete&id=${employee.id}" class="action-btn delete-btn" onclick="return confirm('آیا مطمئن هستید که می‌خواهید این پیشنهاد شغلی را حذف کنید؟');"><i class="fas fa-trash-alt"></i> حذف</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>