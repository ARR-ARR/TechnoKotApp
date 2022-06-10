<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TechnoKot</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <link href="default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all"/>


    <!--[if IE 6]>
    <link href="default_ie6.css" rel="stylesheet" type="text/css"/><![endif]-->

</head>
<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><span class="fa fa-bolt"></span><a href="#">Techno Kot</a></h1>
        </div>
        <div id="menu">
            <ul>
                <li><a href="index.html" accesskey="1" title="">Главная</a></li>
                <li><a href="#" accesskey="2" title="">О магазине</a></li>
                <li><a href="./catalogServlet" accesskey="3" title="">Каталог</a></li>
                <li><a href="cart.jsp" accesskey="4" title="">Корзина</a></li>
                <li class="current_page_item"><a href="./profile.jsp" accesskey="5" title="">Профиль</a></li>
            </ul>
        </div>
    </div>
</div>

<div id="wrapper">
    <div id="featured-wrapper">

        <div class="modal">
            <form  action="./loginServlet" method="post" class="form-log">
                <h1 class="form_title">Вход в учетную запись</h1>
                <div class="form_grup">
                    <input class="form_input" type="text" name="login" placeholder="Логин">
                </div>
                <div class="form_grup">
                    <input class="form_input" type="password" name="password" placeholder="Пароль">
                </div>
                <button class="form_button">Войти</button>
            </form>
        </div>
    </div>
</div>
<div id="copyright" class="container">
    <p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a
            href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
</body>
</html>
