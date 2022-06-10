<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> cartProduct = (List<Product>) session.getAttribute("cart");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Корзина</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <link href="default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="styleProfile.css" rel="stylesheet" type="text/css" media="all"/>

    <link href="default_ie6.css" rel="stylesheet" type="text/css"/>
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
                <li class="current_page_item"><a href="cart.jsp" accesskey="4" title="">Корзина</a></li>
                <li><a href="./loginServlet" accesskey="5" title="">Профиль</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="wrapper">
    <br>
    <br>
    <br>
    <br>
    <div align="center">
        <table class="iksweb">
            <tbody>
            <%if (cartProduct != null) {%>
            <tr>
                <th>Тип продукта</th>
                <th>Брэнд</th>
                <th>Описание</th>
                <th>Цена</th>
                <th>Ссылка</th>
                <th></th>
            </tr>
            <%
                double sum = 0;
                for (int i = 0; i < cartProduct.size(); i++) {
                    Product p = cartProduct.get(i);
            %>
            <tr>
                <td align="center"><%=p.getNameProduct()%>
                </td>
                <td align="center"><%=p.getBrand()%>
                </td>
                <td align="center"><%=p.getDescription()%>
                </td>
                <td align="center"><%=p.getPrice()%>
                </td>
                <td align="center"><a href="./showProduct?id=<%=i%>">Подробнее</a>
                </td>
                <td align="center">
                    <button class="button-little"><a href="./removeProduct?id=<%=i%>">Удалить</a></button>
                </td>

                <%sum += cartProduct.get(i).getPrice();%>

            </tr>
            <% }%>

            </tbody>
        </table>
        <p>Итоговая сумма заказа : <%= sum%>
        </p>

        <div>
            <button class="button"><a href="./payServlet"> Оплатить </a></button>
        </div>


        <% } else {%>
        <br>
        <p>Корзина пуста</p>
        <br>
        <br>
        <br>
        <%
            }
        %>

    </div>
</div>
</body>
</html>