<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="fa" dir="rtl">
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="./resources/css/cartForme.css">
  <title>افزودن کارمند</title>
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
  <c:if test="${not empty sessionScope.successMessage}">
    <div class="flash-message success">${sessionScope.successMessage}</div>
    <c:remove var="successMessage" scope="session"/>
  </c:if>
  <c:if test="${not empty sessionScope.errorMessage}">
    <div class="flash-message error">${sessionScope.errorMessage}</div>
    <c:remove var="errorMessage" scope="session"/>
  </c:if>
  <h1><i class="fas fa-user-plus"></i> افزودن کارمند</h1>
  <form action="employee?action=add" method="post">
    <label for="name">نام و نام خانوادگی:</label>
    <input type="text" id="name" name="name" required>
    <label for="email">ایمیل:</label>
    <input type="email" id="email" name="email" required>
    <label for="password">رمز عبور:</label>
    <input type="password" id="password" name="password" required>
    <label for="birthDate">تاریخ تولد:</label>
    <input type="date" id="birthDate" name="birthDate" required>
    <label for="department">بخش:</label>
    <input type="text" id="department" name="department" required>
    <label for="position">موقعیت:</label>
    <input type="text" id="position" name="position" required>
    <label for="address">آدرس:</label>
    <input type="text" id="address" name="address" required>
    <label for="phoneNumber">شماره تلفن:</label>
    <input type="tel" id="phoneNumber" name="phoneNumber" required>
    <label for="salary">حقوق:</label>
    <input type="number" id="salary" name="salary" required>
    <label for="soldConge">مرخصی موجود:</label>
    <input type="text" id="soldConge" name="soldConge" required>
    <label for="socialSecurityNumber">شماره بیمه :</label>
    <input type="text" id="socialSecurityNumber" name="socialSecurityNumber" required>
    <input type="submit" class="add" value="افزودن کارمند">
  </form>
  <a href="employee?action=list">بازگشت به لیست</a>
</div>
</body>
</html>