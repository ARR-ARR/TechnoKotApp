<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataBaseService.UserService" %>
<%@ page import="java.util.Map" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>


        * {
            box-sizing: border-box;
        }

        /* Add padding to containers */
        .container {
            padding: 16px;
            background-color: white;
        }

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        a {
            color: dodgerblue;
        }

        /* Set a grey background color and center the text of the "sign in" section */
        .signin {
            background-color: #f1f1f1;
            text-align: center;
        }
    </style>
</head>
<body>

<form action="./registration" method="post">
    <div class="container">
        <h1>Форма регистрации</h1>
        <p>Пожалуйста, заполните эту форму, чтобы создать учетную запись.</p>
        <hr>

        <label id="email"><b>Email</b></label>
        <input type="text" placeholder="Введите Email" name="email">

        <label id="login"><b>Логин</b></label>
        <input type="text" placeholder="Введите логин" name="login">

        <label id="password"><b>Пароль</b></label>
        <input type="password" placeholder="Введите пароль" name="password">

        <label id="fio"><b>Фамилия Имя Отчество</b></label>
        <input type="text" placeholder="Введите ФИО" name="fio">

        <hr>
        <div><p style="color: #ac2925">${loginMass}</p></div>

        <button type="submit" class="button">Регистрация</button>
    </div>

    <div class="container signin">
        <p>У вас уже есть учетная запись? <a href="./loginServlet">Войти</a>.</p>
    </div>
</form>
</body>
</html>