<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="fa" dir="rtl">
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="./resources/css/cartForme.css">
  <title>ویرایش کارمند</title>
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
  <h1><i class="fas fa-user-edit"></i> ویرایش کارمند</h1>
  <form action="employee?action=edit&id=${employee.id}" method="post">
    <label for="name">نام و نام خانوادگی:</label>
    <input type="text" id="name" name="name" value="${employee.name}" required>
    <label for="email">ایمیل:</label>
    <input type="email" id="email" name="email" value="${employee.email}" required>
    <label for="password">رمز عبور:</label>
    <input type="password" id="password" name="password">
    <label for="birthDate">تاریخ تولد:</label>
    <input type="date" id="birthDate" name="birthDate" value="${employee.birthDate}" required>
    <label for="department">بخش:</label>
    <input type="text" id="department" name="department" value="${employee.department}" required>
    <label for="position">موقعیت:</label>
    <input type="text" id="position" name="position" value="${employee.position}" required>
    <label for="address">آدرس:</label>
    <input type="text" id="address" name="address" value="${employee.address}" required>
    <label for="phoneNumber">شماره تلفن:</label>
    <input type="tel" id="phoneNumber" name="phoneNumber" value="${employee.phoneNumber}" required>
    <label for="salary">حقوق:</label>
    <input type="number" id="salary" name="salary" value="${employee.salary}" required>
    <label for="soldConge">مرخصی موجود:</label>
    <input type="text" id="soldConge" name="soldConge" value="${employee.soldConge}" required>
    <label for="socialSecurityNumber">شماره بیمه :</label>
    <input type="text" id="socialSecurityNumber" name="socialSecurityNumber" value="${employee.socialSecurityNumber}" required>
    <input type="submit" class="eddit" value="ویرایش کارمند">
  </form>
  <a href="employee?action=list">بازگشت به لیست</a>
</div>
</body>
</html>