<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>به زودی اضافه میشه</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@100..900&display=swap" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'Vazir';
            src: url('D:/Downloads/fonts/ttf/Vazirmatn-Bold.ttf') format('truetype');
        }
        body {
            font-family: 'Vazirmatn', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #FFFFFF;
            text-align: right;
        }
        .container {
            text-align: center;
            background: rgba(50, 50, 50, 0.9);
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }
        h1 {
            font-size: 48px;
            margin: 0;
            animation: fadeIn 1s;
            color: #ff69b4;
        }
        p {
            font-size: 20px;
            margin: 1rem 0;
            animation: fadeIn 1.5s;
            color: #f0f0f0;
        }
        a {
            text-decoration: none;
            color: #ff69b4;
            font-weight: bold;
            transition: color 0.3s;
        }
        a:hover {
            color: #ffcc00;
        }
        .emoji {
            font-size: 100px;
            animation: bounce 1s infinite;
        }
        .border-animation {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            border: 10px solid #ff69b4;
            border-radius: 20px;
            animation: pulse 2s infinite;
            z-index: -1;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes pulse {
            0% { border-color: rgba(255, 105, 180, 1); }
            50% { border-color: rgba(255, 105, 180, 0.5); }
            100% { border-color: rgba(255, 105, 180, 1); }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="border-animation"></div>
    <div class="emoji">😊</div>
    <h1>این قابلیت به زودی اضافه میشه !</h1>
    <p>برای همکاری با <a href="itsmandali@gmail.com">این ایمیل تماس بگیرید</a>.</p>
    <p><a href="/">بازگشت به صفحه اصلی</a></p>
</div>
<script>
    const quotes = [
    ];
    const randomQuote = quotes[Math.floor(Math.random() * quotes.length)];
    const quoteParagraph = document.createElement('ppharagraph');
    quoteParagraph.textContent = randomQuote;
    document.querySelector('.container').appendChild(quoteParagraph);
</script>
</body>
</html>