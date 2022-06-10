<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Каталог товаров</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--[if lt IE 9]><![endif]-->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <link href="default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all"/>
    <title>Подробно</title>


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
                <li><a href="./loginServlet" accesskey="5" title="">Профиль</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container contentTap">
    <div class="row">
        <div class="col-md-8 products">
            <div class="row">
<% Product product = (Product) request.getAttribute("product"); %>
                <div class="col-sm-4">
                    <div class="product">
                        <div class="product-img">
                            <img src=<%=product.getPage()%> alt="">
                        </div>
                        <p class="product-title">
                            <a><%=product.getBrand()%>
                            </a>
                        </p>
                        <p class="product-desc"><%=product.getDescription()%>
                        </p>
                        <p class="product-price">Цена: ₽ <%=product.getPrice()%>
                        </p>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div align="center"><a href="cart.jsp">Вернуться назад</a></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function () {


    });
</script>
</body>
</html>
