<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>لیست داوطلبان</title>
    <link rel="stylesheet" href="./resources/css/condidat.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Vazirmatn', sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            margin: 0;
            padding: 20px;
            text-align: right;
        }
        h1 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
        }
        .flash-message {
            padding: 10px;
            margin: 15px 0;
            border-radius: 5px;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
        }
        .success {
            background-color: #4CAF50;
        }
        .error {
            background-color: #f44336;
        }
        .filter-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            background-color: #1f1f1f;
            padding: 10px;
            border-radius: 5px;
        }
        .filter-select {
            padding: 8px;
            border-radius: 3px;
            margin-right: 80px;
            border: 1px solid #ddd;
            background-color: #2a2a2a;
            color: #e0e0e0;
            transition: background-color 0.3s;
        }
        .filter-select:hover {
            background-color: #3a3a3a;
        }
        .filter-button {
            padding: 8px 12px;
            background-color: #1976D2;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .filter-button:hover {
            background-color: #125a9b;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 5px;
            overflow: hidden;
        }
        thead {
            background-color: #1f1f1f;
        }
        th, td {
            padding: 15px;
            text-align: right;
            border-bottom: 1px solid #333;
        }
        th {
            color: #ffffff;
            background-color: #0e0e0e;
            font-weight: bold;
        }
        tr {
            transition: background-color 0.3s;
        }
        tr:nth-child(even) {
            background-color: #242424;
        }
        tr:hover {
            background-color: #333;
        }
        button {
            padding: 5px 10px;
            margin: 0 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: opacity 0.3s;
        }
        .accept-button {
            background-color: #4CAF50;
            color: white;
        }
        .accept-button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<h1>لیست داوطلبان</h1>
<c:if test="${not empty sessionScope.flashMessage}">
    <div class="flash-message ${sessionScope.flashMessage.contains('acceptée') ? 'success' : 'error'}">
            ${sessionScope.flashMessage}
    </div>
    <c:remove var="flashMessage" scope="session" />
</c:if>
<form action="candidate" method="post" class="filter-container">
    <div>
        <label for="statusFilter">فیلتر بر اساس وضعیت:</label>
        <select id="statusFilter" class="filter-select" name="status">
            <option value="">همه</option>
            <option value="true">پذیرفته‌شده</option>
            <option value="false">ردشده</option>
        </select>
        <label for="skillsFilter">فیلتر بر اساس مهارت‌ها:</label>
        <select id="skillsFilter" class="filter-select" name="skills">
            <option value="">انتخاب مهارت</option>
            <c:forEach var="skill" items="${application.skills}">
                <option value="${skill}">${skill}</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="filter-button">فیلتر</button>
</form>
<table>
    <thead>
    <tr>
        <th>نام</th>
        <th>ایمیل</th>
        <th>پیشنهادات شغلی</th>
        <th>عملیات</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="application" items="${applications}">
        <tr>
            <td>${application.name}</td>
            <td>${application.email}</td>
            <td>
                <c:forEach var="jobOffer" items="${application.jobOffers}">
                    <div>
                            ${jobOffer.jobOffer.title} - ${jobOffer.isStatus() ? 'فعال' : 'غیرفعال'}
                    </div>
                </c:forEach>
            </td>
            <td>
                <c:forEach var="jobOffer" items="${application.jobOffers}">
                    <form action="candidate" method="post" style="display:inline;">
                        <input type="hidden" name="jobOfferId" value="${jobOffer.jobOffer.id}">
                        <input type="hidden" name="applicationId" value="${application.id}">
                        <button type="submit" class="accept-button" name="action" value="accept">
                            <span>✔️</span> پذیرش
                        </button>
                    </form>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>