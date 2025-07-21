<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="./resources/css/cartsJob.css">
  <title>افزودن پیشنهاد شغلی</title>
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
  <h2>افزودن پیشنهاد شغلی</h2>
  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">${successMessage}</div>
  </c:if>
  <c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">${errorMessage}</div>
  </c:if>
  <form action="joboffre" method="post">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="recruiter_id" value="14">
    <div class="form-group">
      <label for="title">عنوان</label>
      <input type="text" name="title" id="title" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="description">توضیحات</label>
      <textarea name="description" id="description" class="form-control" required></textarea>
    </div>
    <div class="form-group">
      <label for="postDate">تاریخ ارسال</label>
      <input type="date" name="postDate" id="postDate" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="status">وضعیت</label>
      <select name="status" id="status" class="form-control" required>
        <option value="Open">باز</option>
        <option value="Closed">بسته</option>
      </select>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-primary">
        <i class="fas fa-plus"></i> افزودن پیشنهاد شغلی
      </button>
    </div>
  </form>
  <div>
    <a href="joboffre?action=list" class="back-link">بازگشت به لیست پیشنهادات شغلی</a>
  </div>
</div>
</body>
</html>