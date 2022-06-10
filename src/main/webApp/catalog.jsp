    <%@ page import="model.Product" %>
    <%@ page import="java.util.List" %>
    <%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="ru">
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
    <title>Каталог</title>


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
                <li class="current_page_item"><a href="./catalogServlet" accesskey="3" title="">Каталог</a></li>
                <li><a href="cart.jsp" accesskey="4" title="">Корзина</a></li>
                <li><a href="./loginServlet" accesskey="5" title="">Профиль</a></li>
            </ul>
        </div>
    </div>
</div>

<div id="wrapper">
    <div id="featured-wrapper2">
        <div id="featured" class="extra2 margin-btm2 container">
            <div class="main-title">
                <h2>Актуальные предложения</h2>
                <span class="byline">Воспользуйтесь фильтром или поиском</span></div>
        </div>
    </div>

    <div class="container contentTap">
        <div class="row">
            <div class="col-md-4">
                <div class="list-group">
                    <a href="./filterServlet?nameProduct=laptop" class="list-group-item">Ноутбуки</a>
                    <a href="./filterServlet?nameProduct=smartPhone" class="list-group-item">Телефоны</a>
                    <a href="./filterServlet?nameProduct=tablet" class="list-group-item">Планшеты</a>
                    <a href="./filterServlet?nameProduct=tv" class="list-group-item">Телевизоры</a>
                    <a href="./catalogServlet" class="list-group-item">Показать все</a>
                </div>
                <div class="list-group">
                    <form action="./filterServlet" method="post">
                        <input type="text" name="maxValue" class="list-group-item" placeholder="Максимальная цена" style=" width: 370px">
                        <input type="text" name="minValue" class="list-group-item" placeholder="Минимальная цена" style=" width: 370px">
                        <button type="submit" class="list-group-item">Показать результат</button>
                    </form>
                </div>
            </div>

            <div class="col-md-8 products">
                <div  class="row">
                    <%
                        List<Product> lp = (List<Product>) request.getAttribute("listProduct");
                        for (int i = 0; i < lp.size(); i++) {
                            Product p = lp.get(i);
                    %>
                    <div class="col-sm-4">
                        <div class="product">
                            <div class="product-img">
                                <a href="./addProductToCart?id=<%=p.getId() %>" met><img src=<%=p.getPage() %> alt=""></a>
                            </div>
                            <p class="product-title">
                                <a><%=p.getBrand() %>
                                </a>
                            </p>
                            <p class="product-desc"><%=p.getDescription() %>
                            </p>
                            <p class="product-price">Цена: ₽ <%=p.getPrice() %>
                            </p>

                        </div>
                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>
    </div>
</div>
<div id="copyright" class="container">
    <p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a
            href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function () {


    });
</script>
</body>
</html>