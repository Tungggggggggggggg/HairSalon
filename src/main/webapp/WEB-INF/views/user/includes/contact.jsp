<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Liên hệ</title>
        <link rel="stylesheet" href="/user_style/css/contact.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMpjLNf1eDlyz2bY5b6zZs5+fgh4zPPXVVQpHT"
            crossorigin="anonymous"
        />
    </head>
    <body>
        <button id="contact-button"><i class="fas fa-phone"></i></button>

        <div id="contact-popup">
            <a href="https://zalo.me" class="contact-option zalo">
                <img
                    width="16"
                    height="16"
                    src="/user_style/images/zalo.png"
                    alt="zalo"
                />
                <span>Chat trên Zalo</span>
            </a>
            <a
                href="https://www.facebook.com/JSalonnn/"
                class="contact-option facebook"
            >
                <i class="fab fa-facebook"></i>
                <span>Chat trên Facebook</span>
            </a>
            <a href="#" class="contact-option phone">
                <i class="fas fa-phone"></i>
                <span>Hotline: 0123456789</span>
            </a>
        </div>
        <script src="/user_style/js/contact.js"></script>
    </body>
</html>
