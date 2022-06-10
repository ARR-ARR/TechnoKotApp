<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Пополнение счета</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <link href="default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="styleProfile.css" rel="stylesheet" type="text/css" media="all"/>

    <!--[if IE 6]>
    <link href="default_ie6.css" rel="stylesheet" type="text/css"/><![endif]-->
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
                <li><a href="#" accesskey="2" title="">О магазине</a></li>
                <li><a href="./catalogServlet" accesskey="3" title="">Каталог</a></li>
                <li><a href="cart.jsp" accesskey="4" title="">Корзина</a></li>
                <li class="current_page_item"><a href="./loginServlet" accesskey="5" title="">Профиль</a></li>
            </ul>
        </div>
    </div>
</div>

<div style="padding: 16px; background-color: white;">
    <form action="./addingMoney" method="post">
        <div class="container">
            <h1>Форма добавления денежных средств</h1>
            <p>Пожалуйста, заполните эту форму, чтобы пополнить баланс.</p>
            <hr>

            <label id="card"><b>Номер банковской карты</b></label>
            <input type="text" placeholder="0000 0000 0000 0000" name="card">

            <label id="data"><b>Срок действия</b></label>
            <input type="text" placeholder="MM/YY" name="data">

            <label id="cvc"><b>Код</b></label>
            <input type="text" placeholder="CVV2/CVC2" name="cvc">

            <label id="sum"><b>Сумма</b></label>
            <input type="text" placeholder="Сумма, ₽" name="sum">

            <hr>
            <div><p style="color: #2f771a">${sumMass}</p>
            </div><div><p style="color: #2f771a">${newSum}</p></div>

            <button type="submit" class="button">Отправить</button>
        </div>
    </form>
    <div><p style="font-size: 20pt; " align="center"><a href="cart.jsp">Вернуться в корзину</a></p></div>

</div>
</body>
</html>
