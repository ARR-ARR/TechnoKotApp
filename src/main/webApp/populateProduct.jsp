<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Страница [ADMIN]</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <link href="default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="styleProfile.css" rel="stylesheet" type="text/css" media="all"/>

    <link href="default_ie6.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>


        * {
            box-sizing: border-box;
        }

        /* Add padding to containers */
        .container-form {

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
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><span class="fa fa-bolt"></span><a href="#">Techno Kot</a></h1>
        </div>
        <div id="menu">
            <ul>
                <li><a href="index.html" accesskey="1" title="">Главная</a></li>
                <li class="current_page_item"><a href="#" accesskey="4" title="">Меню управления</a></li>

            </ul>
        </div>
    </div>
</div>
<div style="padding: 16px; background-color: white;">
    <form action="./populateProduct" method="post">
        <div class="container">
            <h1>Форма добавления продукта</h1>
            <p>Пожалуйста, заполните форму для добавления товара в ассортимент.</p>
            <hr>
            <div>
                <label><b>Категория продукта</b></label><br>
                <input type="radio" id="laptop" name="nameProduct" value="laptop">
                <label for="laptop">Ноутбук</label><br>
                <input type="radio" id="smartPhone" name="nameProduct" value="smartPhone">
                <label for="smartPhone">Смартфон</label><br>
                <input type="radio" id="tv" name="nameProduct" value="tv">
                <label for="tv">Телевизор</label><br>
                <input type="radio" id="tablet" name="nameProduct" value="tablet">
                <label for="tablet">Планшет</label>
                <br>
                <br>
            </div>

            <label id="brand"><b>Брэнд</b></label>
            <input type="text" placeholder="Введите бренд" name="brand">

            <label id="price"><b>Цена</b></label>
            <input type="text" placeholder="Введите цену в рублях" name="price">

            <label id="description"><b>Описание</b></label>
            <input type="text" placeholder="Введите описание" name="description">

            <label id="page"><b>Путь к изображению</b></label>
            <input type="text" placeholder="Введите путь к файлу (img/page.png)" name="page">

            <hr>

            <div><p style="color: #2f771a">${populateMass}</p></div>


            <button type="submit" class="button">Добавить</button>
        </div>
    </form>
</div>

</body>
</html>
